FROM node:20-alpine AS build-env

WORKDIR /app

COPY . .

RUN npm ci &&\
    npm run build

FROM node:20-alpine

WORKDIR /app

COPY --from=build-env /app /app

EXPOSE 3096

ENV NODE_ENV=production

CMD ["node", "dist/src/index.js"]
