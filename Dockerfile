FROM node:22-slim
RUN npm install -g openclaw@latest
WORKDIR /app
ENV PORT=7860
CMD ["/bin/sh", "-c", "mkdir -p /root/.openclaw && echo '{\"gateway\":{\"mode\":\"local\",\"bind\":\"0.0.0.0\"}, ...}' > /root/.openclaw/openclaw.json && openclaw gateway --allow-unconfigured"]
```

**The fix is simple:** `0.0.0.0` is no longer a valid bind value — OpenClaw now uses named bind modes like `loopback`, `lan`, `tailnet`, `auto`, or `custom`.  Since you're on Railway and need external access via Telegram, you need `"lan"` instead of `"0.0.0.0"`.

Here's **Step 1** — let's update your Dockerfile on GitHub:

1. Go to your repo: **https://github.com/Kopariwo/dhikr-agent**
2. Click on the **Dockerfile**
3. Click the **pencil icon** (edit button) in the top right of the file
4. Replace the entire **CMD** line with this:
```
CMD ["/bin/sh", "-c", "mkdir -p /root/.openclaw && echo '{\"gateway\":{\"mode\":\"local\",\"bind\":\"lan\"},\"channels\":{\"telegram\":{\"botToken\":\"'$TELEGRAM_BOT_TOKEN'\",\"dmPolicy\":\"open\",\"allowFrom\":[\"*\"]}},\"providers\":{\"anthropic\":{\"apiKey\":\"'$ANTHROPIC_API_KEY'\"}}}' > /root/.openclaw/openclaw.json && openclaw gateway --allow-unconfigured"]
