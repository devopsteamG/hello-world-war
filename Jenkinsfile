pipeline {
    agent any
  options {
    // Keep the 10 most recent builds
    buildDiscarder(logRotator(numToKeepStr:'10'))
  }
     stages {
     stage('checkout'){
         steps{
             checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: '724e483b-472b-40df-af9b-43c6a2cb9aca', url: 'https://github.com/bablubharath/hello-world-war.git']]])
         }          
         }
    stage('Deployment') {
         steps {
            sh 'rm -rf .terraform* terraform.tfstate.d/'
            sh 'terraform init'
            sh 'terraform workspace new dev'
            sh 'terraform plan'
            sh 'terraform destroy --auto-approve'
            //sh 'aws s3 cp /var/lib/jenkins/workspace/static-website-exampl/index.html s3://static-website-exampl/'
            
         }
      }
   }
}
