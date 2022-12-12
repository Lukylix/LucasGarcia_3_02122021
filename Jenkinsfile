def app
pipeline {
  agent any
  stages {
    stage("Clone repository") {
      steps {
        checkout scm  
      }
    }
    stage("Build") {
      steps {
        script {
          docker.build("ohmyfood")
        }
      }
    }
    stage("Push Image") {
      steps {
        script{
          docker.withRegistry("https://registry.iloa.dev", "registry-auth") {
            app.push("1.0.${env.BUILD_NUMBER}");
            app.push("latest")
          }
        }
      }
    }
  }
}