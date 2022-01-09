#!/bin/bash

echo Content-Type: text/html
echo

echo -e "<!DOCTYPE html PUBLIC\"-//W3C//DTD HTML 4.01 Strict//EN\"
        \"http://www.w3.org/TR/html4/strict.dtd\">

        <head>
            <title>The sound of sunshine</title>
            <link rel="icon" type="image/jpg" href="Pictures/16250633403413.jpg" />
            <meta http-equiv="refresh" content=\"3; url =
            http://$ip4/cron.sh\" />
        </head>

        <body>

            <h3><font face="Helvetica" size="10px" color="\#3B83BD">Music</font></h3>

            <form action=\"/menu.sh\" method=\"post\" ENCTYPE=\"text/plain\">
            	<input type=\"submit\" value=\"Main Menu\">
            </form>

		</body>
	</html>
	"

