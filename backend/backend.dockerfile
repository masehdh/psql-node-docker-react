FROM node:20

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY prisma ./prisma

RUN npx prisma generate

COPY . .

COPY .env .env

RUN npm run build

EXPOSE 4000

CMD ["npm", "run", "start"]