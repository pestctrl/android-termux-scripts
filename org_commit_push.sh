cd /sdcard/agenda

if ! git diff --quiet
then
    git add .
    git commit -m "Mobile autocommit: $(date +'%D %T')"
    git push --force -u origin mobile
else
    git pull --ff-only
fi
