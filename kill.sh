#!/bin/bash

echo Content-Type: text/html
echo
dades=$(echo $QUERY_STRING)
v=$(echo $dades | awk -F= '{print $2}')

#$(sudo kill -9 $v)

echo -e "<!DOCTYPE html PUBLIC\"-//W3C//DTD HTML 4.01 Strict//EN\"
        \"http://www.w3.org/TR/html4/strict.dtd\">

<html>
    <head>
        <title>The sound of sunshine</title>
    </head>

    <body>

        <h3><font face="Helvetica" size="10px" color="\#3B83BD">Process Management</font></h3>
		<h3>El proces amb PID $v s'ha aturat.</h3>
		<form action=\"/pmanagement.sh\" method=\"post\" ENCTYPE=\"text/plain\">
          <input type=\"submit\" value=\"Process Management\">
		</form>
		<form action=\"/menu.sh\" method=\"post\" ENCTYPE=\"text/plain\">
          <input type=\"submit\" value=\"Main Menu\">
        </form>
    </body>
</html>
"
