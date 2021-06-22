pipeline {
environment {
        AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
    }
agent  any
   stages {
       stage('Plan') {
           steps {
               sh 'terraform init'
               sh 'terraform plan'
           }
       }
       stage('Apply') {
           steps {
               sh "terraform apply --auto-approve"
           }
       }
    }
}
