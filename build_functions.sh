##################  Do not modify anything here #############################

build_container() { 

  cd `dirname $0`
  export CONTAINER=`basename $(pwd)`

  if [ ${TAG:-none} == 'none' ]; then
    echo "========================================================="
    echo "Help:"
    echo ""
    echo "You must pass a value for the tag like this:
    echo "$ TAG=version ./init.sh"
    echo "You can also tag this version as the lastest like this:
    echo "$ LATEST=true TAG=version ./init.sh"
    echo "You can also choose add a Different Dockerfile:"
    echo "$ LATEST=true TAG=version DOCKERFILE=filename ./init.sh"
    echo ""
    echo ""
    exit
  fi

  docker rmi -f $CONTAINER:$TAG 2>/dev/null
  docker rmi -f docker-dev-local.logistics.corp/$CONTAINER:$TAG 2>/dev/null
  echo  ${DOCKER_TOKEN} | docker --debug login --password-stdin --username ${DOCKER_ID} 
 
  if [ ${DOCKERFILE:-none} == 'none'  ]; then
    DOCKERFILE='Dockerfile'
  else
    echo "Custom Dockerfile: $DOCKERFILE"
    DOCKERFILE=${DOCKERFILE}
  fi

  docker build -f ${DOCKERFILE} -t $CONTAINER:$TAG  .
  
  docker tag  $CONTAINER:$TAG docker-dev-local.logistics.corp/$CONTAINER:$TAG
  docker push docker-dev-local.logistics.corp/$CONTAINER:$TAG 
  
  if [ ${LATEST:-false} == 'true' ]; then
    echo "###############################################"
    echo "Tagging this version latest"
    echo "###############################################"
    docker tag $CONTAINER:$TAG docker-dev-local.logistics.corp/$CONTAINER:latest
    docker push docker-dev-local.logistics.corp/$CONTAINER:latest
  fi

}

