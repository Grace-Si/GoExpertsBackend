FROM node:12

# Create app directory
WORKDIR /app

# Install app dependencies
COPY package*.json ./
RUN npm install && npm cache clean --force

# Bundle app source
COPY . .
RUN npm run build

# Copy the tail-logs script and make it executable
COPY tail-logs.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/tail-logs.sh

EXPOSE 5000
CMD ["/usr/local/bin/tail-logs.sh", "npm", "start"]

