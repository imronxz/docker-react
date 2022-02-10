FROM node
WORKDIR /app
COPY package.json .
RUN yarn install 
COPY . .
EXPOSE 3000
CMD ["yarn", "start"]