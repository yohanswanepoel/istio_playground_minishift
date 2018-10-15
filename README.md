# ISTIO Playground on Minishift

This project uses the Istio add-on for minishift in conjunction with the BookInfo application to create a clean setup for testing out ISTIO.

## Pre-Reqs and Tested Environment
1. Red Hat CDK and Minishift
2. OpenShift verstion 3.10
3. minishift setup-cdk done
4. minishift profile uses 8GB of RAM and 4 cores, so you probably need more
5. Cloned minishift-addons repo https://github.com/minishift/minishift-addon
6. A base working knowledge of Minishift and OpenShift

## Referenced Projects
1. https://github.com/minishift/minishift-addons/tree/master/add-ons/istio
2. https://github.com/Maistra/bookinfo

## Steps to run

### 1. Setup Minishift (Red Hat CDK)
1. Review istio_demo_step1.sh: Change the OpenShift version if required. Default 3.10.45
2. Run: istio_demo_step1.sh
3. Wait for minishift start up and verify that things are working

### 1. Setup Minishift (Origin)
1. Review istio_demo_step1_origin.sh: Change the OpenShift version if required. Default 3.10.0
2. Run: istio_demo_step1_origin.sh
3. Wait for minishift start up and verify that things are working

This will delete the servicemesh profile if it exists and create a new one 

### 2. Install Istio Add-on
1. Review the istio_demo_step2.sh file: CHange the path to minishift-addons or run the file from outside the minishift-addons folder
2. Run the istio_demo_step2.sh file

This will install and enable istio as per the referenced addons project (https://github.com/minishift/minishift-addons/tree/master/add-ons/istio)

Wait for all the under istio system to become available. Elastic Search is typically the last one.

### 3. Install Book-Info
1. Review the istio_demo_step3.sh file
2. Run the istio_demo_step3.sh file

This will install the Book Info demo under My Project for the admin user and expose a gateway using ISTIO. The path to the service can be found running echo $GATEWAY_URL/productpage

Once the services are running you can start playing around.

### 4. Things to try out
This section is Work in Progress
1. export the ISTIO gateway URL as an environment variable: export GATEWAY_URL=$(oc get route -n istio-system istio-ingressgateway -o jsonpath='{.spec.host}')
2. echo $GATEWAY_URL
3. Send some load: while sleep .2; do curl -o /dev/null -s -w "%{http_code}\n" http://$GATEWAY_URL/productpage; done

## TODO
1. Externalise variables
