pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
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