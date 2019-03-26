#!/bin/sh
set -e

chmod +x /scripts/*.sh

[ "_${CCD_USER_PROFILE_DB_HOST}${CCD_USER_PROFILE_DB_PORT}${CCD_USER_PROFILE_DB_USERNAME}${CCD_USER_PROFILE_DB_PASSWORD}${CCD_USER_PROFILE_DB_DATABASE}" = "_" ] && echo "No database defined for CCD_USER_PROFILE_DB_HOST / CCD_USER_PROFILE_DB_PORT / CCD_USER_PROFILE_DB_USERNAME / CCD_USER_PROFILE_DB_PASSWORD / CCD_USER_PROFILE_DB_DATABASE. Script terminated." && exit 0

if [ ${VERBOSE} = "true" ]; then
  export CURL_OPTS="--fail --verbose"
else
  export CURL_OPTS="--fail --silent --show-error"
fi

jurisdictions=$(echo "${CCD_JURISDICTIONS}" | tr "," "\n")
for JURISDICTION in $jurisdictions
do
    PGPASSWORD=${CCD_USER_PROFILE_DB_PASSWORD} psql -v ON_ERROR_STOP=1 -w -h ${CCD_USER_PROFILE_DB_HOST} -U ${CCD_USER_PROFILE_DB_USERNAME} -d ${CCD_USER_PROFILE_DB_DATABASE} <<-EOSQL
      INSERT INTO jurisdiction VALUES ('${JURISDICTION}') ON CONFLICT DO NOTHING;
EOSQL
done
