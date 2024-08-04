pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build('jenkins-agent:latest', '-f Dockerfile .')
                }
            }
        }

        stage('Run Pipeline in Docker Container') {
            steps {
                script {
                    // Define the Docker image
                    def dockerImage = docker.image('jenkins-agent:latest')

                    // Run the Docker container and execute tasks inside it
                    dockerImage.inside('-v C:\ProgramData\Jenkins\.jenkins\workspace\docker-based-jenkins-agent:\workspace -w \workspace') {
                        // Set working directory correctly
                        sh 'echo Running inside container at: \workspace'

                        // Run tasks inside the container
                        sh 'mvn clean install'
                        sh 'mvn test'
                    }
                }
            }
        }
    }

    post {
        always {
            // Clean up any resources, if necessary
            cleanWs()
        }
    }
}
