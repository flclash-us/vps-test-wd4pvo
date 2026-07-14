# VPS 性能基准测试脚本 wd4pvo

[中文版] 一键测试 VPS 性能：CPU跑分、内存读写、磁盘IO、网络速度。

## 功能特性

- CPU 型号检测 + sysbench 跑分
- 内存读写速度测试
- 磁盘 IO 读写速度
- 全球多节点网络测速
- 系统信息汇总报告

## 使用方法

wget -qO- https://raw.githubusercontent.com/flclash-us/vps-guide-wd4pvo/main/benchmark.sh | bash

或者下载后运行：

curl -sLO https://raw.githubusercontent.com/flclash-us/vps-guide-wd4pvo/main/benchmark.sh
chmod +x benchmark.sh
./benchmark.sh

## 测试项目说明

### 1. CPU 测试
sysbench cpu --cpu-max-prime=20000 --time=30 run

### 2. 内存测试
sysbench memory --memory-block-size=1M --memory-total-size=4G run

### 3. 磁盘 IO 测试
dd if=/dev/zero of=test bs=64k count=16k oflag=direct
rm -f test

### 4. 网络速度测试
curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3

## 测试结果解读

| 项目 | 优质 VPS | 一般 VPS | 较差 VPS |
|------|---------|---------|---------|
| CPU 单核 | >3000分 | 1500-3000 | <1500 |
| 内存读写 | >5 GB/s | 2-5 GB/s | <2 GB/s |
| 磁盘顺序读 | >500 MB/s | 200-500 MB/s | <200 MB/s |

## 推荐 VPS 服务商

- 搬瓦工: https://bandwagonhost.com/ (CN2 GIA 线路)
- Vultr: https://vultr.com/ (全球节点，按小时计费)
- DigitalOcean: https://digitalocean.com/ (稳定可靠)

## 许可证

MIT License

推荐工具

- [Clash for Windows](https://clashforwindows.site/) - Windows 最流行的 Clash 图形化客户端
- [ClashMI](https://clashmi.site/) - 轻量级 Clash 客户端，支持多平台
- [FlClash](https://flclash.us/) - 现代代理工具，支持多种协议