create-infrastructure:
	gcloud container clusters create traderbot-cluster \
    --region "us-central1" \
    --machine-type "e2-standard-2" --disk-type "pd-standard" --disk-size "100" \
    --num-nodes "1" --node-locations "us-central1-b","us-central1-c"
	gcloud artifacts repositories create "capstone-traderbot" --repository-format=Docker --location=us-central1
	kubectl apply -f ./yamls

deploy-services:
	kubectl apply -f ./yamls

delete-services:
	kubectl delete -f ./yamls

reset-db:
	kubectl exec -it `kubectl get pods -l app=postgres -o wide | grep -v NAME | awk '{print $$1}'` -- psql -U postgres < ./db/schema.sql
	
delete-cluster:
	gcloud container clusters delete traderbot-cluster

auth:
	gcloud container clusters get-credentials traderbot-cluster --region us-central1