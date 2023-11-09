pipeline {
    agent any

    // tools {
    //     python 'Python-3.8'
    // }
    // environment {
    //     // Define la variable para la ejecución de SonarQube Scanner
    //     SONARQUBE_SCANNER_HOME = tool 'SonarQube Scanner'
    // }
    // environment {
    //     HEROKU_API_KEY = credentials('HEROKU_API_KEY')
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

        stage('Deploy docker') {
            steps {
                  echo 'Deploy docker'
            // script {
            //         def dockerHome = tool 'docker'
            //         def app = docker.build("vidd1992/tiptidev:${env.BUILD_ID}")
            //         docker.image("vidd1992/tiptidev:${env.BUILD_ID}").run("-p 80:5000")
            //     }
            }

            }
        stage('Deploy to Heroku') {
            steps {
                      echo 'Deploy Heroku'
                // script {
                //     // Login to Heroku
                //     sh 'heroku login -i'
                //     // Add remote repository if not already added
                //     sh 'git remote | grep heroku || heroku git:remote -a nombre-de-tu-app'
                //     // Push to Heroku
                //     sh 'git push heroku master'
                // }
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

