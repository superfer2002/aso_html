#!/bin/bash

ip4=$(/sbin/ip -o -4 addr list wlan0 | awk '{print $4}' | cut -d/ -f1)

echo Content-Type: text/html
echo

echo -e "<!DOCTYPE html PUBLIC\"-//W3C//DTD HTML 4.01 Strict//EN\"
        \"http://www.w3.org/TR/html4/strict.dtd\">
<html>
    <head>
        <title>The sound of sunshine</title>
		<link rel="icon" type="image/jpg" href="Pictures/IlloJuan_1469863014_684199_1440x810.jpg" />
    </head>

    <body>

        <h1><p style="color:blue">The sound of sunshine</h1>
		<img src="Pictures/3.png">
		<img src="Pictures/1.png">
		<img src="Pictures/2.png">
        </p>

        <form action=\"/login.sh\" method=\"post\" ENCTYPE=\"text/plain\">
          <label for=\"user\">Username:</label><br>
          <input type=\"text\" id=\"user\" name=\"user\"><br>
          <label for=\"password\">Password:</label><br>
          <input type=\"password\" id=\"password\" name=\"password\"><br><br>
          <input type=\"submit\" value=\"Submit\">
        </form>

    </body>
</html>
"
