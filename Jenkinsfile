pipeline {
    agent any

    // tools {
    //     python 'Python-3.8'
    // }
    environment {
        // Define la variable para la ejecución de SonarQube Scanner
        SONARQUBE_SCANNER_HOME = tool 'SonarQube Scanner'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Building...'
                sh 'python3 app.py > build_output.txt'
            }
        }

        stage('Code Analysis') {
            steps {
                echo 'Analyzing code...'
                script {
                   withSonarQubeEnv('SonarCloud') {
                        sh "${env.SONARQUBE_SCANNER_HOME}/bin/sonar-scanner"
                    }
                }
            }
        }

        stage('Backup') {
            steps {
                echo 'Creating backup...'
                sh 'tar czf build_backup.tar.gz build_output.txt'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying...'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
