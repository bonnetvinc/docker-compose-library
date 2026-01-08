include .env
export

# Color codes
RED=\033[0;31m
GREEN=\033[0;32m
YELLOW=\033[1;33m
CYAN=\033[0;36m
NC=\033[0m # No Color

start-postgres:
	docker compose -f ./docker-compose.postgres.yml up -d

start-keycloak:
	envsubst < ./template/keycloak/realm.json.template > ${KEYCLOAK_REALM_PATH}/${KEYCLOAK_REALM}-realm.json
	docker compose -f ./docker-compose.keycloak.yml up -d
