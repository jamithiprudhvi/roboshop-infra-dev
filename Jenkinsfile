pipeline {
    agent {
        node {
            label 'AGENT-1'
        }
    }

    options {
        timeout(time: 1, unit: 'HOURS') 
        disableConcurrentBuilds()
        ansiColor('xterm')
    
    }

    // Build
    stages {
        stage('APP ALB') {
            parallel {
                stage('DB') {
                    steps {
                       sh """
                        cd 05-databases
                        terraform init -reconfigure
                        terraform destroy -auto-approve
                      """
                    }
                }
                stage('DB ALB') {
                    steps {
                       sh """
                        cd 04-app-alb
                        terraform init -reconfigure
                        terraform destroy -auto-approve
                      """
                    }
                }
            }
        }
        stage('VPN') {
            steps {
                sh """
                    cd 03-vpn
                    terraform init -reconfigure
                    terraform destroy -auto-approve
                """               
            }
        }
        stage('SG') {
            steps {
                sh """
                    cd 02-sg
                    terraform init -reconfigure
                    terraform destroy -auto-approve
                """               
            }
        }
        stage('vpc') {
            steps {
                sh """
                    cd 01-vpc
                    terraform init -reconfigure
                    terraform destroy -auto-approve
                """               
            }
        }
        
    }
    // post Build
    post { 
        always { 
            echo 'I will always say Hello again'
        }
        failure { 
            echo 'This runs when pipeline is failed, used generally to send some alerts'
        }
        success { 
            echo 'It will say hello when pipe line is success'
        }
    }
}