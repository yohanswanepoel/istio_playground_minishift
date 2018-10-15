# This generates traffic to make dashboards look good
export GATEWAY_URL=$(oc get route -n istio-system istio-ingressgateway -o jsonpath='{.spec.host}')

while sleep .2; do curl -o /dev/null -s -w "%{http_code}\n" http://$GATEWAY_URL/productpage; done
