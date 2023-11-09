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
                        echo 'Deploying...'
                        echo 'Building Docker image...'
                        // Reemplaza 'my-app' con el nombre de tu imagen y 'tag' con el tag de tu imagen
                        sh 'docker build -t my-app:tag .'

                        echo 'Logging into Docker Hub...'
                        // Utiliza con precaución, es mejor usar con credenciales almacenadas en Jenkins
                        sh 'echo $DOCKERHUB_PASS | docker login --username $DOCKERHUB_USER --password-stdin'

                        echo 'Pushing image to Docker Hub...'
                        sh 'docker push my-app:tag'
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
