# base image
FROM node:16-alpine

# set working directory
WORKDIR /app

# add package.json to container
COPY package*.json ./

# install dependencies
RUN npm install

# add source code to container
COPY . .

# expose port
EXPOSE 3000

# start app
CMD ["npm", "run" ,"start"]