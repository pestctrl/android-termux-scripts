if ! command -v termux-job-scheduler &> /dev/null
then
    echo "Couldn't find termux-job-scheduler"
    echo "Make sure to install the termux:api package, and run 'pkg install termux-api'"
    exit -1
fi

termux-job-scheduler -s "/data/data/com.termux/files/home/android-termux-scripts/org_commit_push.sh" --period-ms 300000 --network unmetered --persisted true
