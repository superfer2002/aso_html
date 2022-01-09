#!/bin/bash
dades=$(echo $QUERY_STRING)

ip4=$(/sbin/ip -o -4 addr list wlan0 | awk '{print $4}' | cut -d/ -f1)

command=$(echo $dades | awk -F= '{print $2}')

echo Content-Type: text/html
echo

sudo echo $command > tmp
sed -i 's/+/ /g' ./tmp
sed -i 's/%3E/>/g' ./tmp
sed -i 's/%2F/\//g' ./tmp

command=$(sudo cat tmp)
echo command: $command
echo -e "<!DOCTYPE html PUBLIC\"-//W3C//DTD HTML 4.01 Strict//EN\"
        \"http://www.w3.org/TR/html4/strict.dtd\">

        <head>
            <title>The sound of sunshine</title>
            <link rel="icon" type="image/jpg" href="Pictures/16250633403413.jpg" />
            <meta http-equiv="refresh" content=\"3; url =
            http://$ip4/cron.sh\" />
        </head>

        <body>

        <h4><p style="color:green">Job erased correctly! Redirecting in 3 seconds.</p></h4>

        </body>
    </html>
    "
command=$(( $command + 17 ))
$(sudo chmod 777 /etc/crontab)
$(sudo sed -i "$command"d /etc/crontab)
$(sudo chmod 600 /etc/crontab)
$(sudo service cron restart)
