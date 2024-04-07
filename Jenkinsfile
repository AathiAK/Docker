pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'aathiak/python_addition'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/AathiAK/Docker.git']]])
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(env.DOCKER_IMAGE)
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'caca585d-4c84-4813-ada0-7bf57b997874') {
                        docker.image(env.DOCKER_IMAGE).push('latest')
                    }
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    docker.image(env.DOCKER_IMAGE).run('-p 8000:8000 --name my-container -d')
                }
            }
        }
    }
}

