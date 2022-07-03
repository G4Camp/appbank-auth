node('master') {
    stage ('Checkout') {
        checkout scm
    }
    stage ('Build') {
        sh "docker build --build-arg port=${SERVER_PORT_API} -t g4camp/auth:B${BUILD_NUMBER} -f Dockerfile ."
    }
    stage ('Deployment') {
        try {
            sh "docker stop g4camp_auth"
            sh "docker rm g4camp_auth"
        } catch (Exception e) {
            sh "echo 'container not running'"
        }
        sh "docker run -d -e PORT=${SERVER_PORT_API} -e KEYCLOAK_USER='${KEYCLOAK_USER}' -e KEYCLOAK_PASSWORD='${KEYCLOAK_PASSWORD}' -e DATABASE_URL='${DATABASE_URL}' -e PROXY_ADDRESS_FORWARDING='true' -e KEYCLOAK_FRONTEND_URL='${KEYCLOAK_FRONTEND_URL}' -p ${SERVER_PORT_API}:${SERVER_PORT_API} --name g4camp_auth g4camp/auth:B${BUILD_NUMBER}"
        
    }
}
