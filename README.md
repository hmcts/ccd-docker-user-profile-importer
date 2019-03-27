# ccd-docker-user-profile-importer

Docker image to load user profiles into CCD.

## Building

Any commit or merge into master will automatically trigger an Azure ACR task. This task has been manually
created using `./bin/deploy-acr-task.sh`. The task is defined in `acr-build-task.yaml`. 

Note: you will need a GitHub personal token defined in `GITHUB_TOKEN` environment variable to run deploy script (https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line). The token is for setting up a webhook so Azure will be notified when a merge or commit happens. Make sure you are a repo admin and select token scope of: `admin:repo_hook  Full control of repository hooks`

More info on ACR tasks can be read here: https://docs.microsoft.com/en-us/azure/container-registry/container-registry-tasks-overview

## Configuration

The scripts expect the following environment to be available.

| Parameter | Description  |
|-------------|------------|
| `CCD_USERS` | Comma separated string of CCD user items to add - note: these should already exist in IDAM! The script terminates if this is empty. Each user item must contain, in exactly this format: `EMAIL\|JURISDICTION\|DEFAULT_CASE_TYPE\|DEFAULT_CASE_STATE` | 
| `CCD_JURISDICTIONS` | Comma separated string of CCD jurisdictions to add - note: these will relate to above users! The script terminates if this is empty. | 
| `WAIT_HOSTS` | Hosts to wait for before loading the definitions. (optional) |
| `WAIT_HOSTS_TIMEOUT` | How long to wait in seconds for before giving up. (optional) |
| `VERBOSE` | Output extra info. (optional) | 
| `AUTH_PROVIDER_BASE_URL` | Base URL for the service auth provider to get a token for the import | 
| `MICROSERVICE` | Authorised microservice for accessing user profile service. E.g. `ccd_definition` | 
| `CCD_USER_PROFILE_URL` | CCD User Profile Service URL. | 
| `CCD_USER_PROFILE_DB_HOST` | CCD User Profile Database Host - will be used to add jurisdiction. |
| `CCD_USER_PROFILE_DB_PORT` | CCD User Profile Database Port. | 
| `CCD_USER_PROFILE_DB_USERNAME` | CCD User Profile Database Username. |
| `CCD_USER_PROFILE_DB_PASSWORD` | CCD User Profile Database Password. | 
| `CCD_USER_PROFILE_DB_DATABASE` | CCD User Profile Database Name - e.g. `user_profile`. | 
