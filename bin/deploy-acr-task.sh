#!/bin/bash
set -e

GITHUB_TOKEN=$(az keyvault secret show --vault-name infra-vault-prod --name hmcts-github-apikey -o tsv --query value)

az acr task create \
    --registry hmctspublic \
    --name task-ccd-user-profile-importer \
    --file acr-build-task.yaml \
    --context https://github.com/hmcts/ccd-docker-user-profile-importer.git \
    --branch master \
    --git-access-token $GITHUB_TOKEN