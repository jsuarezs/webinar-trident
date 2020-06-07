oc get pod -l "lab=jupyter" -n 4-webinar -o jsonpath='{.items[0].metadata.name}'; echo "\n"; oc exec -i -t $(kubectl get pod -l "lab=jupyter" -n 4-webinar -o jsonpath='{.items[0].metadata.name}') -n 4-webinar -- jupyter notebook list

echo ""

oc get pod -l "lab=jupyter" -n 4-webinar -o jsonpath='{.items[1].metadata.name}'; echo "\n"; oc exec -i -t $(kubectl get pod -l "lab=jupyter" -n 4-webinar -o jsonpath='{.items[1].metadata.name}') -n 4-webinar -- jupyter notebook list

echo ""

oc get pod -l "lab=jupyter" -n 4-webinar -o jsonpath='{.items[2].metadata.name}'; echo "\n"; oc exec -i -t $(kubectl get pod -l "lab=jupyter" -n 4-webinar -o jsonpath='{.items[2].metadata.name}') -n 4-webinar -- jupyter notebook list
