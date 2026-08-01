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


        stage('Package') {
            steps {
                sh '''
                    mvn package -DskipTests
                '''
            }
        }

        stage("Docker"){
            steps{
                sh '"
                    docker ps 
                "'
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