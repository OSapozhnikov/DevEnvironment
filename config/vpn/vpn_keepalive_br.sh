#! /bin/sh
debug_out=/dev/null
#debug_out=/dev/stdout
#Internal Server IP
NEXTHOP=10.5.15.1
# Restart command
#OPEN_VPN_CMD="sudo systemctl restart openvpn@server.service"
OPEN_VPN_CMD="sudo systemctl restart openvpn@user.service"
PING=/bin/ping
logger_opts="-t $0"
if [ "$debug_out" = "/dev/stdout" ]
then
        logger_opts="$logger_opts -s"
fi
pckts_rcvd=`$PING -c 8 -q -W 2 $NEXTHOP | grep transm | awk '{print $4}'`
echo "host: $NEXTHOP, pckts_rcvd: $pckts_rcvd" >$debug_out
if [ $pckts_rcvd -eq 0 ]
then
    echo "Connection with $NEXTHOP lost, resetting" | logger $logopts
    $OPEN_VPN_CMD > $debug_out
else
    echo "Connection with $NEXTHOP up, no action" | logger $logopts
fi