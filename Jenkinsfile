pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code from GitHub...'
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                echo 'Building application...'
                bat 'echo Building...'  // Replace with actual build command
                // For .NET: bat 'dotnet build SHIPPING.sln -c Release'
                // For Maven: bat 'mvn clean package'
            }
        }
        
        stage('Test') {
            steps {
                echo 'Running tests...'
                bat 'echo Testing...'  // Replace with actual test command
                // For .NET: bat 'dotnet test SHIPPING.sln'
                // For Maven: bat 'mvn test'
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying to test environment...'
                bat 'echo Deploying...'
                // Add your deployment commands here
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline finished.'
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
