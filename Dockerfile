FROM node
WORKDIR /app
COPY package.json .
RUN yarn install 
COPY . .
ENV REACT_APP_FOOD=sate
EXPOSE 3000
CMD ["yarn", "start"]