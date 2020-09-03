plugins/kubectl/kubectl-bob: line 173: syntax error near unexpected token `('
plugins/kubectl/kubectl-bob: line 173: `      while [[ $(kubectl $POD_CONTEXT get pods $POD_NAME -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do echo -n '.' && sleep .3; done; echo'
