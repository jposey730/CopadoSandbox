pipeline{
    agent any
    environment{
        NEW_VARIABLE = 'Graham'
    }
    stages{
        stage("build"){
            steps{
	        echo 'Hello'
                echo "${NEW_VARIABLE} building stage..."
                def response = sh 'curl https://app-api.copado.com/json/v1/webhook/deploy/a0a5e000000bKrXAAU?api_key=a5df0164c33d8979041c4c06c -X POST'
            }
        }
        stage("test"){
            when{
                expression{
                    BRANCH_NAME == 'main'
                }
            }
            steps{
                echo 'testing stage...'
            }
        }
    }
    post{
        always{
            echo 'Finished'
        }
        failure{
            echo 'Failed'
        }
        success{
            echo 'Success'
        }
    }
}
