pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
      additionalBuildArgs '--build-arg DOCKER_BUILDKIT=1' // Optional: Enable BuildKit if needed
    }
  }
  stages {
    stage('Test') {
      steps {
        script {
          // Use a shell script with Windows path compatibility
          bat '''
            node --version
            git --version
            curl --version
          '''
        }
      }
    }
  }
}
