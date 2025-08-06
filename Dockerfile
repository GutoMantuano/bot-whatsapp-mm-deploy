FROM node:18

RUN apt-get update && apt-get install -y wget gnupg ca-certificates \
    && wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update && apt-get install -y google-chrome-stable fonts-liberation libgtk-3-0 libgbm1 libxss1 libasound2 libnss3 libcups2 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

CMD ["node", "index.js"]
