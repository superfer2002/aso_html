#!/bin/bash
echo Content-Type: text/html
echo

echo -e "<!DOCTYPE html PUBLIC\"-//W3C//DTD HTML 4.01 Strict//EN\"
        \"http://www.w3.org/TR/html4/strict.dtd\">

<html>
    <body>
        <head>
            <title>The sound of sunshine</title>
        </head>

        <h3><font face="Helvetica" size="20px" color="\#FF7A59">Login</font></h3>
        <h4><p style="color:green">L'usuari es: $userOk</p></h4>
        <h4><p style="color:green">La contrasenya es: $passwordOk</p></h4>
        <button onclick=\"processFunction()\">Process Management</button>

        <script>
        function processFunction() {
            location.replace(\"http://raspberrypi/pmanagement.sh\")
        }
        </script>
        </body>
</html>
"
