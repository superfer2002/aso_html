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
    </head>

    <body>
        <h3><font face="Helvetica" size="10px" color="\#FF7A59">The sound of sunshine's Menu</font></h3>

        <button onclick=\"processFunction()\">Process Management</button>
        <button onclick=\"monitoringFunction()\">Monitoring</button>
        <button onclick=\"offFunction()\">Turn Off</button>
        <button onclick=\"restartFunction()\">Restart</button>
        <button onclick=\"logsFunction()\">Logs Management</button>
        <button onclick=\"usersFunction()\">Users Management</button>
        <button onclick=\"packetFunction()\">Packet Filtering</button>
        <button onclick=\"tasksFunction()\">Pre-programmed tasks Management</button>
        <button onclick=\"musicalFunction()\">Musical Functionalities</button>

        <script>
        function offFunction() {
            location.replace(\"http://$ip4/turnoff.sh\")
        }
        function processFunction() {
            location.replace(\"http://$ip4/pmanagement.sh\")
        }
		function restartFunction() {
			location.replace(\"http://$ip4/restart.sh\")
		}
        </script>
    </body>
</html>
"

