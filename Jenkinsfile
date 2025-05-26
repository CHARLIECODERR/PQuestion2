pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'java-hello-world-app:latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', 
                    url: 'https://github.com/CHARLIECODERR/dockerized-java-app.git', 
                    credentialsId: 'your-credentials-id' // Ensure this is the correct credentials ID in Jenkins
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image..."
                    docker.build(DOCKER_IMAGE)
                }
            }
        }

        // Other stages follow...
    }

    post {
        always {
            echo 'Cleaning up resources...'
        }
    }
}
