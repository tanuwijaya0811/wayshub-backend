FROM node:12-alpine

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# tambahkan sequelize-cli global (versi terakhir yg support Node 12)
RUN npm install -g sequelize-cli@6.6.0

# jalankan pakai node biasa, bukan nodemon
ENV NODE_ENV=production
EXPOSE 5000
CMD ["node", "index.js"]
