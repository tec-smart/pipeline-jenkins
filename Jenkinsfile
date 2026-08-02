pipeline {

    agent any

    tools {
        maven 'Maven-3'
        jdk 'JDK21'
    }

    environment {
        MAVEN_OPTS = "-Dmaven.test.failure.ignore=false"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Compile') {
            steps {
                sh '''
                    mvn clean compile
                '''
            }
        }

        

        stage('Code Format Validation') {
            steps {
                sh '''
                    mvn spotless:check
                '''
            }
        }

        /*
        stage('Unit Tests') {
            steps {
                sh '''
                    mvn test
                '''
            }
        }

        stage('JUnit Report') {
            steps {
                junit '**/target/surefire-reports/*.xml'
            }
        }

        stage('Code Coverage') {
            steps {
                sh '''
                    mvn jacoco:report
                '''
            }
        }
        */

        stage('Package') {
            steps {
                sh '''
                    mvn package -DskipTests
                '''
            }
        }

        /*
        stage('Static Analysis') {
            steps {
                // SonarQube
            }
        }

        stage('Dependency Scan') {
            steps {
                // OWASP Dependency Check
            }
        }

        stage('Publish Artifact') {
            steps {
                // Nexus / Artifactory / GitHub Packages
            }
        }

        stage('Docker Build') {
            steps {
                // docker build
            }
        }

        stage('Docker Push') {
            steps {
                // docker push
            }
        }

        stage('Deploy') {
            steps {
                // Docker Compose / Kubernetes
            }
        }
        */

    }

    post {

        success {
            echo 'BUILD SUCCESS'
        }

        failure {
            echo 'BUILD FAILED'
        }

        always {
            cleanWs()
        }

    }

}