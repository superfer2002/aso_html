#!/bin/bash
echo Content-Type: text/html
echo

read user
read password

user=${user::-1}
userOk=$(echo "$user" | cut -c 6-)
password=${password::-1}
passwordOk=$(echo "$password" | cut -c 10-)

if [[ $userOk = "pi" ]] && [[ $passwordOk = "raspberry" ]]; then


	echo -e "<!DOCTYPE html PUBLIC\"-//W3C//DTD HTML 4.01 Strict//EN\"
            \"http://www.w3.org/TR/html4/strict.dtd\">
			<html>

			<head>
			    <title>HTML Redirect</title>
			    <meta http-equiv="refresh" content=\"5; url =
			    http://raspberrypi/menu.sh\" />
			</head>

			<body>

                <h4><p style="color:green">Login sucessful, you'll be redirected to the menu in 5 seconds.</p></h4>

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

            <h3><font face="Helvetica" size="10px" color="\#FF7A59">Login</font></h3>
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

