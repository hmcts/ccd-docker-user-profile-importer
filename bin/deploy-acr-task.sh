#!/bin/bash
set -e

az acr task create \
    --registry hmcts \
    --name task-ccd-user-profile-importer \
    --file acr-build-task.yaml \
    --context https://github.com/hmcts/ccd-docker-user-profile-importer.git \
    --branch master \
    --git-access-token $GITHUB_TOKEN