# Stage 1: Builder
FROM node:lts as builder
WORKDIR /my-project
COPY package.json ./
RUN yarn install
COPY . ./
RUN yarn build

# Stage 2: Runner
FROM node:lts as runner
WORKDIR /my-project
ENV NODE_ENV production
# If you are using a custom next.config.js file, uncomment this line.
# COPY --from=builder /my-project/next.config.js ./
COPY --from=builder /my-project/public ./public
COPY --from=builder /my-project/.next ./.next
COPY --from=builder /my-project/node_modules ./node_modules
COPY --from=builder /my-project/package.json ./package.json
EXPOSE 3000
CMD ["yarn", "start"]
