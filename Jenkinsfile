pipeline{
    agent any

    stages{
        stage("build"){
            steps{
                echo 'building stage...'
            }
        }
        stage("test"){
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
    }
}
