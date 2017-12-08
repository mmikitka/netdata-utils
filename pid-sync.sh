#!/bin/sh

main() {
  apps_groups_path="$1"
  process="$2"

  orig="/tmp/apps_groups.conf.orig"
  new="/tmp/apps_groups.conf.new"
  cur="$1"
  cp $apps_groups_path $orig
  while [ 1 ]; do
    cp $orig $new
    active=$(ps ax | grep "$process" | grep -vE "grep|/bin/sh" | awk '{print $5}')
    if [ $? -eq 0 ]; then
      for p in $active; do
        echo "${p}: ${p}" >> $new
      done

      diff $cur $new
      if [ $? -ne 0 ]; then
        echo "`date`: Diff detected"
        cp $new $cur
      fi
    fi

    sleep 5
  done
}

usage () {
  echo "Usage :  $0 [-f path] process

    Options:
    -f <path>    Path to Netdata apps_groups.conf

    Positional arguments:
    process      Regex of process to track
  "
}

apps_groups_path="/opt/netdata/netdata-configs/apps_groups.conf"

while getopts ":f:h" opt
do
  case $opt in
    f) apps_groups_path="$OPTARG";;
    h) usage; exit 0;;
    *) echo -e "\n Option does not exist : $OPTARG\n"
       usage; exit 1;;
  esac
done
shift $(($OPTIND-1))

if [ $# -eq 0 ]; then
  echo "You must supply a process to track\n"
  usage
  exit 1
fi
process=$1
shift

main "$apps_groups_path" "$process" "$@"
