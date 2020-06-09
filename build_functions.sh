##################  Do not modify anything here #############################

build_container() { 

  #cd `dirname $0`
  #export CONTAINER=`basename $(pwd)`
  export CONTAINER=${1}

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
  docker rmi -f bobdotme/$CONTAINER:$TAG 2>/dev/null
  echo  ${docker_token} | docker --debug login --password-stdin --username ${docker_login} 
 
  if [ ${DOCKERFILE:-none} == 'none'  ]; then
    DOCKERFILE='Dockerfile'
  else
    echo "Custom Dockerfile: $DOCKERFILE"
    DOCKERFILE=${DOCKERFILE}
  fi

  docker build -f ${DOCKERFILE} -t $CONTAINER:$TAG  .
  
  docker tag  $CONTAINER:$TAG bobdotme/$CONTAINER:$TAG
  docker push bobdotme/$CONTAINER:$TAG 
  
  if [ ${LATEST:-false} == 'true' ]; then
    echo "###############################################"
    echo "Tagging this version latest"
    echo "###############################################"
    docker tag $CONTAINER:$TAG bobdotme/$CONTAINER:latest
    docker push bobdotme/$CONTAINER:latest
  fi

}

