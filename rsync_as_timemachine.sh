#/bin/bash
PATHTOBACKUP="/home/<SETremoteusername>/backups/backedup_hosts/$HOSTNAME/$USER"
SOURCE="/home/$USER"
DEST="usr@hostame:$PATHTOBACKUP"

ssh -p 2222 usr@hostame "mkdir -p $PATHTOBACKUP/current/"

date=`date "+%Y-%m-%dT%H:%M"`

rsync -azvPe "ssh -p 2222" --delete --delete-excluded --exclude-from=002-rsync_timemachine_exclude.txt --link-dest=$PATHTOBACKUP/current $SOURCE $DEST/backup-$date

ssh -p 2222 usr@hostame "rm -rf $PATHTOBACKUP/current && ln -s $PATHTOBACKUP/backup-$date $PATHTOBACKUP/current"
