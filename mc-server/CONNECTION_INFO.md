# Minecraft 服务器连接信息

## 🎮 服务器信息

- **服务器名称**: My Minecraft Server - Public Access
- **服务器版本**: Paper 1.21.11 (支持 1.21.11 客户端)
- **服务器类型**: 生存模式 (Survival)
- **最大玩家数**: 50

## 🌐 连接地址

- **公网 IP**: `124.222.107.84`
- **端口**: `25565`
- **连接地址**: `124.222.107.84:25565`

## 👤 管理员账号

- **管理员用户名**: `AdminUser`
- **管理员权限**: OP 等级 4 (最高权限)
- **密码**: 无需密码（首次进入服务器即自动成为管理员）

> ⚠️ **重要说明**: Minecraft 服务器管理员是通过用户名授权的。当用户名为 `AdminUser` 的玩家首次进入服务器时，该玩家将自动拥有管理员权限。不需要单独的管理员密码。

## 🔧 RCON 远程管理（可选）

- **RCON 端口**: `25575`
- **RCON 密码**: `mcadmin2024secure`

## 📋 常用管理员命令

进入服务器后，使用以下命令（按 T 键打开聊天框输入）：

```
/gamemode creative          # 切换到创造模式
/gamemode survival          # 切换到生存模式
/give @a diamond 64         # 给所有玩家 64 个钻石
/tp @p 100 64 100          # 传送到坐标
/time set day              # 设置为白天
/weather clear             # 清除天气
/op <玩家名>               # 给予其他玩家管理员权限
/deop <玩家名>             # 移除管理员权限
/stop                      # 关闭服务器
```

## 🚀 服务器管理

### 查看服务器状态
```bash
screen -r mcserver
```

### 重启服务器
```bash
cd /root/.openclaw/workspace/mc-server
screen -S mcserver -X quit
./start.sh
```

### 查看日志
```bash
tail -f /root/.openclaw/workspace/mc-server/logs/latest.log
```

## 🔒 安全说明

- 服务器运行在离线模式（offline-mode=false），允许未正版验证的玩家连接
- 管理员账号 `AdminUser` 已创建，首次使用该用户名登录即获得 OP 权限
- 建议修改 RCON 密码以增强安全性

---

**服务器位置**: `/root/.openclaw/workspace/mc-server`
**启动脚本**: `./start.sh`
