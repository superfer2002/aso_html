#!/bin/bash

ip4=$(/sbin/ip -o -4 addr list wlan0 | awk '{print $4}' | cut -d/ -f1)

echo Content-Type: text/html
echo

echo -e "<!DOCTYPE html PUBLIC\"-//W3C//DTD HTML 4.01 Strict//EN\"
        \"http://www.w3.org/TR/html4/strict.dtd\">

<html>
        <head>
            <title>The sound of sunshine</title>
			<link rel="icon" type="image/jpg" href="Pictures/16250633403413.jpg" />
			<meta http-equiv="refresh" content=\"2; url =
            http://$ip4/reboot.sh\" />
        </head>

        <body>

            <h3><font face="Helvetica" size="10px" color="\#3B83BD">Restart</font></h3>
    		<h4><p style="color:red">The server will restart in 2 seconds. NEVERZURRENDER</p></h4>

        </body>
</html>
"
