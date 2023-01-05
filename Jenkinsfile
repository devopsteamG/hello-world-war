pipeline {
    agent any
  options {
    // Keep the 10 most recent builds
    buildDiscarder(logRotator(numToKeepStr:'10'))
  }
  stages {
    stage('checkout'){
      steps{
        checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '3b2e5a10-3865-42f0-92b4-236230f2dfa3', url: 'https://github.com/sanketkadge1/projects.git']]])
      }        
    }
    stage("TF PLAN") {
      steps{
        sh 'terraform init'
        sh 'terraform plan -out plan.tfplan'
      }
    }
    stage('TF Apply') {
      input{
        message "Do you want to apply Terraform?"
      }
      steps{
        sh "terraform ${params.action} --auto-approve"
      }
    }
  }
}
