pipeline{
    agent any

    stages{
        stage("build"){
            steps{
                echo 'building stage...'
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
