#!/bin/bash

echo Content-Type: text/html
echo

$(sudo iptables -L --line-numbers > tables)
lines=$(cat tables | wc -l )

echo -e "<!DOCTYPE html PUBLIC\"-//W3C//DTD HTML 4.01 Strict//EN\"
        \"http://www.w3.org/TR/html4/strict.dtd\">

    <html>
        <head>
            <title>The sound of sunshine</title>
    		<link rel="icon" type="image/jpg" href="Pictures/16250633403413.jpg" />

        </head>

        <body>
            <h3><font face="Helvetica" size="10px" color="\#3B83BD">Packet Filtering</font></h3>

			<p><b><font face="Helvetica" size"9px">These are your current iptables:</font></b></p>
			"

            i=0
    		while [ $i -le $lines ]
    		do
    			echo -e "$(sed -n "$i"p tables)"
    			echo -e "<br>"
    			i=$(( $i + 1 ))
    		done

			echo -e "
			<br>
			<p><b><font face="Helvetica" size "9px">Form to create a new iptable input:</font></b></p>
			<form action=\"/execpfilter.sh\" method=\"get\" ENCTYPE=\"text/plain\">

    			<label for="direction">Choose direction:</label>
    			<select id="direction" name="direction">
    			  <option value="OUTPUT">OUTPUT</option>
    			  <option value="INPUT">INPUT</option>
				  <option value="FORWARD">FORWARD</option>
    			</select>
                <br>
                <br>
				<label for=\"ip\">Enter ip address:</label>
	            <input type=\"text\" id=\"ip\" name=\"ip\"><br>
				<br>
                <label for=\"protocol\">Choose protocol:</label>
    			<select id=\"protocol\" name=\"protocol\">
    			  <option value=\"udp\">UDP</option>
    			  <option value=\"tcp\">TCP</option>
    			</select>
				<br>
				<br>
				<b><font face="Helvetica" size="2px" color="\#CB3234">PORT RANGE SYNTAX: (port):(port) OR (port)</font></b><br>
				<label for=\"port\">Enter port range:</label>
				<input type=\"text\" id=\"port\" name=\"port\"><br>
				<input type="radio" id="unico" name="portrange" value="unico">
				<label for="unico">Port range of 1</label><br>
				<input type="radio" id="rango" name="portrange" value="rango">
				<label for="rango">Port range of more than 1</label><br><br>

                <label for="direction">Accept or deny:</label>
                <select id="rule" name="rule">
                  <option value="ACCEPT">ACCEPT</option>
                  <option value="DROP">DENY</option><br>
                </select>
                <br>
                <br>
				<input type="hidden" id="custId" name="custId" value="1">
				<input type=\"submit\" value=\"Create\">
	        </form>
			<br>
			<p><b><font face="Helvetica" size "9px">Form to erase an iptable:</font></b></p>
			<form action=\"/erasepfilter.sh\" method=\"get\" ENCTYPE=\"text/plain\">
				<label for="direction">Choose direction:</label>
				<select id="direction" name="direction">
				  <option value="OUTPUT">OUTPUT</option>
				  <option value="INPUT">INPUT</option>
				  <option value="FORWARD">FORWARD</option>
				</select>
				<br>
				<label for="quantity">Iptable rule number:</label>
  				<input type="number" id="line" name="line" min="0"><br><br>
  				<input type="submit" value="Erase">
			</form>
			<form action=\"/menu.sh\" method=\"post\" ENCTYPE=\"text/plain\">
			  <input type=\"submit\" value=\"Main Menu\">
			</form>
        </body>
    </html>
    "
