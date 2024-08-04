pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using Dockerfile in the repository
                    docker.build('jenkins-agent:latest')
                }
            }
        }

        stage('Run Pipeline in Docker Container') {
            steps {
                script {
                    // Define the Docker image with the name and tag
                    def dockerImage = docker.image('jenkins-agent:latest')

                    // Run the Docker container and execute tasks inside it
                    dockerImage.inside {
                        // Run tasks inside the container
                        checkout scm
                        
                        // Execute your pipeline tasks
                        sh 'mvn clean install'
                        sh 'mvn test'
                        
                        // Deploy commands
                        sh 'helm upgrade --install my-release my-chart/'
                        // Or AWS CLI commands
                        // sh 'aws s3 cp my-artifact s3://my-bucket/'
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
