pipeline {
  agent any
  def app 
  stages {
    stage("Clone repository") {
      checkout scm  
    }
    
    stage("Build") {
      app = docker.build("ohmyfood")
    }
    stage("Push Image") {
      docker.withRegistry("https://registry.iloa.dev", "registry-auth") {
        app.push("1.0.${env.BUILD_NUMBER}");
        app.push("latest")
      }
    }
  }
}