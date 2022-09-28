#!/bin/bash

HOST_FILE="$HOME/.host"

if [ -f "$HOST_FILE" ]; then
    HOSTNAME=$(cat $HOST_FILE)
else
    echo "Hey, what should the branch name be for this device? "
    read HOSTNAME
    echo $HOSTNAME > $HOST_FILE
fi

echo "Remote branch is origin/$HOSTNAME"

cd /sdcard/org/agenda

if ! git diff --quiet
then
    git add -u .
    git commit -m "$HOSTNAME autocommit: $(date +'%D %T')"
else
    git fetch --all
    git pull --ff-only
    for BRANCH in desktop gaming-laptop laptop mobile
    do
        git merge "origin/$BRANCH" --ff-only
    done
fi

git push --force -u origin $HOSTNAME

am startservice -a com.orgzly.intent.action.SYNC_START com.orgzly/com.orgzly.android.sync.SyncService
