def branch = "main"
def remote = "origin"
def directory = "~/jenkins/wayshub-backend"
def server = "tanu96@103.150.116.19"
def cred = "batch24ssh"

pipeline {
    agent any
    stages {
        stage('repo pull') {
            steps {
                sshagent([cred]) {
                    sh """
                    ssh -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${directory}
                    git pull ${remote} ${branch}
                    exit
                    EOF
                    """
                }
            }
        }

        stage('docker build') {
            steps {
                sshagent([cred]) {
                    sh """
                    ssh -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${directory}
                    docker build -t dumbflix-be .
                    exit
                    EOF
                    """
                }
            }
        }

        stage('docker run') {
            steps {
                sshagent([cred]) {
                    sh """
                    ssh -o StrictHostKeyChecking=no ${server} << EOF
                    docker run -d -p 5001:5000 --tty --name backend dumbflix-be
                    exit
                    EOF
                    """
                }
            }
        }
    }
}
