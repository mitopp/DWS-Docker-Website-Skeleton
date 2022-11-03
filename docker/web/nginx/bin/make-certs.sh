#!/bin/sh
set -e

CN=localhost

if [ "${HOSTNAME}" ]; then
	# shellcheck disable=SC2034
	CN="${HOSTNAME}"
fi

if [ ! -d "/etc/nginx/ssl" ] || [ -f "/etc/nginx/ssl/.nomount" ]; then
	echo "Please mount a folder or volume into /etc/nginx/ssl to execute"
	exit 1
else
	echo "Checking self signed Dev-Environment certificates..."

	# shellcheck disable=SC2039
	echo -n "Root-CA Key: "
	if [ ! -f "/etc/nginx/ssl/rootCA.key" ]; then
		echo "generating"
		openssl genrsa -out "/etc/nginx/ssl/rootCA.key" 4096
	else
		echo "already exists"
	fi

	# shellcheck disable=SC2039
	echo -n "Root-CA Cert: "
	if [ ! -f "/etc/nginx/ssl/rootCA.crt" ]; then
		echo "generating"
		# shellcheck disable=SC2039
		openssl req \
			-x509 -new -nodes \
			-key "/etc/nginx/ssl/rootCA.key" \
			-sha256 -days 1024 -config <(cat "/etc/ssl/dev.cnf") \
			-out "/etc/nginx/ssl/rootCA.crt"
	else
		echo "already exists"
	fi

	# shellcheck disable=SC2039
	echo -n "Host Key: "
	if [ ! -f "/etc/nginx/ssl/$CN.crt" ]; then
		echo "generating"
		openssl genrsa -out "/etc/nginx/ssl/$CN.key" 2048
	else
		echo "already exists"
	fi

	# shellcheck disable=SC2039
	echo -n "Host Request: "
	if [ ! -f "/etc/nginx/ssl/$CN.csr" ]; then
		echo "generating"
		openssl req -new -sha256 \
			-key "/etc/nginx/ssl/$CN.key" \
			-config "/etc/ssl/dev.cnf" \
			-subj "/CN=$CN" \
			-config <(cat "/etc/ssl/dev.cnf") \
			-out "/etc/nginx/ssl/$CN.csr"
	else
		echo "already exists"
	fi

	# shellcheck disable=SC2039
	echo -n "Host Certificate: "
	if [ ! -f "/etc/nginx/ssl/$CN.crt" ]; then
		echo "generating"
		openssl x509 -req -sha256 \
			-extfile <(printf "subjectAltName=DNS:$CN,DNS:*.$CN,DNS:localhost,DNS:127.0.0.1") \
			-days 730 \
			-in "/etc/nginx/ssl/$CN.csr" \
			-CA "/etc/nginx/ssl/rootCA.crt" \
			-CAkey "/etc/nginx/ssl/rootCA.key" \
			-CAcreateserial -out "/etc/nginx/ssl/$CN.crt"
		openssl x509 -text -in "/etc/nginx/ssl/rootCA.crt" -noout
		openssl x509 -text -in "/etc/nginx/ssl/$CN.crt" -noout
		echo "done"
		echo "Import certificates and trust on Mac: security add-trusted-cert -r trustRoot -p ssl -k ~/Library/Keychains/login.keychain-db rootCA.crt"
		echo "Import Host certificates on Mac: security add-certificates -k ~/Library/Keychains/login.keychain-db $CN.crt"
	else
		echo "already exists"
	fi

fi

exec "$@"
