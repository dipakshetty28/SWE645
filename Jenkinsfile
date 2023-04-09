pipeline {
   environment {
        registry = "swe645docker/swe645-group-project"
        registryCredential = 'dockerhub'
    }
   agent any

   stages {
      stage('Build') {
         steps {
            script{
               sh 'rm -rf *.war'
               sh 'jar -cvf SWE-645-part2.war -C src/main/webapp/ .'
               //sh 'echo ${BUILD_TIMESTAMP}'

               docker.withRegistry('',registryCredential){
                  def customImage = docker.build("19982707/studentsurvey645:0.1")
               }
            }
         }
      }

      stage('Push Image to Dockerhub') {
         steps {
            script{
               docker.withRegistry('',registryCredential){
                  sh 'docker push 19982707/studentsurvey645:0.1'
               }
            }
         }
      }

      stage('Deploying Rancher to single pod') {
         steps {
            script{
               sh 'kubectl set image deployment/deploymentone container-0=19982707/studentsurvey645:0.1'
            }
         }
      }

      stage('Deploying Rancher as with load balancer') {
         steps {
            script{
               sh 'kubectl set image deployment/deploymentone-lb container-0=19982707/studentsurvey645:0.1'
            }
         }
      }
   }
}