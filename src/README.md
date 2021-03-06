#### Create Dockerfile inside Project ReactJs

```Dockerfile
FROM node
WORKDIR /app
COPY package.json .
RUN yarn install 
COPY . .
EXPOSE 3000
CMD ["yarn", "start"]
```
## run command to build docker image
```zsh
 docker build -t react-image ./
```
## run command to check if that image exists
```zsh
 docker image ls
```
## run command to run Docker image without port
```zsh
 docker run -d --name react-app react-image
```
## run command to stop Docker image
```zsh
 docker rm react-app -f
```
## run command to run Docker image with port 3000:3000 by localhost
```zsh
 docker run -d -p 3000:3000 --name react-app react-image
```
## Run a command in a running container using bash
```zsh
 docker exec --it react-app bash
```
#### Create .dockerignore inside Project ReactJs
```.dockerignore
node_modules
Dockerfile
.git
.gitignore
.dockerignore
.env
```

## rebuild Docker image react-image with .dockerignore
```rebuild
docker build -t react-image ./
```
## run Image Container 
```Run Container
docker run -dp 3000:3000 --name react-app react-image
```
## Run a command in a running container using bash
```zsh
docker exec --it react-app bash
```

#### Ulang build Docker apabila terjadi perubahan di Source Code apps
```build
docker build -t react-image ./
```
## run Image Container 
```Run Container
docker run -dp 3000:3000 --name react-app react-image
```
## pwd command on pws, cmd, linux
```command pwd
${pwd} #on powershell
%cd% #on cmd
$(pwd) #on linux
```
#### Simpan new images build on local directory
```cmd
docker run -v /home/jojo/Javascript/npx-create-mf-app/docker-react/src:/app/src -d -p 3000:3000 --name react-app react-image
```
```cmd zsh linux
docker run -v $(pwd)/src:/app/src -d -p 3000:3000 --name react-app react-image
```

#### Simpan Container image build on local directory read-only
```
docker run -v $(pwd)/src:/app/src:ro -d -p 3000:3000 --name react-app react-image
```

#### Docker ENV on Dockerfil
``` Dockerfile
FROM node
WORKDIR /app
COPY package.json .
RUN yarn install 
COPY . .
ENV REACT_APP_NAME=imronxz
EXPOSE 3000
CMD ["yarn", "start"]
```
## Running command with Dockerfile ENVIRONMENT VARIABLES 
``` env run REACT_APP_NAME=imronxz
docker run -e REACT_APP_NAME=imronxz -v $(pwd)/src:/app/src:ro -dp 3000:3000 --name react-app react-image
```
#### Creating .env React-Project
- .env
```
REACT_APP_NAME=imronxz
```
## Running command with .env ENVIRONMENT VARIABLES
``` env run
docker run --env-file ./.env -v $(pwd)/src:/app/src -dp 3000:3000 --name react-app react-image
```

#### Creating docker-compose.yml
```yml
version: "3"
services:
  react-app: 
    build: .
    ports:
      - "3000:3000"
    volumes:
      - ./src:/app/src
    environment:
      - REACT_APP_NAME=imronxz
      # CHOKIDAR_USEPOLLING=true -> for windows root Docker
    # env_file:
    #   - ./.env
```
#### Run docker container with Compose
```
docker-compose up -d
```
#### Stop docker container with Compose
```
docker-compose down
```
#### Rebuild docker container with Compose
```
docker-compose up -d --build
```
## Multi-Stage Dockerfile - Dockerfile.dev & Dockerfile.prod
- Dockerfile.dev
```Dockerfile
FROM node
WORKDIR /app
COPY package.json .
RUN yarn install 
COPY . .
ENV REACT_APP_FOOD=sate
EXPOSE 3000
CMD ["yarn", "start"]
```
- Dockerfile.prod - with nginx

```Dockerfile
FROM node as build
WORKDIR /app
COPY package.json .
RUN yarn install 
COPY . .
ARG REACT_APP_NAME
ENV REACT_APP_NAME=$REACT_APP_NAME
RUN yarn build

FROM nginx
COPY --from=build /app/build /usr/share/nginx/html
```
## COPY from node as build, in /app/build Container then save to nginx directory
```Dockerfile
COPY --from=build /app/build /usr/share/nginx/html
```
#### Build Docker Image Dockerfile on Production
```
docker build -f Dockerfile.prod -t docker-image-prod .
```
#### Run Docker Container Production
```
docker run --env-file ./.env -dp 8080:80 --name react-app-prod react-image-prod
```
## Multi-Stage docker-compose - docker-compose-dev.yml & docker-compose-prod.yml
- docker-compose-dev.yml
```yml
version: "3"
services:
  react-app: 
    build:
      context: .
      dockerfile: Dockerfile.dev
    ports:
      - "3000:3000"
    volumes:
      - ./src:/app/src
    environment:
      - REACT_APP_NAME=imronxz-dev
      # CHOKIDAR_USEPOLLING=true -> for windows root Docker
    # env_file:
    #   - ./.env
```
- docker-compose-prod.yml
```yml
version: "3"
services:
  react-app: 
    build:
      context: .
      dockerfile: Dockerfile.prod
      args:
        - REACT_APP_NAME=imronxz-prod
    ports:
      - "8080:80"
    
    # env_file:
    #   - ./.env
```
## run build on dev mode
```
docker-compose -f docker-compose.yml -f docker-compose-dev.yml up -d --build
```
## run build on prod mode
```
docker-compose -f docker-compose.yml -f docker-compose-prod.yml up -d --build
```
## stop docker-compose dev/prod
```
docker-compose -f docker-compose.yml -f docker-compose-dev.yml down
```
