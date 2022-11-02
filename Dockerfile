# stage1 as builder
FROM node:10-alpine as builder

WORKDIR /app

# Copy the package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy rest of the files
COPY . .

# Build the project
RUN npm run build

# Copy from the stahg 1
VOLUME /app
EXPOSE 8080
CMD ["npm", "run", "serve"]