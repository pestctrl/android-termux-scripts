HOST_FILE="$HOME/.host"

if [ -f "$HOST_FILE" ]; then
    HOSTNAME=$(cat $HOST_FILE)
else
    echo "Hey, what should the branch name be for this device? "
    read HOSTNAME
    echo $HOSTNAME > $HOST_FILE
fi

echo "Remote branch is origin/$HOSTNAME"

cd /sdcard/agenda

if ! git diff --quiet
then
    git add .
    git commit -m "$HOSTNAME autocommit: $(date +'%D %T')"
else
    git fetch --all
    git pull --ff-only
    git merge origin/desktop --ff-only
fi

git push --force -u origin $HOSTNAME

am startservice -a com.orgzly.intent.action.SYNC_START com.orgzly/com.orgzly.android.sync.SyncService
