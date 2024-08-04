# Use an official Java runtime as a parent image
FROM openjdk:17-jdk-slim

# Set environment variables
ENV MAVEN_VERSION=3.8.6
ENV MAVEN_HOME=/opt/maven
ENV PATH=$MAVEN_HOME/bin:$PATH

# Install required packages: curl and tar
RUN apt-get update \
    && apt-get install -y curl tar \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Maven
RUN mkdir -p /opt \
    && curl -fsSL https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
    | tar -xzC /opt \
    && mv /opt/apache-maven-${MAVEN_VERSION} /opt/maven

# Install Git (optional, if you need it for checking out code)
RUN apt-get update \
    && apt-get install -y git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# Set up the Jenkins agent user
RUN groupadd -g 1000 jenkins \
    && useradd -u 1000 -g jenkins -m jenkins

USER jenkins

# Set the default working directory
WORKDIR /home/jenkins

# Default command to run when the container starts
ENTRYPOINT ["jenkins-agent"]

# Expose any ports if needed (e.g., for communication with Jenkins)
EXPOSE 50000
