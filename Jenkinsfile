pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t myapp:${BUILD_NUMBER} .'
      }
    }
    stage('Test') {
      steps {
        sh 'pytest tests/'
      }
    }
    stage('Push Image') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'docker-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
          sh 'echo $PASS | docker login -u $USER --password-stdin'
          sh 'docker push myapp:${BUILD_NUMBER}'
        }
      }
    }
    stage('Deploy to Green') {
        steps {
            sh 'kubectl apply -f k8s/green-deployment.yaml'
        }
    }

    stage('Switch Traffic') {
        steps {
            sh './scripts/switch_traffic.sh green'
        }
    }
  }
}
