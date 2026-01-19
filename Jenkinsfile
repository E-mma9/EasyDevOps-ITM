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
                checkout scm
                echo '✓ Code pulled successfully'
            }
        }
        
        stage('Build') {
            steps {
                echo '========== BUILD =========='
                bat 'dotnet build frontend/ -c Release'
                echo '✓ Build completed'
            }
        }
        
        stage('Test') {
            steps {
                echo '========== UNIT TESTS =========='
                bat 'dotnet test frontend/ --no-build --configuration Release'
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
                echo '========== DEPLOY =========='
                bat 'dotnet publish frontend/ -c Release -o publish'
                echo '✓ Deploy completed'
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
            echo '✗ Pipeline failed!'
        }
    }
}


