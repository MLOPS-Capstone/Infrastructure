# This repo has a makefile to easily create and set infrastructure for **traderbot** capstone
* We use **GCP** to create a container cluster called **traderbot-cluster**
* Model and data artifacts (for bots created with template **boilerplate**) are pushed to **docker** repo **capstone-traderbot** 
* container orchastration is done with **Kubernetes**
* prices data is managed by **postgres**
* bot and data services configuration files are at ./yamls

<br/><br/><br/>

# makefile targets
Create the infrastructure and deploy for the first time


    $ create-infrastructure


Deploy data and bot model services


    $ deploy-services


clear prices database 


    $ kubectl exec -it `kubectl get pods -l app=postgres -o wide | grep -v NAME | awk '{print $$1}'` -- psql -U postgres < ./db/schema.sql
    

Terminate all services


    $ delete-services


Terminate the cluster


    $ delete-cluster






