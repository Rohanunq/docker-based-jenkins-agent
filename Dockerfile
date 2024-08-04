FROM node:16-alpine

# Update the package list and install git and curl
RUN apk update && apk add --no-cache git curl

# Set the working directory
WORKDIR /home/jenkins

# Check the versions of git and curl
RUN git --version && curl --version

# Default command to keep the container running or start your application
CMD ["sh"]
