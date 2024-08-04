pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build('jenkins-agent:latest')
                }
            }
        }

        stage('Run Pipeline in Docker Container') {
            steps {
                script {
                    // Define the Docker image
                    def dockerImage = docker.image('jenkins-agent:latest')

                    // Run the Docker container and execute tasks inside it
                    dockerImage.inside {
                        // Set working directory correctly
                        def workingDir = 'C:/ProgramData/Jenkins/.jenkins/workspace/docker-based-jenkins-agent/'

                        // Run tasks inside the container
                        sh "echo 'Running in container working dir: ${workingDir}'"
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
