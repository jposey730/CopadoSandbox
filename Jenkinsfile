pipeline {
    agent any

    stages {
        stage('Deployment Execution') {
            steps {
sh curl -X POST "https://app-api.copado.com/json/v1/webhook/deploy"
            }
        }
    }
}
