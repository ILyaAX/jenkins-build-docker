pipeline {
	agent {
		docker {
			image '89.208.222.153:8123/build'
			args '-v /var/run/docker.sock:/var/run/docker.sock -u root'
		}
	}
	stages {
		stage ('Copy source from github') {
			steps {
				sh 'git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /home/app'
			}
		}
		stage ('Build webapp') {
			steps {
				sh 'mvn package -f /home/app'
			}
		}
		stage ('Build docker-image with webapp') {
			steps {
				sh 'docker build /home --tag="89.208.222.153:8123/webapp"'
			}
		}
		stage ('Push image') {
			steps {
				withCredentials([usernamePassword(credentialsId: '642e0ecf-859e-4a08-bc5a-c56e1cc89ac8', usernameVariable: 'USERNAME')]) {
					sh 'docker push 89.208.222.153:8123/webapp'
				}
			}
		}
	}
}
