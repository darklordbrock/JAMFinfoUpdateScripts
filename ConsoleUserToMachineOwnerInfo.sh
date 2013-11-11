#!/bin/bash

#Get the current logged in user to console
U=`who |grep console| awk '{print $1}'`

ADWORK=`id $U`
if [[ "$ADWORK" == "id: $U: no such user" ]]; then
	echo "This console user is not in AD"
	exit 1
else
	/usr/sbin/jamf recon -endUsername $U
fi

exit 0