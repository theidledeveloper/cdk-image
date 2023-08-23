#!/bin/bash
set -eu

# REPOSITORY TO CHECK FOR NEW TAG
REPO_OWNER="aws"
REPO_NAME="aws-cdk"

# GET ALL OF THE REPO TAGS
TAGS=$(wget -qO- --header "Authorization: token ${TOKEN}" "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/tags")
# WE CARE OLY FOR THE LATEST TAG SO GET ITS URL
TAG_COMMIT_URL=$(echo $TAGS | jq -r '.[0].commit.url')
# GET THE TAG NAME AS WE USE IT FOR OUR OWN TAGS
TAG_NAME=$(echo $TAGS | jq -r '.[0].name')
# TRIM TAG TO REMOVE THE 'v' PREFIX
TAG_NAME_TRIMMED="${TAG_NAME:1}"
# NOW GET THE COMMIT DETAILS
COMMIT=$(wget -qO- --header "Authorization: token ${TOKEN}" "${TAG_COMMIT_URL}")
# EXTRACT THE DATE OF THE COMMIT AND MAKE IT A TIMESTAMP
TIMESTAMP=$(echo $COMMIT | jq -r '.commit.author.date' | date -f - +%s)
# GET THE CURRENT TIME
CURRENT_TIMESTAMP=$(date +%s)
# AND SUBTRACT 24 HOURS AS WE CHECK 1 TIME PER DAY
TIMESTAMP_24_HOURS_AGO=$((CURRENT_TIMESTAMP - 86400))

# CHECK IF OUR TAG WAS CREATED WITHIN THE LAST 24 HOURS
if [[ $TIMESTAMP -gt $TIMESTAMP_24_HOURS_AGO ]]; then
  echo "Found a tag with name $TAG_NAME within the last 24 hours. Tagging this repository to trigger rebuild"
  git tag "${TAG_NAME_TRIMMED}"
  git push origin "${TAG_NAME_TRIMMED}"
else
  echo "No new releases found, nothing to do"
fi
