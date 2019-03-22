pipeline {
    agent {
        dockerfile {
            additionalBuildArgs '--build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g)'
            args '-v /var/lib/jenkins/workspace/install:/var/lib/jenkins/workspace/install:z'
        }
    }

    stages {
        stage('Clean') {
            steps {
                sh './scripts/clean.sh'
            }
        }

        stage('Get Source') {
            steps {
                checkout scm
            }
        }

        stage('Get AMQP.Net Lite') {
            steps {
                sh './scripts/get-amqpnetlite.sh'
            }
        }

        stage('Build') {
            steps {
                sh './scripts/build.sh'
            }
        }

        stage('Check') {
            steps {
                sh './scripts/check.sh'
            }
        }
    }
}
