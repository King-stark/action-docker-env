# WARP+ 推荐奖励 Telegram Bot
> 利用 Telegram Bot 获取 WARP+ 推荐奖励流量并通知用户



```
mkdir warp && cd warp

# 按照以下内容创建文件 touch config.json
{
    "TOKEN": "# Telegram bot API Token (可在 @botfather 获取，如 10xxx4:AAFcqxxxxgER5uw)",
    "USER_ID": "# Telegram 用户 ID (给 @getidsbot 发送 /start 获取到的纯数字 ID，如 1434078534)",
    "GIFT_LIMIT": "# 限制其他用户单次刷取次数，如 10，不限制则输入 0",
    "REFERRER": "# WARP 应用 (如 1.1.1.1) 内的设备 ID"
}

# 建立docker容器
cd ..
docker run -dit \
-v $PWD/warp:/app/Config \
--restart unless-stopped \
--hostname warpplus \
--name warp \
clearloves/warpplus
```
