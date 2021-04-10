cd /sdcard/agenda

if ! git diff --quiet
then
    git add .
    git commit -m "Mobile autocommit: $(date +'%D %T')"
    git push --force -u origin mobile
else
    git fetch --all
    git pull --ff-only
    git merge origin/desktop --ff-only
fi
