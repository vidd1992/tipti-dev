pipeline {
    agent any

    // tools {
    //     python 'Python-3.8'
    // }


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
             def scannerHome = tool 'SonarScanner 4.0';
            steps {
                echo 'Analyzing code...'
                script {
                   withSonarQubeEnv('SonarCloud') {
                        sh "${scannerHome}/bin/sonar-scanner"
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
