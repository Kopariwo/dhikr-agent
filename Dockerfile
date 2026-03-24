FROM node:22-slim
RUN npm install -g openclaw@latest
WORKDIR /app
ENV OPENCLAW_GATEWAY_BIND=0.0.0.0
ENV PORT=7860
CMD ["/bin/sh", "-c", "openclaw config set gateway.mode local && openclaw config set channels.telegram.botToken $TELEGRAM_BOT_TOKEN && openclaw pairing approve telegram C7SZ7KXV || true && openclaw gateway --allow-unconfigured"]
