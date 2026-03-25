#!/bin/sh

mkdir -p /root/.openclaw/skills

cp -r /app/skills/* /root/.openclaw/skills/

cat > /root/.openclaw/openclaw.json << ENDCONFIG
{
  "gateway": {
    "mode": "local",
    "bind": "0.0.0.0"
  },
  "channels": {
    "telegram": {
      "botToken": "TELEGRAM_PLACEHOLDER",
      "dmPolicy": "open",
      "allowFrom": ["*"]
    }
  },
  "providers": {
    "anthropic": {
      "apiKey": "ANTHROPIC_PLACEHOLDER"
    }
  }
}
ENDCONFIG

sed -i "s/TELEGRAM_PLACEHOLDER/$TELEGRAM_BOT_TOKEN/" /root/.openclaw/openclaw.json
sed -i "s/ANTHROPIC_PLACEHOLDER/$ANTHROPIC_API_KEY/" /root/.openclaw/openclaw.json

echo "Config written successfully!"
echo "Skills installed:"
ls -la /root/.openclaw/skills/

openclaw gateway --allow-unconfigured
