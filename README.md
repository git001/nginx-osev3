# nginx-osev3

Build and run nginx on Openshift version 3

oc new-project nginx-test  
oc create -f nginx-osev3.yaml
oc get pods  

To get the nginx error logs you must select the nginx-test container  
oc logs -f -c nginx-test <thePod>  

To get the nginx access logs you must select the socklog container  
oc logs -f -c ng-socklog <thePod>  

a log enty looks like this.
```
[al@localhost nginx-osev3]$ oc logs -f -c ng-socklog nginx-test-1-pf3cr
listening on 0.0.0.0:8514, starting.
10.1.4.1: local7.info: Feb 21 00:21:14 nginx-test-1-pf3cr nginx: 10.1.2.1 - - [21/Feb/2016:00:21:14 +0000] "GET / HTTP/1.1" 200 612 "-" "curl/7.29.0" "84.113.182.69"
10.1.4.1: local7.info: Feb 21 00:21:21 nginx-test-1-pf3cr nginx: 10.1.2.1 - - [21/Feb/2016:00:21:21 +0000] "GET /asdasd HTTP/1.1" 404 169 "-" "curl/7.29.0" "84.113.182.69"
```

# TODOs for a real setup
- clone this repo
- copy your config and adopt it to the Openshift setup
- copy your document root
- if you need persistentvolumes for uploaded files or so adopt the mount path in your app config
- I'm sure there are lot more TODOs ;-)
