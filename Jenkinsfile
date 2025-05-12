pipeline {
    agent any
    environment {
        DOCKER_HUB_REPO = 'suoton/javaweb3'
        DOCKER_HUB_CREDENTIALS = 'dockerhub-credentials'
    }
    stages {
        stage('Clone') {
            steps {
                echo 'Cloning repository...'
                git branch: 'latest', url: 'https://github.com/suoton/JavaWeb3.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Building Java app...'
                sh 'mvn clean package'
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    echo 'Building Docker image...'
                    dockerImage = docker.build("${DOCKER_HUB_REPO}:${env.BUILD_NUMBER}")
                }
            }
        }
        stage('Docker Login') {
            steps {
                script {
                    echo 'Logging in to Docker Hub...'
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_HUB_CREDENTIALS) {
                        echo 'Logged in successfully'
                    }
                }
            }
        }
        stage('Push Image') {
            steps {
                script {
                    echo 'Pushing Docker image...'
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_HUB_CREDENTIALS) {
                        dockerImage.push('latest')
                        dockerImage.push("${env.BUILD_NUMBER}")
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    echo 'Deploying application...'
                    sh """
                        docker stop javaweb3 || true
                        docker rm javaweb3 || true
                        docker run -d -p 8081:8080 --name javaweb3 ${DOCKER_HUB_REPO}:${env.BUILD_NUMBER}
                    """
                }
            }
        }
    }
}
