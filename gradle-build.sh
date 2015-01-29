#!/bin/bash

if [[ -z "${GRADLE_PROJECTS_DIR}" ]]; then
	GRADLE_PROJECTS_DIR=/mnt/gradle-projects
fi

for item in $GRADLE_PROJECTS_DIR/* ; do
	if [[ ! -d "${item}" ]]; then
		echo "Not a project directory, skipping: ${item}"
	else
		cd ${item}
		echo "Building ${item}..."
		gradle build
	fi
done
