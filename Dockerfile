FROM node:22-slim
RUN npm install -g openclaw@latest
WORKDIR /app
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh
ENV PORT=7860
CMD ["/app/start.sh"]
