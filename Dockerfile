FROM node:20.14.0 as base

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json first for better caching
COPY package*.json ./

FROM base as development

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose the application port
EXPOSE 3000

# Run the application
CMD ["npm", "run", "serve", "--disable-host-check"]