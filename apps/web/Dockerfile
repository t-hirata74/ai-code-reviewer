# Development Dockerfile for Next.js
FROM node:20-alpine

WORKDIR /app

# Install dependencies
COPY package.json package-lock.json* ./
RUN npm install

# Copy source code
COPY . .

EXPOSE 3000

# Start development server
CMD ["npm", "run", "dev"]