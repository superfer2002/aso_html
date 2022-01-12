#!/bin/bash

echo Content-Type: text/html
echo

last | head -n 10 > list_last
lines_last=$(cat list_last | wc -l)

top -b -n 1 | head -n 5 > top_list
lines_top=$(cat top_list | wc -l)

echo -e "<!DOCTYPE html PUBLIC\"-//W3C//DTD HTML 4.01 Strict//EN\"
        \"http://www.w3.org/TR/html4/strict.dtd\">

<html>
    <head>
        <title>The sound of sunshine</title>
		<link rel="icon" type="image/jpg" href="Pictures/16250633403413.jpg" />
    </head>

    <body>

        <h3><font face="Helvetica" size="10px" color="\#3B83BD">Monitoring</font></h3>
        <h3><font face="Helvetica" size="5px" color="\#FFA420">10 Last Connections</font></h3>
		<form action=\"/menu.sh\" method=\"post\" ENCTYPE=\"text/plain\">
          <input type=\"submit\" value=\"Main Menu\">
        </form>"
		i=0
		while [ $i -le $lines_last ]
		do
			echo -e "$(sed -n "$i"p list_last)"
			echo -e "<br>"
			i=$(( $i + 1 ))
		done
		echo -e "<br>"
		echo -e "<h3><font face="Helvetica" size="5px" color="\#FFA420">Status Information</font></h3>
		<form action=\"/monitor.sh\" method=\"post\" ENCTYPE=\"text/plain\">
          <input type=\"submit\" value=\"Refresh\">
        </form>"
        i=0
		while [ $i -le $lines_top ]
		do
			echo -e "$(sed -n "$i"p top_list)"
			echo -e "<br>"
			i=$(( $i + 1 ))
		done
        echo -e "<br>"
		echo -e "

    </body>
</html>
"
