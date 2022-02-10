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

