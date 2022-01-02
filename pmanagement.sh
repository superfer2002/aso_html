#!/bin/bash
echo Content-Type: text/html
echo

process=$(ps aux)

echo -e "<!DOCTYPE html PUBLIC\"-//W3C//DTD HTML 4.01 Strict//EN\"
        \"http://www.w3.org/TR/html4/strict.dtd\">
<html>
    <head>
        <title>The sound of sunshine</title>
    </head>
    <body>

        <h3><font face="Helvetica" size="20px" color="\#3B83BD">Process Management</font></h3>
		<h4><p style="color:black">$process</p></h4>

    </body>
</html>
"

