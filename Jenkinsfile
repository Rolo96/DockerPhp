
  env.DOCKERHUB_USERNAME = 'vipconsult'

  node("docker-prod") {
    stage("Production") {
      try {
        // Create the service if it doesn't exist otherwise just update the image
        sh '''
          SERVICES=$(docker service ls --filter name=phpdocker --quiet | wc -l)
          if [[ "$SERVICES" -eq 0 ]]; then
            docker service create --name phpdocker --network mongo --network bridge --replicas 2 rolo1820/phpdocker
          else
            docker service update --image rolo1820/phpdocker phpdocker
          fi
          '''
      }catch(e) {
        sh "docker service update --rollback  phpdocker"
        error "Service update failed in production"
      }finally {
        sh "docker ps -aq | xargs docker rm || true"
      }
    }
  }
