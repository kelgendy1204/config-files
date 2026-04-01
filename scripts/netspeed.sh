#!/bin/bash
if [[ "$(uname)" == "Darwin" ]]; then
    IFACE=$(route get 8.8.8.8 2>/dev/null | awk '/interface:/ {print $2}')
    [ -z "$IFACE" ] && echo "N/A" && exit

    RX1=$(netstat -ib | awk -v iface="$IFACE" '$1==iface && $3~/\./ {print $7; exit}')
    TX1=$(netstat -ib | awk -v iface="$IFACE" '$1==iface && $3~/\./ {print $10; exit}')
    sleep 1
    RX2=$(netstat -ib | awk -v iface="$IFACE" '$1==iface && $3~/\./ {print $7; exit}')
    TX2=$(netstat -ib | awk -v iface="$IFACE" '$1==iface && $3~/\./ {print $10; exit}')
else
    IFACE=$(ip route get 8.8.8.8 2>/dev/null | awk '{print $5; exit}')
    [ -z "$IFACE" ] && echo "N/A" && exit

    RX1=$(awk -v iface="$IFACE:" '$1==iface {print $2}' /proc/net/dev)
    TX1=$(awk -v iface="$IFACE:" '$1==iface {print $10}' /proc/net/dev)
    sleep 1
    RX2=$(awk -v iface="$IFACE:" '$1==iface {print $2}' /proc/net/dev)
    TX2=$(awk -v iface="$IFACE:" '$1==iface {print $10}' /proc/net/dev)
fi

RX=$(( (RX2 - RX1) / 1024 ))
TX=$(( (TX2 - TX1) / 1024 ))
echo "NET: ${RX}KB/s ↓ - ${TX}KB/s ↑"
