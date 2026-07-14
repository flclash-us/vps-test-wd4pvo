#!/bin/bash
# VPS 性能基准测试脚本
set -e

echo "========================================"
echo " VPS 性能基准测试 - 开始测试"
echo "========================================"

echo -e "\n[系统信息]"
cat /etc/os-release | grep PRETTY_NAME
echo "内核: $(uname -r)"
echo "CPU: $(grep model\\ name /proc/cpuinfo | head -1 | cut -d: -f2)"
echo "CPU核心数: $(nproc)"

if command -v sysbench &> /dev/null; then
    echo -e "\n[开始CPU测试]"
    sysbench cpu --cpu-max-prime=20000 --time=30 run
else
    echo "sysbench 未安装，跳过CPU测试"
fi

echo -e "\n[开始磁盘IO测试]"
dd if=/dev/zero of=test bs=64k count=16k oflag=direct 2>&1 | tail -1
rm -f test

echo -e "\n[测试完成]"