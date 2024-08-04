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
          // Convert Windows paths to Unix-style paths
          sh '''
            echo "Working directory is: $(pwd)"
            node --version
            git --version
            curl --version
          '''
        }
      }
    }
  }
}
