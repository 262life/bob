# Creates a BOB pod

This command in its basic form will create a new BOB pod in the current namespace 
and execute an interactive BASH shell.

## Examples:

      #Create a pod in the current namespace
      kubectl bob 
    
      #Create a pod in the supplied  namespace
      kubectl bob -n namespace

## Options:
        --context='': The name of the kubeconfig context to use
        --cert: Mount /etc/certs from host
    -h, --help: If present, print this help message
        --iperf: Enable Iperf Service (Roadmap: Not Complete)
        --name='': If present this will be the name of the POD
    -n, --namespace='': If present, the namespace scope for this CLI request
        --nowait: Do not start a shell, just create pod
    -o, --output='': If present change the output.  'yaml' is the only supported format at the moment
        --pki: Mount /etc/PKI from host
        --pvc='': If present attach the named PVC to the pod and mount as /vols/pvname
        --rsync: Enable Rsync Service (Roadmap: Not Complete)
        --ssh: Enable SSH Service (Roadmap: Not Complete)
    -v, --verbose: If present, will increase the verbosity by one each time it's passed
# usage:
  

    # kubectl bob  [-v|--verbose] [--context[=]<value>] [-n|--namespace[=]<value>] [--cert] [-h|--help] [--iperf] [--name[=]<value>] [-o|--output[=]<value>] [--pki] [--pvc[=]<value>] [--rsync] [--ssh]
