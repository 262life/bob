# Displays status of all running BOB pods

This command will display the status of all running BOB pods in the current namespace.

## Examples:
  
    # List all pods in ps output format.
      kubectl bob status
      
      # List all pods in ps output format in a namespace
      kubectl bob status  -n namespace

## Options:

        --all-namespaces: If present, all namespaces are in scope for this CLI request
        --context='': The name of the kubeconfig context to use
    -h, --help: If present, print this help message
    -n, --namespace='': If present, the namespace scope for this CLI request
    -v, --verbose: If present, will increase the verbosity by one each time it's passed

## Usage:

    #  kubectl bob status  [-v|--verbose] [--context[=]<value>] [-n|--namespace[=]<value> [--all-namespaces] [-h|--help]
