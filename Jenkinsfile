pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                echo '========== CHECKOUT =========='
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                echo '========== BUILD =========='
                dir('frontend') {
                    bat 'dotnet build EasyDevOpsFrontend.csproj --configuration Release'
                }
            }
        }
        
        stage('Test') {
            steps {
                echo '========== UNIT TESTS =========='
                dir('frontend') {
                    bat 'dotnet test'
                }
            }
        }
        
        stage('Security') {
            steps {
                echo '========== SECURITY (SNYK) =========='
                snykSecurity(
                    snykInstallation: 'Snyk Scanner',
                    snykTokenId: 'snyk-token',
                    additionalArguments: '--all-projects',
                    monitorOnlyTrustedModules: true,
                    failOnIssues: true
                )
            }
        }
        
        stage('Deploy') {
            steps {
                echo '========== DEPLOY =========='
                dir('frontend') {
                    bat 'dotnet publish EasyDevOpsFrontend.csproj --configuration Release'
                }
            }
        }
    }
    
    post {
        always {
            echo '========== FINISHED =========='
        }
    }
}




