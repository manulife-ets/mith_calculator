pipeline {
  agent any
  stages {
    stage ('Build') {
      steps{
        container ('nodejs') {
          sh 'npm install'
        }
      }
    }
    stage('Deploy') {
      steps {
        pushToCloudFoundry(target: 'api.run.pivotal.io', organization: 'mith-org', cloudSpace: 'development', credentialsId: 'mithcf',pluginTimeout: '240')
      }
    }
  }
}
