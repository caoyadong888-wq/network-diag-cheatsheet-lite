#!/usr/bin/env bash
# Print listeners and the resolver file. This script does not send packets.
# Fixture mode: NETDIAG_FIXTURE with hostname.txt, listen.txt, and resolv.conf.
# Live mode prints ss -lntu and /etc/resolv.conf. ss -lntu is iproute2.
# If that flag is rejected, check upstream docs.
set -euo pipefail

die() {
  printf 'error: %s\n' "$1" >&2
  exit 2
}

print_file() {
  local title="$1"
  local path="$2"
  local line
  printf '## %s\n' "${title}"
  while IFS= read -r line || [[ -n "${line}" ]]; do
    printf '%s\n' "${line}"
  done < "${path}"
}

if [[ -n "${NETDIAG_FIXTURE:-}" ]]; then
  root="${NETDIAG_FIXTURE}"
  [[ -d "${root}" ]] || die "fixture directory missing"
  for name in hostname.txt listen.txt resolv.conf; do
    [[ -f "${root}/${name}" ]] || die "missing ${name}"
  done
  printf 'network-listen-local\n'
  printf 'mode: fixture\n'
  host=""
  IFS= read -r host < "${root}/hostname.txt" || true
  [[ -n "${host}" ]] || die "empty hostname"
  printf 'hostname: %s\n' "${host}"
  print_file listening "${root}/listen.txt"
  print_file resolver "${root}/resolv.conf"
else
  command -v ss >/dev/null 2>&1 || die "ss is not installed"
  command -v hostname >/dev/null 2>&1 || die "hostname is not installed"
  [[ -r /etc/resolv.conf ]] || die "resolver file is not readable"
  printf 'network-listen-local\n'
  printf 'mode: live\n'
  printf 'hostname: %s\n' "$(hostname)"
  printf '## listening\n'
  ss -lntu
  print_file resolver /etc/resolv.conf
fi

printf '## next\n'
printf 'Read the short checklist before any probe.\n'
printf 'This script did not send packets.\n'
