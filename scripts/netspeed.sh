#!bash
IFACE=$(ip route get 8.8.8.8 2>/dev/null | awk '{print $5; exit}')
[ -z "$IFACE" ] && echo "N/A" && exit

RX1=$(cat /proc/net/dev | awk -v iface="$IFACE:" '$1==iface {print $2}')
TX1=$(cat /proc/net/dev | awk -v iface="$IFACE:" '$1==iface {print $10}')
sleep 1
RX2=$(cat /proc/net/dev | awk -v iface="$IFACE:" '$1==iface {print $2}')
TX2=$(cat /proc/net/dev | awk -v iface="$IFACE:" '$1==iface {print $10}')

RX=$(( (RX2 - RX1) / 1024 ))
TX=$(( (TX2 - TX1) / 1024 ))
echo "NET: ${RX}KB/s ↓ - ${TX}KB/s ↑"
