pipeline {
    agent {label 'agent' }
    tools { terraform "terraform-1.0"
    }
    environment {
        AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
    }
    stages {
        stage('Terraform initialization') {
            steps {
                sh 'terraform init'
                sh 'terraform apply --auto-approve' 
                
            }
        }
        stage('Output_public_ip') {
            steps {
                sh 'terraform --version'
            }
        }
    }
}
