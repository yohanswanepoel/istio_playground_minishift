# Deploy the application
# Use user admin
oc login -u admin -p aa
oc new-project myproject
oc adm policy add-scc-to-user anyuid -z default -n myproject
oc adm policy add-scc-to-user privileged -z default -n myproject
wget https://raw.githubusercontent.com/Maistra/bookinfo/master/bookinfo.yaml
oc apply -n myproject -f <(istioctl kube-inject -f bookinfo.yaml)
oc apply -n myproject -f bookinfo.yaml
oc apply -n myproject -f https://raw.githubusercontent.com/Maistra/bookinfo/master/bookinfo-gateway.yaml
export GATEWAY_URL=$(oc get route -n istio-system istio-ingressgateway -o jsonpath='{.spec.host}')

echo $GATEWAY_URL

#http://$GATEWAY_URL/productpage

curl -o destination-rule-all.yaml https://raw.githubusercontent.com/istio/istio/release-1.0/samples/bookinfo/networking/destination-rule-all.yaml
oc apply -f destination-rule-all.yaml
rm destination-rule-all.yaml

rm bookinfo.yaml
