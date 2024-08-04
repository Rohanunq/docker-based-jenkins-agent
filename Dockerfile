# Use a base image with Java and Maven preinstalled
FROM maven:3.8.6-openjdk-17-slim

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    curl \
    unzip \
    gnupg \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# # Install AWS CLI
# RUN curl "https://d1uj6qtbmh3dt5.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
#     unzip awscliv2.zip && \
#     sudo ./aws/install && \
#     rm awscliv2.zip

# # Install Helm
# RUN curl https://baltocdn.com/helm/signing.asc | apt-key add - && \
#     apt-get install -y apt-transport-https && \
#     echo "deb https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm.list && \
#     apt-get update && \
#     apt-get install -y helm

# Set up user and workspace
RUN useradd -m jenkins
USER jenkins
WORKDIR /home/jenkins

# Entry point for the container
ENTRYPOINT ["sleep", "infinity"]
