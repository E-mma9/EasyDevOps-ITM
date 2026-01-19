pipeline {
    agent any
    
    options {
        timestamps()
        timeout(time: 45, unit: 'MINUTES')
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo '========== CHECKOUT =========='
                echo 'Checking out code from GitHub...'
                checkout scm
                echo '✓ Code pulled successfully'
            }
        }
        
        stage('Build') {
            steps {
                echo '========== BUILD =========='
                echo 'Building application...'
                bat 'dotnet build SHIPPING.sln -c Release'
                echo '✓ Build completed'
            }
        }
        
        stage('Test') {
            steps {
                echo '========== UNIT TESTS =========='
                echo 'Running tests...'
                bat 'dotnet test SHIPPING.sln --no-build --configuration Release'
                echo '✓ Tests completed'
            }
        }
        
        stage('Security') {
            steps {
                echo '========== SECURITY SCAN (SNYK) =========='
                snykSecurity(
                    snykInstallation: 'Snyk Scanner',
                    snykTokenId: 'snyk-token',
                    additionalArguments: '--all-projects --severity-threshold=high',
                    failOnIssues: true
                )
                echo '✓ Security scan completed'
            }
        }
        
        stage('Deploy') {
            steps {
                echo '========== DEPLOY TO TEST ENVIRONMENT =========='
                echo 'Deploying to test environment...'
                bat 'dotnet publish SHIPPING.sln -c Release -o publish'
                echo '✓ Deploy completed'
                // Add your deployment commands here
                // Example: bat 'robocopy publish \\\\test-server\\deploy /MIR'
            }
        }
    }
    
    post {
        always {
            echo '========== PIPELINE FINISHED =========='
            cleanWs()
        }
        success {
            echo '✓ Pipeline succeeded!'
        }
        failure {
            echo '✗ Pipeline failed! Check logs above.'
        }
    }
}
