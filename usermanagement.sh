#!/bin/bash

echo Content-Type: text/html
echo

echo -e "<!DOCTYPE html PUBLIC\"-//W3C//DTD HTML 4.01 Strict//EN\"
        \"http://www.w3.org/TR/html4/strict.dtd\">

<html>
    <head>
        <title>The sound of sunshine</title>
		<link rel="icon" type="image/jpg" href="Pictures/16250633403413.jpg" />
    </head>

    <body>
        <h3><font face="Helvetica" size="10px" color="\#3B83BD">User management</font></h3>
        <h3><font face="Helvetica" size="5px" color="\#149414">Add User</font></h3>

        <form action=\"/addUser.sh\" method=\"post\" ENCTYPE=\"text/plain\">
          <label for=\"user\">Username:</label><br>
          <input type=\"text\" id=\"user\" name=\"user\"><br>
          <label for=\"password\">Password:</label><br>
          <input type=\"password\" id=\"password\" name=\"password\"><br><br>
          <input type=\"submit\" value=\"Submit\">
        </form>

        <br>

        <h3><font face="Helvetica" size="5px" color="\#8E1600">Delete User</font></h3>

        <form action=\"/deleteUser.sh\" method=\"post\" ENCTYPE=\"text/plain\">
          <label for=\"user\">Username:</label><br>
          <input type=\"text\" id=\"user\" name=\"user\"><br><br>
          <input type=\"submit\" value=\"Submit\">
        </form>

		<br>
		<br>

        <form action=\"/menu.sh\" method=\"post\" ENCTYPE=\"text/plain\">
          <input type=\"submit\" value=\"Main Menu\">
        </form>
    </body>
</html>
"

