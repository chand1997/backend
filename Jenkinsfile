pipeline{
    agent {label "agent-1"}
    environament{
        project = "expense"
        component = "backend"
        appVersion = ""
    }
    stages{
        stage("Read Version"){
            steps{
                def packageJSON = readJSON file: 'package.json'
                appVersion = packageJSON.version
                echo "${appVersion}"
            }
        }
    }
}