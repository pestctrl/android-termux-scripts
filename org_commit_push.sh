cd /sdcard/agenda

if ! git diff --quiet
then
    git add .
    git commit -m "Mobile autocommit: $(date +'%D %T')"
    git push -u origin mobile
fi
