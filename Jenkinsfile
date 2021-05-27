pipeline{
    agent any
    environment{
        NEW_VARIABLE = 'Graham'
    }
    stages{
        stage("build"){
            steps{
                echo '${NEW_VARIABLE} building stage...'
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
