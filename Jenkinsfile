pipeline{
     agent any

     stages{
          stage('checkout'){
               steps{
                    git branch: 'main', url: 'https://github.com/kavinduthilan/react-docker.git'
                    // git "https://github.com/kavinduthilan/react-docker.git"
               }
          }

          stage('Build React App') {
            steps {
                sh 'npm install'
                sh 'npm run build'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t react-app:latest .'
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
            }
        }
     }
}