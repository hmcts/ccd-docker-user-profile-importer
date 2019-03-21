# ccd-docker-user-profile-importer

Docker image to load user profiles into CCD.


## Configuration

The scripts that load the users expect the following environment to be available.

| Parameter                | Description                                                                                                                 | Default                                                                                                                         |
|--------------------------|-----------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| `CCD_USERS` | Comma separated string of users to add - note: these should already exist in IDAM! The script terminates if this is empty. | `` |
| `WAIT_HOSTS` | Hosts to wait for before loading the definitions | `ccd-user-profile-api:4453` |
| `VERBOSE` | Output extra info | `false` |
| `AUTH_PROVIDER_BASE_URL` | Base URL for the service auth provider to get a token for the import | `http://service-auth-provider-api:8080` |
| `MICROSERVICE` | Authorised microservice for accessing user profile service. | `ccd_definition` |
| `CCD_USER_PROFILE_URL` | CCD User Profile Service URL. | `http://ccd-user-profile-api:4453` |
