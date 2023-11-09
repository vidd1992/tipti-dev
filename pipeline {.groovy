pipeline {
    agent any


    stages {
        stage('SCM') {
                git 'https://github.com/vidd1992/tipti-dev.git'
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
