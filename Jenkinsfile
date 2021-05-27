def grooveyScript

pipeline{
    agent any
    environment{
        NEW_VARIABLE = 'Graham'
    }
    stages{
        stage("init"){
            steps{
                script{
                    grooveyScript = load "script.groovy"
                }
            }
        }
        stage("build"){
            steps{
                script{
                    grooveyScript.buildFunction()
                }
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
