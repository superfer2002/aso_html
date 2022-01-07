#!/bin/bash

echo Content-Type: text/html
echo

sudo cat /var/log/apache2/access.log | head -n 40 > list_log
lines_log=$(sudo cat list_log | wc -l)

echo -e "<!DOCTYPE html PUBLIC\"-//W3C//DTD HTML 4.01 Strict//EN\"
        \"http://www.w3.org/TR/html4/strict.dtd\">

<html>
    <head>
        <title>The sound of sunshine</title>
		<link rel="icon" type="image/jpg" href="Pictures/16250633403413.jpg" />
    </head>

    <body>

        <h3><font face="Helvetica" size="10px" color="\#3B83BD">Log Management</font></h3>
        <h3><font face="Helvetica" size="5px" color="\#FFA420">20 Last Logs</font></h3>
		<form action=\"/menu.sh\" method=\"post\" ENCTYPE=\"text/plain\">
          <input type=\"submit\" value=\"Main Menu\">
        </form>"

		i=0
		while [ $i -le $lines_log ]
		do
			echo -e "$(sed -n "$i"p list_log)"
			echo -e "<br>"
			i=$(( $i + 1 ))
		done
		echo -e "

    </body>
</html>
"

