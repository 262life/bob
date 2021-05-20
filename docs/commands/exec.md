# Executes a BOB pod

This command in its basic form will attach to a new BOB pod in the current namespace and execute an interactive BASH shell.

## Examples:

    # Attach to a pod in the current namespace
      kubectl bob exec --name xxx
    
      # Attach to a pod in the supplied  namespace
      kubectl bob exec --name xxx -n namespace

## Options:
        --context='': The name of the kubeconfig context to use
    -h, --help: If present, print this help message
        --name='': If present this will be the name of the POD
    -n, --namespace='': If present, the namespace scope for this CLI request
    -v, --verbose: If present, will increase the verbosity by one each time it's passed

## Usage:
    #  kubectl bob  exec [-v|--verbose] [--context[=]<value>] [-n|--namespace[=]<value>] [-h|--help] [--name[=]<value] -- [commands]
