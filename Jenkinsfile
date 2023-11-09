pipeline {
    agent any

    // tools {
    //     python 'Python-3.8'
    // }
    // environment {
    //     // Define la variable para la ejecución de SonarQube Scanner
    //     SONARQUBE_SCANNER_HOME = tool 'SonarQube Scanner'
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
            steps {
                echo 'Analyzing code...'
                script {
                def scannerHome = tool 'sonar';
                   withSonarQubeEnv('SonarCloud') {
                        sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=vidd1992_tipti-dev -Dsonar.organization=vidd1992"
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
            script {
                    def dockerHome = tool 'docker'
                    def app = docker.build("miapp/hola-mundo:${env.BUILD_ID}")
                    docker.image("miapp/hola-mundo:${env.BUILD_ID}").run("-p 80:5000")
                }
            }

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

