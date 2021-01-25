# Use NodeJS base image
FROM node:13

# Create app directory
WORKDIR /usr/src/app

# ARGS
ARG POSTGRES_HOST=${POSTGRES_HOST}
ENV POSTGRES_HOST=${POSTGRES_HOST}

ARG POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}

ARG POSTGRES_USERNAME=${POSTGRES_USERNAME}
ENV POSTGRES_USERNAME=${POSTGRES_USERNAME}

ARG POSTGRES_DB=${POSTGRES_DB}
ENV POSTGRES_DB=${POSTGRES_DB}

ARG JWT_SECRET=${JWT_SECRET}
ENV JWT_SECRET=${JWT_SECRET}

ARG AWS_BUCKET=${AWS_BUCKET}
ENV AWS_BUCKET=${AWS_BUCKET}

ARG AWS_PROFILE=${AWS_PROFILE}
ENV AWS_PROFILE=${AWS_PROFILE}

ARG AWS_REGION=${AWS_REGION}
ENV AWS_REGION=${AWS_REGION}

# Copy the project
COPY . .

# Install dependencies
RUN npm install

#Compile typescript
RUN npm run tsc

# Bind the port that the image will run on
ENV PORT=8081
EXPOSE 8081

# Define the Docker image's behavior at runtime
CMD ["node", "www/server.js"]
