# Defaults
PROJECT='www.worldcommunitygrid.org'
WEAK_KEY='949787_15ca7825fb58f9d01b6ad15221c3f048'

# Start BOINC
/usr/bin/boinc \
  --attach_project \
    $PROJECT \
    $WEAK_KEY \
  --no_priority_change

