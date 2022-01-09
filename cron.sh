#!/bin/bash

echo Content-Type: text/html
echo
$(sudo chmod 777 /etc/crontab)
$(cat /etc/crontab > cronjobs)
$(sudo chmod 600 /etc/crontab)
$(sudo service cron restart)
lines=$(cat cronjobs | wc -l )

echo -e "<!DOCTYPE html PUBLIC\"-//W3C//DTD HTML 4.01 Strict//EN\"
        \"http://www.w3.org/TR/html4/strict.dtd\">

    <html>
        <head>
            <title>The sound of sunshine</title>
    		<link rel="icon" type="image/jpg" href="Pictures/16250633403413.jpg" />

        </head>

        <body>
            <h3><font face="Helvetica" size="10px" color="\#3B83BD">Pre-programmed tasks Management</font></h3>

			<p><b><font face="Helvetica" size"9px">These are your current Pre-programmed tasks:</font></b></p>
			"

            i=18
    		while [ $i -le $lines ]
    		do
    			echo -e "$(sed -n "$i"p cronjobs)"
    			echo -e "<br>"
    			i=$(( $i + 1 ))
    		done

			echo -e "
			<br>
			<p><b><font face="Helvetica" size "9px">Form to create a new job:</font></b></p>
			<form action=\"/cronGenerator.sh\" method=\"get\" ENCTYPE=\"text/plain\">
				<label for="minute">Minute (-1 if *):</label><br>
				<input type="number" id="minute" name="minute" min="-1" max="59"><br>

                <label for="hour">Hour (-1 if *):</label><br>
				<input type="number" id="hour" name="hour" min="-1" max="59"><br>

                <label for="day">Day (-1 if *):</label><br>
				<input type="number" id="day" name="day" min="-1" max="31"><br>

                <label for="month">Month (-1 if *):</label><br>
				<input type="number" id="month" name="month" min="-1" max="12"><br>

                <label for="week">Week range (1:monday - 2:tuesday (...) 0 and 7:sunday - * everyday):</label><br>
				<input type="text" id="week" name="week"><br>

                <label for="user">User responsible to execute the cronjobs:</label><br>
				<input type="text" id="user" name="user"><br>

                <label for="command">Command to execute: </label><br>
				<input type="text" id="command" name="command"><br><br>

				<input type=\"submit\" value=\"Create\">
	        </form>

			<br>

			<p><b><font face="Helvetica" size "9px">Form to erase an active job:</font></b></p>

			<form action=\"/cronDeletator.sh\" method=\"get\" ENCTYPE=\"text/plain\">
				<label for="user">Number of the line of the cron command:</label>
				<input type="text" id="delete" name="delete"><br>
	            <input type="submit" value="Erase">
			</form>

			<form action=\"/menu.sh\" method=\"post\" ENCTYPE=\"text/plain\">
		        <input type=\"submit\" value=\"Main Menu\">
			</form>

        </body>
    </html>
    "

