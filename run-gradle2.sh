#!/bin/bash

if [[ -z "$1" ]]; then
	gradle_projects_dir=$(pwd)
else
	gradle_projects_dir="${1}"
fi
echo "Running gradle2 image with ${gradle_projects_dir} mounted on /mnt/gradle-projects"
docker run -it --rm -v ${gradle_projects_dir}:/mnt/gradle-projects --name gradle mminderbinder/gradle2:0.9.15 bash
