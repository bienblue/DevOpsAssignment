pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout your code from the repository
                sh 'echo "checkout scm"'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build your Docker image (replace with your actual build commands)
                sh 'echo "docker build -t my-docker-image ."'
            }
        }

        stage('Run Trivy Scan') {
            steps {
                // Run Trivy against the built Docker image
                sh 'trivy image --format json solr:slim > trivy-results.json'
            }
        }

        stage('Parse Trivy Results') {
            steps {
                // Parse the Trivy JSON results (you can use jq, Python, etc.)
                sh 'cat trivy-results.json' // Replace with your parsing logic
            }
        }

        stage('Fail Build if Vulnerabilities Found') {
            steps {
                // Check if critical vulnerabilities exist
                script {
                    def vulnerabilities = readFile('trivy-results.json')
                    if (vulnerabilities.contains('CRITICAL')) {
                        error 'Critical vulnerabilities found! Failing the build.'
                    }
                }
            }
        }

        stage('Test') {
            steps {
                // Run your tests here
                sh 'echo "Running tests..."'
                // Add your actual test commands here
            }
        }

        stage('Deploy to Registry') {
            steps {
                // Push the Docker image to your registry (e.g., Amazon ECR)
                sh 'echo "docker push my-docker-image"'
            }
        }
    }

    post {
        always {
            // Clean up any temporary files
            sh 'rm trivy-results.json'
        }
    }
}
