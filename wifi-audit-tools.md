# WiFi 安全审计工具安装报告

**安装时间**: 2026-06-19 21:01 CST  
**系统**: Ubuntu 22.04.5 LTS  
**状态**: ✅ 完成

---

## 📦 已安装工具

| 工具 | 版本 | 路径 | 用途 |
|------|------|------|------|
| Aircrack-ng | 1.6+git20210130 | `/usr/bin/aircrack-ng` | 抓包、注入、破解 |
| Wifite2 | 2.6.0 | `/usr/sbin/wifite` | 自动化 WiFi 审计 |
| Reaver | 1.6.5 | `/usr/bin/reaver` | WPS 破解 |
| Wireshark | 3.6.2 | `/usr/bin/wireshark` | 图形化数据包分析 |
| Tshark | 3.6.2 | `/usr/bin/tshark` | 命令行数据包分析 |
| Git | 2.34.1 | `/usr/bin/git` | 版本控制 |
| Python3 | 3.10.12 | `/usr/bin/python3` | 脚本运行 |

---

## 📁 重要目录

### 日志文件
- **APT 安装历史**: `/var/log/apt/history.log`
- **DPKG 日志**: `/var/log/dpkg.log`

### 配置目录
- **Aircrack-ng**: `~/.aircrack-ng/` (首次运行时创建)
- **Wifite**: `~/.wifite/` (首次运行时创建)
- **Wireshark**: `/usr/share/wireshark/`
- **Wireshark 插件**: `/usr/lib/wireshark/`

---

## 🚀 快速开始

### 检查无线网卡
```bash
sudo iwconfig
sudo iw dev
```

### 监听模式测试
```bash
# 查看无线接口
sudo iw dev

# 启用监听模式 (假设接口为 wlan0)
sudo ip link set wlan0 down
sudo iw wlan0 set monitor control
sudo ip link set wlan0 up
sudo iw dev
```

### Aircrack-ng 套件
```bash
# 开始抓包
sudo airodump-ng wlan0mon

# 针对特定 AP 抓包
sudo airodump-ng --bssid XX:XX:XX:XX:XX:XX -c 6 -w capture wlan0mon

# 破解 WEP
sudo aircrack-ng -b XX:XX:XX:XX:XX:XX capture-01.ivs

# 破解 WPA (需要字典)
sudo aircrack-ng -b XX:XX:XX:XX:XX:XX -w dictionary.txt capture-01.cap
```

### Wifite 自动化审计
```bash
# 自动扫描和攻击
sudo wifite

# 仅攻击 WPA
sudo wifite --wpa

# 仅攻击 WPS
sudo wifite --wps
```

### Reaver WPS 破解
```bash
sudo reaver -i wlan0mon -b XX:XX:XX:XX:XX:XX
```

### Wireshark/Tshark
```bash
# 图形界面
sudo wireshark

# 命令行抓包
sudo tshark -i wlan0mon -w capture.pcap

# 分析 pcap 文件
sudo tshark -r capture.pcap
```

---

## ⚠️ 重要提示

### 硬件要求
1. **无线网卡必须支持监听模式**
   - 推荐芯片：AR9271、RTL8812AU、RTL8814AU
   - 内置网卡通常不支持，需要外接 USB 网卡

2. **需要 root 权限**
   - 所有抓包和注入操作都需要 `sudo`

### 法律警告
- ✅ 仅测试**自己拥有**的网络
- ✅ 获得**书面授权**后进行测试
- ✅ 用于学习和安全研究
- ❌ **不要攻击他人网络**
- ❌ **不要用于非法目的**

---

## 🔧 故障排查

### 网卡不支持监听模式
```bash
# 检查网卡是否支持
sudo iw list | grep "Supported interface modes" -A 9
# 查看是否有 "monitor" 字样
```

### 驱动问题
```bash
# 查看网卡驱动
lspci -k | grep -A 3 -i network
# 或
lsusb -v | grep -A 5 -i wifi
```

### 安装驱动 (以 RTL8812AU 为例)
```bash
sudo apt install dkms
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au
sudo make dkms_install
```

---

## 📚 学习资源

- **Aircrack-ng 官方文档**: https://www.aircrack-ng.org/documentation.html
- **Wireshark 教程**: https://wiki.wireshark.org/
- **Kali Tools**: https://www.kali.org/tools/

---

**最后更新**: 2026-06-19  
**维护**: 系统管理员
