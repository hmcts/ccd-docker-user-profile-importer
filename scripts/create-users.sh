#!/bin/sh
set -e

chmod +x /scripts/*.sh

[ "_${CCD_USERS}" = "_" ] && echo "No users to load from CCD_USERS. Script terminated." && exit 0

if [ ${VERBOSE} = "true" ]; then
  export CURL_OPTS="--fail --verbose"
else
  export CURL_OPTS="--fail --silent --show-error"
fi

echo "Getting service_token from s2s"
serviceToken=$(curl --fail --silent --show-error -X POST ${AUTH_PROVIDER_BASE_URL}/testing-support/lease -d "{\"microservice\":\"${MICROSERVICE}\"}" -H 'content-type: application/json')

users=$(echo "${CCD_USERS}" | tr "," "\n")
for user in $users
do
    echo "Adding \"$user\" ..."
    post=$(curl --fail --silent --show-error -X POST ${CCD_USER_PROFILE_URL}/user-profile/users  -H "content-type: application/json" -H "ServiceAuthorization: Bearer ${serviceToken}" -d "{\"id\": \"${user}\",\"jurisdictions\": [{\"id\": \"${JURISDICTION}\"}],\"work_basket_default_jurisdiction\": \"${JURISDICTION}\",\"work_basket_default_case_type\": \"${DEFAULT_CASE_TYPE}\",\"work_basket_default_state\": \"${DEFAULT_CASE_STATE}\"}\"")
    echo "done: ${post}"
done
