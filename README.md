# nginx-osev3

Build and run nginx on Openshift version 3

oc new-project nginx-test  
oc create -f nginx-osev3.yaml
oc expose svc nginx-test
oc get pods  

To get the nginx error logs you must select the nginx-test container  
oc logs -f -c nginx-test <thePod>  

To get the nginx access logs you must select the socklog container  
oc logs -f -c ng-socklog <thePod>  

a log enty looks like this.
```
[al@localhost nginx-osev3]$ oc logs -f -c ng-socklog nginx-test-2-6em5w
listening on 0.0.0.0:8514, starting.
10.1.5.1: local7.info: Feb 21 00:30:08 nginx-test-2-6em5w nginx: <REAL_IP> - - [21/Feb/2016:00:30:08 +0000] "GET /asdasd HTTP/1.1" 404 169 "-" "curl/7.29.0" "<x_forwarded_for_IP>"
10.1.5.1: local7.info: Feb 21 00:31:03 nginx-test-2-6em5w nginx: <REAL_IP> - - [21/Feb/2016:00:31:03 +0000] "GET / HTTP/1.1" 200 612 "my_referer" "curl/7.29.0" "<x_forwarded_for_IP>"
```

# TODOs for a real setup
- clone this repo
- copy your config and adopt it to the Openshift setup
- copy your document root
- if you need persistentvolumes for uploaded files or so adopt the mount path in your app config
- I'm sure there are lot more TODOs ;-)
