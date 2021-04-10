cd /sdcard/agenda

if ! git diff --quiet
then
    git add .
    git commit -m "Mobile autocommit: $(date +'%D %T')"
else
    git fetch --all
    git pull --ff-only
    git merge origin/desktop --ff-only
fi

git push --force -u origin mobile
