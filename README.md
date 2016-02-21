# nginx-osev3

Build and run nginx on Openshift version 3

oc new-project nginx-test  
oc create -f nginx-osev3.yaml
oc get pods  

To get the nginx error logs you must select the nginx-test container  
oc logs -f -c nginx-test <thePod>  

To get the nginx access logs you must select the socklog container  
oc logs -f -c ng-socklog <thePod>  

# TODOs for a real setup
- clone this repo
- copy your config and adopt it to the Openshift setup
- copy your document root
- if you need persistentvolumes for uploaded files or so adopt the mount path in your app config
- I'm sure there are lot more TODOs ;-)
