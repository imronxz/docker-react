#### Create .dockerignore inside Project ReactJs
```.dockerignore
node_modules
Dockerfile
.git
.gitignore
.dockerignore
.env
```
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
## run command to run Docker image with port 3000:3000 by localhost
```zsh
 docker run -d -p 3000:3000 --name react-app react-image
```
## Run a command in a running container using bash
```zsh
 docker exec --it react-app bash
```
## run command to stop Docker image
```zsh
 docker rm react-app -f
```
## pwd command on pws, cmd, linux
```command pwd
${pwd} #on powershell
%cd% #on cmd
$(pwd) #on linux
```
```cmd zsh linux
docker run -v $(pwd)/src:/app/src -d -p 3000:3000 --name react-app react-image
```

#### Simpan Container image build on local directory read-only
```
docker run -v $(pwd)/src:/app/src:ro -d -p 3000:3000 --name react-app react-image
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
