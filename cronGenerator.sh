#!/bin/bash
dades=$(echo $QUERY_STRING)

ip4=$(/sbin/ip -o -4 addr list wlan0 | awk '{print $4}' | cut -d/ -f1)

minute=$(echo $dades | awk -F= '{print $2}')
hour=$(echo $dades | awk -F= '{print $3}')
day=$(echo $dades | awk -F= '{print $4}')
month=$(echo $dades | awk -F= '{print $5}')
week=$(echo $dades | awk -F= '{print $6}')
user=$(echo $dades | awk -F= '{print $7}')
command=$(echo $dades | awk -F= '{print $8}')

echo Content-Type: text/html
echo

minute=${minute::-5}
hour=${hour::-4}
day=${day::-6}
month=${month::-5}
week=${week::-5}
user=${user::-8}

echo minute: $minute
echo hour: $hour
echo day: $day
echo month: $month
echo week: $week
echo user: $user

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
            <meta http-equiv="refresh" content=\"6; url =
            http://$ip4/cron.sh\" />
        </head>

        <body>

        <h4><p style="color:green">Job scheaduled correctly! Redirecting in 3 seconds.</p></h4>

        </body>
    </html>
    "

$(sudo chmod 777 /etc/crontab)
$(sudo echo $minute $hour $day $month $week $user $command >> /etc/crontab)
$(sudo chmod 600 /etc/crontab)
$(sudo service cron restart)
