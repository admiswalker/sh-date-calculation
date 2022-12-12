#!/bin/bash

UNIXTIME=$(date +%s)

echo 'current time: '$(date -d @$UNIXTIME +"%Y/%m/%d %T")

#------------------------------------------------------------------------------------------------------------------------------------------------
# calculate interval

# in: $UNIXTIME
# out: $UNIXTIME_ROUNDED

INTERVAL_MIN=15 # 15 mins
INTERVAL_SEC=$(($INTERVAL_MIN*60))
#echo 'INTERVAL: '$INTERVAL_MIN' min ('$INTERVAL_SEC' sec)'

INTERVAL_MOD=$(($UNIXTIME%$INTERVAL_SEC))
#echo 'INTERVAL_MOD: '$INTERVAL_MOD' sec'

UNIXTIME_ROUNDED=$(($UNIXTIME-$INTERVAL_MOD))
#echo 'UNIXTIME_ROUNDED: '$UNIXTIME_ROUNDED' sec'

echo 'rounded time: '$(date -d @$UNIXTIME_ROUNDED +"%Y/%m/%d %T")

#------------------------------------------------------------------------------------------------------------------------------------------------
# calculate begin and end of UNIXTIME interval

# in: UNIXTIME_ROUNDED, INTERVAL_SEC
# out: UNIXTIME_BEGIN, UNIXTIME_END

UNIXTIME_BEGIN=$(($UNIXTIME_ROUNDED-$INTERVAL_SEC))
UNIXTIME_END=$(($UNIXTIME_ROUNDED-1))

echo 'UNIXTIME_BEGIN: '$(date -d @$UNIXTIME_BEGIN +"%Y/%m/%d %T")
echo 'UNIXTIME_END: '$(date -d @$UNIXTIME_END +"%Y/%m/%d %T")

#------------------------------------------------------------------------------------------------------------------------------------------------
