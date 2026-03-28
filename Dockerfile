FROM node:22-slim
RUN npm install -g openclaw@latest
RUN apt-get update && apt-get install -y curl python3 python3-pip && rm -rf /var/lib/apt/lists/*
RUN pip install py-clob-client requests --break-system-packages
WORKDIR /app
COPY skills/ /app/skills/
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh
ENV PORT=7860
CMD ["/app/start.sh"]
