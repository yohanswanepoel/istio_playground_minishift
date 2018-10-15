# This script sets up istio
# It assumes you have cloned the repo and is running the script one level up
# oc adm policy add-cluster-role-to-user cluster-admin admin --as=system:admin
# Requires: git clone https://github.com/minishift/minishift-addons
# run from folder just outside the git pull repo
# also run this minishift oc-env and set path
minishift addon install ./minishift-addons/add-ons/istio
minishift addon enable istio
minishift addon apply istio

