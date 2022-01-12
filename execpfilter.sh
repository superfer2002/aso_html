#!/bin/bash
dades=$(echo $QUERY_STRING)

ip4=$(/sbin/ip -o -4 addr list wlan0 | awk '{print $4}' | cut -d/ -f1)

direction=$(echo $dades | awk -F= '{print $2}')
ip=$(echo $dades | awk -F= '{print $3}')
protocol=$(echo $dades | awk -F= '{print $4}')
port=$(echo $dades | awk -F= '{print $5}')
rango=$(echo $dades | awk -F= '{print $6}')
rule=$(echo $dades | awk -F= '{print $7}')
accion=$(echo $dades | awk -F= '{print $8}')


echo Content-Type: text/html
echo

direction=${direction::-3}
ip=${ip::-9}
protocol=${protocol::-5}
port=${port::-10}
rango=${rango::-5}
rule=${rule::-7}

echo -e "<!DOCTYPE html PUBLIC\"-//W3C//DTD HTML 4.01 Strict//EN\"
        \"http://www.w3.org/TR/html4/strict.dtd\">

        <head>
            <title>The sound of sunshine</title>
            <link rel="icon" type="image/jpg" href="Pictures/16250633403413.jpg" />
            <meta http-equiv="refresh" content=\"3; url =
            http://$ip4/pfilter.sh\" />
        </head>

        <body>

        <h4><p style="color:green">Iptable rule created correctly! Redirecting in 3 seconds.</p></h4>

        </body>
    </html>
    "

if [ $rango == "unico" ]; then
	$(sudo iptables -A $direction -s $ip -p $protocol --dport $port -j $rule)
else
	$(sudo iptables -A $direction -s $ip -p $protocol -dport $port -j $rule)
fi
