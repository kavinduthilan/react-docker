pipeline{
     agent any

     stages{
          stage('checkout'){
               steps{
                    git branch: 'main', url: 'https://github.com/kavinduthilan/react-docker.git'
               }
          }

          stage('Build Docker Image') {
            steps {
                bat 'docker build -t react-app:latest .'
            }
        }

        stage('Login to Dockerhub'){
            steps {
                withCredentials([string(credentialsId: 'docker_hub_password', variable: 'docker_hub_password')]) {
                    script {
                        bat "docker login -u kavi98 -p %docker_hub_password%"
                    }
                }
            }
        }

        stage('Push Image'){
            steps{
                bat 'docker push kavi98/react-app:latest'
            }
        }

        
        stage('Deploy to Kubernetes') {
            steps {
                bat 'kubectl apply -f deployment.yaml'
                bat 'kubectl apply -f service.yaml'
            }
        }

        }
        
     }