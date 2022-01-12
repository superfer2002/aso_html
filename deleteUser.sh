#!/bin/bash

ip4=$(/sbin/ip -o -4 addr list wlan0 | awk '{print $4}' | cut -d/ -f1)

echo Content-Type: text/html
echo

read user
user=${user::-1}
userOk=$(echo $user | awk -F= '{print $2}')
$(sudo deluser $userOk)

$(sudo rm -r /home/$userOk)

echo -e "<!DOCTYPE html PUBLIC\"-//W3C//DTD HTML 4.01 Strict//EN\"
		\"http://www.w3.org/TR/html4/strict.dtd\">
<html>
	<head>
		<title>The sound of sunshine</title>
		<meta http-equiv="refresh" content=\"2; url =
		http://$ip4/usermanagement.sh\" />
	</head>

	<body>

		<h4><p style="color:green">Delete successful, you'll be redirected in 2 seconds.</p></h4>

	</body>

</html>
"
