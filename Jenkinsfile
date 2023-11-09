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
                            echo 'Creating deploy...'
                            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                            def app = docker.build("my-app:${env.BUILD_ID}")
                            app.push()
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
}
