FROM node:22-slim
RUN npm install -g openclaw@latest
RUN apt-get update && apt-get install -y curl python3 && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY skills/ /app/skills/
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh
ENV PORT=7860
CMD ["/app/start.sh"]
