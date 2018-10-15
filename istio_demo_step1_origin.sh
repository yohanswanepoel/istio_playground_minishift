minishift profile delete servicemesh
minishift profile set servicemesh
minishift config set memory 10GB
minishift config set cpus 4
minishift config set image-caching true
minishift config set openshift-version v3.10.0
minishift addon enable admin-user
minishift addon enable anyuid
minishift start
