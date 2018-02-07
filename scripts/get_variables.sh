#!/bin/bash -e
set -e

export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo
echo "GCLOUD_PROJECT_ID"
gcloud config get-value project
echo
echo "GCLOUD_ZONE"
gcloud config get-value compute/zone
echo
echo "GCLOUD_CLUSTER_ID"
echo dotmesh-gke-cluster
echo
echo "GCLOUD_SERVICE_KEY"
cat "$DIR/../serviceaccount.json" | base64
echo
echo "These values should be added as Secret variables to:"
echo "http://$GITLAB_IP/root/gitlab-k8s-example/settings/ci_cd"
echo