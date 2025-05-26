pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'java-hello-world-app:latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/CHARLIECODERR/dockerized-java-app.git'
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
                    try {
                        // Run the container in detached mode
                        def app = docker.image(DOCKER_IMAGE).run("-d")
                        
                        // Wait for a few seconds to ensure the container is up and running
                        sleep time: 5, unit: 'SECONDS'
                    } catch (Exception e) {
                        echo "Failed to run Docker container: ${e}"
                        currentBuild.result = 'FAILURE'
                    }
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    echo "Pushing Docker image to Docker Hub..."
                    try {
                        withDockerRegistry([credentialsId: 'docker-hub-credentials', url: 'https://index.docker.io/v1/']) {
                            docker.image(DOCKER_IMAGE).push()
                        }
                    } catch (Exception e) {
                        echo "Failed to push Docker image: ${e}"
                        currentBuild.result = 'FAILURE'
                    }
                }
            }
        }

        stage('Deploy Docker Container') {
            steps {
                script {
                    echo "Deploying Docker container..."
                    try {
                        // Pull the image from Docker Hub
                        docker.pull(DOCKER_IMAGE)
                        
                        // Run the container in detached mode
                        def app = docker.image(DOCKER_IMAGE).run("-d")
                        
                        // Wait for a few seconds to ensure the container is up and running
                        sleep time: 5, unit: 'SECONDS'
                    } catch (Exception e) {
                        echo "Failed to deploy Docker container: ${e}"
                        currentBuild.result = 'FAILURE'
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up resources...'
            // Add steps to clean up resources if needed
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Investigate the error.'
        }
    }
}
