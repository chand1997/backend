pipeline{
    agent {label "agent-1"}
    environment{
        project = "expense"
        component = "backend"
        appVersion = ""
    }
    stages{
        stage("Read Version"){
            steps{
                script{
                def packageJSON = readJSON file: 'package.json'
                appVersion = packageJSON.version
                echo "${appVersion}"
                }
                
            }
        }
    }
}