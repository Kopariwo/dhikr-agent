FROM node:22-slim
RUN npm install -g openclaw@latest
WORKDIR /app
ENV PORT=7860
CMD ["/bin/sh", "-c", "mkdir -p /root/.openclaw && echo '{\"gateway\":{\"mode\":\"local\",\"bind\":\"lan\"},\"channels\":{\"telegram\":{\"botToken\":\"'$TELEGRAM_BOT_TOKEN'\",\"dmPolicy\":\"open\",\"allowFrom\":[\"*\"]}}}' > /root/.openclaw/openclaw.json && openclaw gateway --allow-unconfigured"]
