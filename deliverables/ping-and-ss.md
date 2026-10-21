# Ping and ss

A short subset: ICMP echo, and local listening sockets.
Examples use `example.com` or `192.0.2.10`. This file does not run the commands.

## Ping

### English

Ping asks whether a host sent an ICMP echo reply.
It does not prove that a TCP or UDP service is up.

Command shape for iputils ping. Other ping binaries differ. check upstream docs.

```bash
ping -c 4 -W 2 example.com
```

On iputils, `-c` is how many echoes to send and `-W` is how many seconds to wait.
If `ping -h` does not list them, check upstream docs.
Read the received count. Zero means no echo reply was seen.

### 中文

ping 问的是对方有没有回 ICMP echo。
它不能证明 TCP 或 UDP 服务是好的。

下面是 iputils ping 的形状。别的 ping 不一样。check upstream docs。

```bash
ping -c 4 -W 2 example.com
```

在 iputils 上，`-c` 是发送个数，`-W` 是等待秒数。
`ping -h` 里没有这两项时，check upstream docs。
看接收计数。零表示没有看到 echo 应答。

## ss

### English

iproute2 `ss` shows sockets on this host. `netstat` is a different program.

```bash
ss -lntu
```

`-l` listening, `-n` numeric, `-t` TCP, `-u` UDP.
If a flag is missing, check upstream docs.

Filled shape, documentation address, not a live capture:

```text
tcp LISTEN 192.0.2.10:22
```

A listening row does not mean a remote client can reach it.
`local_listen.sh` prints a listener file and the resolver file. It does not send packets.

### 中文

iproute2 的 `ss` 显示这台主机上的套接字。`netstat` 是另一个程序。

```bash
ss -lntu
```

`-l` 监听，`-n` 数字，`-t` TCP，`-u` UDP。
缺了某个参数时，check upstream docs。

填好的样子，文档地址，不是现网采集：

```text
tcp LISTEN 192.0.2.10:22
```

有监听行不代表远端客户能连上。
`local_listen.sh` 只打印监听文件和解析器文件，不发包。
