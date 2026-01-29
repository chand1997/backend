pipeline{
    agent {label "agent-1"}
    environment{
        project = "expense"
        component = "backend"
        appVersion = ""
        acc_id = "353654037274"
        yo = "bhai"
    }
     parameters{
        booleanParam(name: 'build', defaultValue: false, description: 'Toggle this value')
    }
    stages{
        stage("Read Version"){
            steps{
                script{
                def packageJSON = readJSON file: 'package.json'
                appVersion = packageJSON.version
                // echo "${appVersion}"
                }
                
            }
        }
        stage("Create image"){
            steps{
                script{
                    withAWS(credentials: 'aws-creds'){
                        sh """
                           aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${acc_id}.dkr.ecr.us-east-1.amazonaws.com

                           docker build -t ${acc_id}.dkr.ecr.us-east-1.amazonaws.com/${project}/${component}:${appVersion} .

                           docker push ${acc_id}.dkr.ecr.us-east-1.amazonaws.com/${project}/${component}:${appVersion} 

                        """
                    }
                }
                
            }
        }
        stage("trigger-cd"){
            when{
                expression { params.build }
            }
            steps{
                 build job: 'backend-cd', parameters: [string(name: 'version', value: "${appVersion}")], wait: false
            }
        }
    }
}