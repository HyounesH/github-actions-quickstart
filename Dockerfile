FROM node:18-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json for dependency installation
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application source code
COPY . .

# Build the application
RUN npm run build

# Use a minimal Node.js runtime image for the production build
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy only the build output and necessary files
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package*.json ./

# Install only production dependencies
RUN npm install --only=production

# Expose the port your app will run on (e.g., 3000)
EXPOSE 3000

# Define the command to run the application
CMD ["node", "dist/index.js"]
