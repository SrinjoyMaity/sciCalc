pipeline {
    environment{
        imageName =""
    }
    agent any
    stages {
        stage('Git Pull') {
            steps {
                git 'https://github.com/SrinjoyMaity/sciCalc.git'
            }
        }
        stage('Build') {
            steps {
                script{
                    sh 'mvn clean install'
                }
            }
        }
        stage('Building an Docker Image') {
            steps {
                script{
                    imageName=docker.build "srinjoymaity/spe_mini_proj"
                }
            }
        }

        stage('Push The Docker Image') {
            steps {
                script{
                    docker.withRegistry('','docker_cred'){
                        imageName.push()
                    }
                }
            }
        }
        stage('Ansible Pull Docker Image') {
            steps {
                ansiblePlaybook becomeUser: null, colorized: true, disableHostKeyChecking: true, installation: 'Ansible', inventory: 'deploy-docker/inventory',
                 playbook: 'deploy-docker/Scicalc_deploy.yml', sudoUser: null

            }
        }
    }
}