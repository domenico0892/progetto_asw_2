FROM node:latest

RUN apt-get update
RUN apt-get -y install sudo
# Create app directory
RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

# Install app dependencies
#COPY package.json /usr/src/app/

#COPY bower.json /usr/src/app/
COPY . /usr/src/app
RUN npm install

RUN npm install -g bower
#RUN npm remove bower

RUN sudo bower install --allow-root
# Bundle app source


EXPOSE 3000

#CMD [ "node", "server.js" ]

