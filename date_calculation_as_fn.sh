#!/bin/bash

#------------------------------------------------------------------------------------------------------------------------------------------------

fn_min_to_sec(){
    # in: $INTERVAL_MIN
    # out: $INTERVAL_SEC
    
    INTERVAL_SEC=$(($INTERVAL_MIN*60))
    echo $INTERVAL_SEC
}

fn_round_unixtime(){
    # calculate interval
    #
    # in: $UNIXTIME, $INTERVAL_SEC
    # out: $UNIXTIME_ROUNDED

    INTERVAL_MOD=$(($UNIXTIME%$INTERVAL_SEC))
    UNIXTIME_ROUNDED=$(($UNIXTIME-$INTERVAL_MOD))

    echo $UNIXTIME_ROUNDED
}

#------------------------------------------------------------------------------------------------------------------------------------------------

UNIXTIME=$(date +%s)
echo 'current time: '$(date -d @$UNIXTIME +"%Y/%m/%d %T")

INTERVAL_MIN=15 # 15 mins
INTERVAL_SEC=`fn_min_to_sec`
UNIXTIME_ROUNDED=`fn_round_unixtime`
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
