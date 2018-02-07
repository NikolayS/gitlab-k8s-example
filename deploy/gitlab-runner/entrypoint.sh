#!/bin/bash

set -xe

if [ -z "${GITLAB_RUNNER_TOKEN}" ]; then
  echo >&2 "GITLAB_RUNNER_TOKEN needed"
  exit 1
fi

if [ -z "${GITLAB_URL}" ]; then
  echo >&2 "GITLAB_URL needed"
  exit 1
fi

# Register the runner
gitlab-runner register --non-interactive \
  --url ${GITLAB_URL} \
  --registration-token ${GITLAB_RUNNER_TOKEN} \
  --executor docker \
  --description "gitlab-docker-runner" \
  --docker-image "docker:latest" \
  --docker-privileged \
  --docker-volumes /var/run/docker.sock:/var/run/docker.sock

# Start the runner
gitlab-runner run --user=gitlab-runner \
  --working-directory=/home/gitlab-runner