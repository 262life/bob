# Documentation
# BOB  Quickstart
This guide will walk you through the basic setup of Bob enable the backend services.
## Minimum Version
Kubernetes **v1.15** or higher is supported by Bob.
Helm version **3.x** or higher is supported by Bob.
## Prerequisites
To make sure you have a Kubernetes cluster that is ready for `BOB`, you can [follow these instructions](k8s-pre-reqs.md).

In order to configure the Bob services, at least one of these local storage options are required:
**TBD**
- Raw devices (no partitions or formatted filesystems)
- Raw partitions (no formatted filesystem)
- PVs available from a storage class in `block` mode

You can confirm whether your partitions or devices are formatted filesystems with the following command.
## TL;DR
If you're feeling lucky, a simple Bob cluster can be created with the following `helm 3` command.  No `values.yaml` is necessary. For the more detailed install, skip to the next section to [deploy the BOB cluster](#deploy-the-bob-cluster).
    console
    
    #Set the version to a production semantic version
    helm3 report add bob https://BobDotMe.github.io/bob    
    kubectl create namespace bob
    helm3 install bob bob/bob --version 0.8-7-rc.3 


After the cluster is running, you must now install the BOB plugins.  You WILL require administrator proviledges on your workstation or server to do so.  This is NOT intended to be installed on the K8s hosts.

    console
    
    #Set the version to a production semantic version
    export vers="v0.9.7"; curl --location --silent -o - https://github.com/BobDotMe/bob/releases/download/${vers}/installer.sh | bash -s -- ${vers}

## kubectl plugin
Details on the plugin can be found [here](commands.md).
## Deploy the BOB Cluster


The first step is to deploy the BOB cluster. Check that you are using ...
    console
    
    helm3 install bob bob/bob --version 0.8-var7-rc.5 --set  "image.pullPolicy=Always"

## Upgrading

To upgrade the BOB cluster, simply upgrade the helm chart.

    console
    
    helm3 upgrade  bob bob/bob --version v0.8.7-rc.5 [--devel]

When you are done with the test cluster, see [these instructions](ceph-teardown.md) to clean up the cluster.

## Teardown

To teardown the BOB cluster, simply uninstall the helm chart.

    terminial window
    #helm3 delete  bob 

When you are done with the test cluster, see [these instructions](ceph-teardown.md) to clean up the cluster.
<!--stackedit_data:
eyJoaXN0b3J5IjpbMjk2NDI2ODE1LC0xMjg5Mzk3OTE3LDEzND
QwNjA3OSwyMDA2MzkwMTI2LC0xMTMyODc1MDhdfQ==
-->
