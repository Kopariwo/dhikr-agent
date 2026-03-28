#!/bin/sh

mkdir -p /root/.openclaw/skills

cp -r /app/skills/* /root/.openclaw/skills/

cat > /root/.openclaw/openclaw.json << ENDCONFIG
{
  "env": {
    "ANTHROPIC_API_KEY": "ANTHROPIC_PLACEHOLDER"
  },
  "agents": {
    "defaults": {
      "model": {
        "primary": "anthropic/claude-haiku-4-5"
      }
    }
  },
  "channels": {
    "telegram": {
      "enabled": true,
      "botToken": "TELEGRAM_PLACEHOLDER",
      "dmPolicy": "pairing",
      "allowFrom": ["8738376095"]
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
