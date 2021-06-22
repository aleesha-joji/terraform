pipeline {

    parameters {
        string(name: 'environment', defaultValue: 'terraform', description: 'Workspace/environment file to use for deployment')
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')

    }
    environment {
        AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
    }



//      environment {
//         AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
//         AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
//     }

   agent  any
        
    stages {
//         stage('checkout scm') {
//             steps {
//                  script{
//                          git "https://github.com/aleesha-joji/terraform.git"
//                     }
//                 }
//             }

        stage('Plan') {
            steps {
                sh 'terraform init'
//                 sh 'terraform workspace new ${environment}'
//                 sh 'terraform workspace select ${environment}'
                sh "terraform plan "
                
            }
        }
       

        stage('Apply') {
            steps {
                sh "terraform apply --auto-approve"
            }
        }
    }

  }
