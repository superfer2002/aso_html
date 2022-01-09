#!/bin/bash
dades=$(echo $QUERY_STRING)

ip4=$(/sbin/ip -o -4 addr list wlan0 | awk '{print $4}' | cut -d/ -f1)


type=$(echo $dades | awk -F= '{print $2}')
line=$(echo $dades | awk -F= '{print $3}')
echo Content-Type: text/html
echo
type=${type::-5}
echo type: $type
echo line: $line
echo -e "<!DOCTYPE html PUBLIC\"-//W3C//DTD HTML 4.01 Strict//EN\"
        \"http://www.w3.org/TR/html4/strict.dtd\">

        <head>
            <title>The sound of sunshine</title>
            <link rel="icon" type="image/jpg" href="Pictures/16250633403413.jpg" />
            <meta http-equiv="refresh" content=\"3; url =
            http://$ip4/pfilter.sh\" />
        </head>

        <body>

        <h4><p style="color:green">Iptable rule removed correctly! Redirecting in 3 seconds.</p></h4>

        </body>
    </html>
    "

$(sudo iptables -D $type $line)

