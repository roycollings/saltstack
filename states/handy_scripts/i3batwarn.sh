#!/usr/bin/env bash
# Add the folowing line to check battery status every minute
# */1 * * * * /PATH/TO/YOUR/SCRIPT/i3batwarn.sh

export LOCK_FILE=/tmp/battery_state.lock
if [[ -a $LOCK_FILE ]]
then
    pid=$(cat $LOCK_FILE | awk '{print $1}')
	ppid=$(cat $LOCK_FILE | awk '{print $2}')
	
	vpid=${pid:-"0"}
	vppid=${ppid:-"0"}

    if (( $vpid < 2 || $vppid < 2 ))
    then
		# corrupt lock file $LOCK_FILE ... Exiting
		cp -f $LOCK_FILE ${LOCK_FILE}.`date +%Y%m%d%H%M%S`
		exit
	fi

    # check if ppid matches pid
	ps -f -p $pid --no-headers | grep $ppid >/dev/null 2>&1

    if [[ $? -eq 0 ]]; then
		# another copy of script running with process id $pid
		exit
	else
		# bogus lock file found, removing
		rm -f $LOCK_FILE >/dev/null
	fi
fi
pid=$$
ps -f -p $pid --no-headers | awk '{print $2,$3}' > $LOCK_FILE

BATTERY=$(ls /sys/class/power_supply/ | grep '^BAT')
ACPI_PATH="/sys/class/power_supply/$BATTERY"
STAT=$(cat $ACPI_PATH/status)
REM=`grep "POWER_SUPPLY_ENERGY_NOW" $ACPI_PATH/uevent | cut -d= -f2`
FULL=`grep "POWER_SUPPLY_ENERGY_FULL_DESIGN" $ACPI_PATH/uevent | cut -d= -f2`
PERCENT=`echo $(( $REM * 100 / $FULL ))`
LIMIT="15"
MESSAGE="WARNING: Battery below ${LIMIT}%!"

if [ $PERCENT -le "$(echo $LIMIT)" ] && [ "$STAT" == "Discharging" ]
then
    DISPLAY=:0.0 /usr/bin/i3-nagbar -m "$(echo $MESSAGE)" -t error
fi
