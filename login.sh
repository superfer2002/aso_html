#!/bin/bash
echo Content-Type: text/html
echo

read user
read password

if [[ $user = *"pi"* ]] && [[ $password = *"raspberry"* ]]; then
    echo -e "<!DOCTYPE html PUBLIC\"-//W3C//DTD HTML 4.01 Strict//EN\"
            \"http://www.w3.org/TR/html4/strict.dtd\">

    <html>
        <body>
            <head>
                <title>The sound of sunshine</title>
            </head>

            <h3><font face="Helvetica" size="20px" color="\#FF7A59">Login</font></h3>
            <h4><p style="color:green">L'usuari es: $user</p></h4>
            <h4><p style="color:green">La contrasenya es upps: $password</p></h4>


            </body>
    </html>
    "
else
    echo -e "<!DOCTYPE html PUBLIC\"-//W3C//DTD HTML 4.01 Strict//EN\"
            \"http://www.w3.org/TR/html4/strict.dtd\">

    <html>
        <body>

            <head>
                <title>The sound of sunshine</title>
            </head>

            <h3><font face="Helvetica" size="20px" color="\#FF7A59">Login</font></h3>
            <h4><p style="color:red">Les dades entrades son incorrectes!</p></h4>
			<button onclick=\"myFunction()\">Try again</button>

			<script>
			function myFunction() {
			  location.replace(\"http://raspberrypi/main.sh\")
			}
			</script>

        </body>
    </html>
    "
fi
