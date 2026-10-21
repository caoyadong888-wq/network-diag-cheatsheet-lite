# Network Diagnosis Cheatsheet (Lite)

## English

Two tools and a short checklist. Ping asks about ICMP echo replies. `ss` lists listening sockets on this host. `local_listen.sh` prints a listener file and a resolver file and does not send packets.

This subset has no traceroute, mtr, dig, tcpdump, or curl notes, and it does not print addresses or routes.

### Deliverables

- `deliverables/ping-and-ss.md` — ping and ss in English and Chinese
- `deliverables/short-checklist.md` — boxes for local state and when to stop
- `deliverables/local_listen.sh` — listener and resolver output
- `examples/fixture/hostname.txt` — lab host name
- `examples/fixture/listen.txt` — lab listener
- `examples/fixture/resolv.conf` — lab resolver file
- `examples/listen_stdout.txt` — captured fixture-mode output

### Quick start

```bash
NETDIAG_FIXTURE=examples/fixture bash deliverables/local_listen.sh
```

Requires bash. Python is not required. No network access for the fixture command.

The lab listener is `192.0.2.10:22`. The lab resolver is `192.0.2.53`. Both are RFC 5737 documentation addresses.

## 中文

两个工具和一份短清单。ping 问的是 ICMP echo 应答。`ss` 列出这台主机上的监听套接字。`local_listen.sh` 打印监听文件和解析器文件，不发包。

精简版没有 traceroute、mtr、dig、tcpdump 或 curl 的说明，也不打印地址和路由。

### 交付文件

- `deliverables/ping-and-ss.md` — ping 和 ss 的中英说明
- `deliverables/short-checklist.md` — 本机状态和停止条件
- `deliverables/local_listen.sh` — 监听和解析器输出
- `examples/fixture/hostname.txt` — 实验主机名
- `examples/fixture/listen.txt` — 实验监听
- `examples/fixture/resolv.conf` — 实验解析器文件
- `examples/listen_stdout.txt` — fixture 模式的采集输出

### 快速开始

```bash
NETDIAG_FIXTURE=examples/fixture bash deliverables/local_listen.sh
```

需要 bash。不需要 Python。fixture 这条命令不访问网络。

实验监听是 `192.0.2.10:22`。实验解析器是 `192.0.2.53`。两者都是 RFC 5737 文档地址。

Full version: GUMROAD_URL
