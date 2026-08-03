pipeline {

    agent any

    tools {
        maven 'Maven-3'
        jdk 'JDK21'
    }

    pipeline {

        agent any

        triggers {
            githubPush()
        }

        ...
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

        stage('Spotless Check') {
            steps {
                sh '''
                    mvn spotless:check
                '''
            }
        }

        stage('Unit Tests') {
            steps {
                sh '''
                    mvn test
                '''
            }
        }

        


        stage('Package') {
            steps {
                sh '''
                    mvn package -DskipTests
                '''
            }
        }


    }


    post {

        success {
            echo 'BUILD SUCCESS esto es una prueba'
        }

        failure {
            echo 'BUILD FAILED'
        }

    }
}