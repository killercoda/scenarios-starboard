FILE=/ks/wait-background.sh; while ! test -f ${FILE}; do clear; sleep 0.1; done; bash ${FILE}
kubectl apply -f https://raw.githubusercontent.com/aquasecurity/starboard/v0.15.4/deploy/static/starboard.yaml
kubectl -n starboard-system wait deploy --all --for condition=available --timeout=1h