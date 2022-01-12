#!/bin/bash

ip4=$(/sbin/ip -o -4 addr list wlan0 | awk '{print $4}' | cut -d/ -f1)

echo Content-Type: text/html
echo

read user
read password

user=${user::-1}
userOk=$(echo "$user" | cut -c 6-)
password=${password::-1}
passwordOk=$(echo "$password" | cut -c 10-)

if [[ $userOk = "pi" ]] && [[ $passwordOk = *"raspb"* ]]; then

	echo -e "<!DOCTYPE html PUBLIC\"-//W3C//DTD HTML 4.01 Strict//EN\"
            \"http://www.w3.org/TR/html4/strict.dtd\">
    <html>
        <head>
            <title>The sound of sunshine</title>
            <meta http-equiv="refresh" content=\"2; url =
            http://$ip4/menu.sh\" />
        </head>
            <body>

                <h4><p style="color:green">Login successful, you'll be redirected to the menu in 2 seconds.</p></h4>

            </body>

    </html>
    "
else
    echo -e "<!DOCTYPE html PUBLIC\"-//W3C//DTD HTML 4.01 Strict//EN\"
            \"http://www.w3.org/TR/html4/strict.dtd\">

    <html>
        <head>
            <title>The sound of sunshine</title>
        </head>

        <body>
            <h3><font face="Helvetica" size="10px" color="\#FF7A59">Login</font></h3>
            <h4><p style="color:red">Les dades entrades son incorrectes!</p></h4>
			<form action=\"/main.sh\" method=\"post\" ENCTYPE=\"text/plain\">
	          <input type=\"submit\" value=\"Try again\">
			</form>

        </body>
    </html>
    "
fi
