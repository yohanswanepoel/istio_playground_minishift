# Routes all traffice to version of the review service
oc delete virtualservice reviews
oc create -f https://raw.githubusercontent.com/istio/istio/release-1.0/samples/bookinfo/networking/virtual-service-all-v1.yaml
./route
