pipeline {
	agent {
		docker {
			image '5.188.140.219:8123/build'
		}
	}
	stages {
		stage ('Copy source from github') {
			steps {
				bash 'git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /home/app'
			}
		}
		stage ('Build webapp') {
			steps {
				bash 'mvn package -f /home/app'
			}
		}
		stage ('Build docker-image with webapp') {
			steps {
				bash 'docker build /home --tag="5.188.140.219:8123/webapp"'
			}
		}
		stage ('Push image') {
			steps {
				bash 'docker push 5.188.140.219:8123/webapp'
			}
		}
	}
}