#!/bin/sh
set -e

# arguments
# 1: package 	(default: symfony/skeleton)
# 2: version 	(default: latest)
# 3: directory	(default: /srv/app)
# 4: stability 	(default: stable)

# user prompt
# shellcheck disable=SC2039
read -p "Are you sure? All existing files in ${3:-/srv/app} will be deleted! " -n 1 -r
echo    # (optional) move to a new line

# shellcheck disable=SC2039
if [[ $REPLY =~ ^[Yy]$ ]]; then
	# prepare workdir
	echo "Prepare the working directory..."
	rm -r "${4:-/srv/app}"/*

	# create project
	echo "Create the project..."
	composer create-project \
		"${1:-symfony/skeleton}":"${2:-""}" \
		"${3:-/srv/app}" \
		--stability="${4:-stable}" \
		--prefer-dist \
		--no-progress \
		--no-interaction \
		--no-install

	# done
	echo "Done. Please install the packages."
fi
