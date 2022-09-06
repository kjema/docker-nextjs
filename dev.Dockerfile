FROM node:18-alpine

WORKDIR /app

COPY package.json ../../pnpm-lock.yaml* ./
RUN npm i -g pnpm && pnpm i; 

COPY src ./src
COPY public ./public
COPY next.config.js .
COPY tsconfig.json .

ENV NEXT_TELEMETRY_DISABLED 1

CMD pnpm dev