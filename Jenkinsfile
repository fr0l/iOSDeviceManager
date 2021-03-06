#!/usr/bin/env groovy

pipeline {
  agent { label 'master' }
  environment {
    DEVELOPER_DIR = '/Xcode/9.4.1/Xcode.app/Contents/Developer'
    XCPRETTY=1

    SLACK_COLOR_DANGER  = '#E01563'
    SLACK_COLOR_INFO    = '#6ECADC'
    SLACK_COLOR_WARNING = '#FFC300'
    SLACK_COLOR_GOOD    = '#3EB991'

    PROJECT_NAME = 'iOSDeviceManager'
  }
  options {
    disableConcurrentBuilds()
    buildDiscarder(logRotator(numToKeepStr: '10'))
    timeout(time: 75, unit: 'MINUTES')
  }

  stages {
    stage('Announce') {
      steps {
        slackSend (color: "${env.SLACK_COLOR_INFO}",
                  message: "${env.PROJECT_NAME} [${env.GIT_BRANCH}] #${env.BUILD_NUMBER} *Started* (<${env.BUILD_URL}|Open>)")
      }
    }
    stage('Run build and tests') {
      steps {
        sh "run-loop simctl manage-processes"
        sh "rm -rf reports/*.xml"
        sh "gtimeout --foreground --signal SIGKILL 10m make unit-tests"
        sh "gtimeout --foreground --signal SIGKILL 30m make integration-tests"
        sh "gtimeout --foreground --signal SIGKILL 30m make cli-tests"
      }
    }
  }

  post {
    always {
      junit 'reports/*.xml'
    }

    aborted {
      echo "Sending 'aborted' message to Slack"
      slackSend (color: "${env.SLACK_COLOR_WARNING}",
                message: "${env.PROJECT_NAME} [${env.GIT_BRANCH}] #${env.BUILD_NUMBER} *Aborted* after ${currentBuild.durationString.replace('and counting', '')}(<${env.BUILD_URL}|Open>)")
    }

    failure {
      echo "Sending 'failed' message to Slack"
      slackSend (color: "${env.SLACK_COLOR_DANGER}",
                message: "${env.PROJECT_NAME} [${env.GIT_BRANCH}] #${env.BUILD_NUMBER} *Failed* after ${currentBuild.durationString.replace('and counting', '')}(<${env.BUILD_URL}|Open>)")
    }

    success {
      echo "Sending 'success' message to Slack"
      slackSend (color: "${env.SLACK_COLOR_GOOD}",
                message: "${env.PROJECT_NAME} [${env.GIT_BRANCH}] #${env.BUILD_NUMBER} *Success* after ${currentBuild.durationString.replace('and counting', '')}(<${env.BUILD_URL}|Open>)")
    }
  }
}
