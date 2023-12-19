pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Use single quotes around the entire git step
                script {
                 git credentialsId: '95f6a229-2a1b-46b6-a89c-dbc462b7dd18', url: 'https://github.com/Adithyasai123/Hello_World.git'
                }
            }
        }

        stage('Run Unit Tests') {
            steps {
                script {
                    // Run your unit tests
                    sh 'python test_website_connection.py'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image with a tag
                    sh 'docker build -t adithyasai143/hello_world:latest .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run Docker container, detach and publish ports
                    sh 'docker run -d -p 9000:9000 hello_world:latest'
                }
            }
        }
    }
}
