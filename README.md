# nginx-osev3

Build and run nginx on Openshift version 3

oc new-project nginx-test-project
oc new-app https://github.com/git001/nginx-osev3.git --name=nginx-test
oc get pods
oc logs -f <thePod>
