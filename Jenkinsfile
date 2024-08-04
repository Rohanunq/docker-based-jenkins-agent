pipeline {
  agent any
  stages {
    stage('Example') {
      steps {
        script {
          // Print the workspace path
          echo "Workspace directory: ${env.WORKSPACE}"
          
          // Run a shell command
          bat '''
            echo "Current directory: $(pwd)"
            ls -la ${WORKSPACE}
          '''
        }
      }
    }
  }
}
