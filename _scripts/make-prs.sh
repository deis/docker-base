#!/usr/bin/env bash

ARCH="$(uname)"
ORG="deis"
REPOS=${REPOS:-builder controller clusterator docker-go-dev dockerbuilder e2e-runner fluentd logbomb logger minio monitor nsq postgres redis steward steward-cf registry-token-refresher router workflow-manager workflow-migration}

OLD_VERSION=${OLD_VERSION:-v0.3.6}
NEW_VERSION=${NEW_VERSION:-v0.3.7}

for repo in $REPOS; do
    echo "cloning $USER/$repo to /tmp/$repo..."
    # clone from the upstream org so we have the latest master; the forks may be outdated
    git clone "git@github.com:$ORG/$repo" "/tmp/$repo"
    pushd "/tmp/$repo"
        branch_name="bump-deis-base-$NEW_VERSION"
        url="https://github.com/$USER/$repo/pull/new/$branch_name"
        # now target the user's fork so we're not writing to the upstream org
        git remote set-url origin "git@github.com:$USER/$repo"
        git checkout -b "$branch_name"
        find . -type f | xargs sed -i "s,FROM quay.io/deis/base:$OLD_VERSION,FROM quay.io/deis/base:$NEW_VERSION,g"
        git commit -am "chore(Dockerfile): update deis/base to $NEW_VERSION"
        git push origin "$branch_name"
        if [[ "$ARCH" == "Linux" ]]; then
            xdg-open "$url"
        elif [[ "$ARCH" == "Darwin" ]]; then
            open "$url"
        fi
    popd
done
