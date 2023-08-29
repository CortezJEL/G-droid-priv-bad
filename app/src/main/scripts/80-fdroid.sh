#!/sbin/sh
#
# ADDOND_VERSION=2
#
# /system/addon.d/80-fdroid.sh
# During a system upgrade, this script backs up G-Droid client and privext,
# /system is formatted and reinstalled, then the files are restored.
#

. /tmp/backuptool.functions

list_files() {
cat <<EOF
app/G-Droid.apk
app/G-Droid/G-Droid.apk
etc/permissions/permissions_org.gdroid.gdroid.privileged.xml
priv-app/G-DroidPrivilegedExtension.apk
priv-app/G-DroidPrivilegedExtension/G-DroidPrivilegedExtension.apk
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/"$FILE"
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/"$FILE" "$R"
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac
