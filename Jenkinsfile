pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'java-hello-world-app:latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/CHARLIECODERR/my-java-app-repo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    echo "Building Docker image..."
                    docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    echo "Running Docker container..."
                    // Run the container in detached mode
                    def app = docker.image(DOCKER_IMAGE).run("-d")
                    
                    // Wait for a few seconds to ensure the container is up and running
                    sleep time: 5, unit: 'SECONDS'

                    // Stop the running container
                    docker.stop(app.id)
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    echo "Pushing Docker image to Docker Hub..."
                    withDockerRegistry([credentialsId: 'docker-hub-credentials', url: 'https://index.docker.io/v1/']) {
                        docker.image(DOCKER_IMAGE).push()
                    }
                }
            }
        }

        stage('Deploy Docker Container') {
            steps {
                script {
                    echo "Deploying Docker container..."
                    // Pull the image from Docker Hub and run the container (optional step based on your setup)
                    docker.pull(DOCKER_IMAGE)
                    def app = docker.image(DOCKER_IMAGE).run("-d")
                    
                    // Wait for a few seconds to ensure the container is up and running
                    sleep time: 5, unit: 'SECONDS'

                    // Optionally, you can stop the container here as well
                    docker.stop(app.id)
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up resources...'
            // You can add steps for cleaning up or removing any temporary files if needed
        }
    }
}
