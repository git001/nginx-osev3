# nginx-osev3

Build and run nginx on Openshift version 3

oc new-project nginx-test  
oc create -f nginx-osev3.yaml
oc get pods  

To get the nginx error logs you must select the nginx-test container  
oc logs -f -c nginx-test <thePod>  

To get the nginx access logs you must select the socklog container  
oc logs -f -c ng-socklog <thePod>  
