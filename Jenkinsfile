pipeline {
    agent any

    stages {
        stage('Deployment Execution') {
            steps {
                sh 'curl -X POST https://app-api.copado.com/json/v1/webhook/deploy/a0a5e000000bKrXAAU?api_key=a5df0164c33d8979041c4c06cc4f50cb'
            }
        }
    }
}
