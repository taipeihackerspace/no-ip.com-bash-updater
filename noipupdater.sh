#!/bin/bash

# Get script's directory
# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source secrets
. "${DIR}/.credentials"

# Get current IP and where the DNS settings point to
NEWIP=$(curl --silent ifconfig.me)
DNSIP=$(dig +short $HOSTNAME)

if [ "$DNSIP" != "$NEWIP" ]; then
	RESULT=$(curl --silent "https://$NOIPUSERNAME:$NOIPPASSWORD@dynupdate.no-ip.com/nic/update?hostname=$NOIPHOST&myip=$NEWIP")
	LOGLINE="[$(date +"%Y-%m-%d %H:%M:%S")] $RESULT"
else
	LOGLINE="[$(date +"%Y-%m-%d %H:%M:%S")] No IP change"
fi

echo $LOGLINE >> "${DIR}/noipupdater.log"

exit 0

