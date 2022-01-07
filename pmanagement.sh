#!/bin/bash

echo Content-Type: text/html
echo

ps aux > tasks

lines=$(cat tasks | wc -l )

echo -e "<!DOCTYPE html PUBLIC\"-//W3C//DTD HTML 4.01 Strict//EN\"
        \"http://www.w3.org/TR/html4/strict.dtd\">

<html>
    <head>
        <title>The sound of sunshine</title>
		<link rel="icon" type="image/jpg" href="Pictures/16250633403413.jpg" />
    </head>

    <body>

        <h3><font face="Helvetica" size="10px" color="\#3B83BD">Process Management</font></h3>
		<form action=\"/menu.sh\" method=\"post\" ENCTYPE=\"text/plain\">
		  <input type=\"submit\" value=\"Main Menu\">
		</form>
		<br>
		<br>
		<form action=\"/kill.sh\" method=\"get\" ENCTYPE=\"text/plain\">
          <label for=\"user\">Enter process PID:</label><br>
          <input type=\"text\" id=\"task\" name=\"task\"><br>
          <input type=\"submit\" value=\"KILL\">
        </form>
		"
		i=0
		while [ $i -le $lines ]
		do
			echo -e "$(sed -n "$i"p tasks)"
			echo -e "<br>"
			i=$(( $i + 1 ))
		done
		echo -e "<br>"
		echo -e "
    </body>
</html>
"
