pipeline {
  agent any
  stages {
    stage('Deploy') {
      steps {
        pushToCloudFoundry(target: 'api.run.pivotal.io', organization: 'mith-org', cloudSpace: 'development', credentialsId: 'mithcf')
      }
    }
  }
}