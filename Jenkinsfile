pipeline {
    agent {
        docker {
            image 'jenkins-agent-java:latest' // Replace with the tag of your Docker image
            args '-v /var/run/docker.sock:/var/run/docker.sock' // Mount Docker socket if you need Docker commands in your build
        }
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    credentialsId: 'github-ssh-key',
                    url: 'git@github.com:Rohanunq/DevOps-Assignment.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    // Run Maven build commands
                    sh 'mvn clean install'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    // Run Maven tests
                    sh 'mvn test'
                }
            }
        }
        stage('Package') {
            steps {
                script {
                    // Package the application
                    sh 'mvn package'
                }
            }
        }
    }
    post {
        success {
            echo 'Build and tests succeeded!'
        }
        failure {
            echo 'Build or tests failed.'
        }
    }
}