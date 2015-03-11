#!/bin/bash

mnt_gradle=""
if [[ -n "$GRADLE_USER_HOME" ]]; then
	mnt_gradle="-v $GRADLE_USER_HOME:/mnt/.gradle"
	echo "Will mount \$GRADLE_USER_HOME with: '${mnt_gradle}'"
fi

mnt_m2=""
if [[ -n "$M2_HOME" ]]; then
	mnt_m2="-v $M2_HOME:/mnt/.m2"
	echo "Will mount \$M2_HOME with: '${mnt_m2}'"
fi

usage() {
	echo "Usage: ${0} [-t <tag>] [<path/to/volume>]"
	echo "Gradle2 Docker run script"
	exit 0
}

gradle_projects_dir="$(pwd)"
tag="latest"

if [[ -n "$1" ]]; then
	if [[ $1 == "-h" ]]; then
		usage
	fi
	if [[ $1 == "-t" ]]; then
		tag="${2}"
		if [[ -n "$3" ]]; then
			gradle_projects_dir="${3}"
		fi
	else
		gradle_projects_dir="${1}"
	fi
fi

echo "Running gradle2:${tag} image with ${gradle_projects_dir} mounted on /mnt/gradle-projects"
docker run -it --rm $mnt_gradle $mnt_m2 -v ${gradle_projects_dir}:/mnt/gradle-projects --name gradle2 mminderbinder/gradle2:${tag} bash
