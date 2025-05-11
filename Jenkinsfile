pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    // Build the project
                    sh 'mvn clean package'
                }
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t suoton/javaweb3 .'
                }
            }
        }
        stage('Docker Push') {
            steps {
                script {
                    // Log in to Docker Hub
                    sh 'echo $DOCKER_HUB_PASSWORD | docker login -u $DOCKER_HUB_USERNAME --password-stdin'
                    // Push the image to Docker Hub
                    sh 'docker push suoton/javaweb3'
                }
            }
        }
    }
}
