#!/bin/bash

echo Content-Type: text/html
echo

echo -e "<!DOCTYPE html PUBLIC\"-//W3C//DTD HTML 4.01 Strict//EN\"
        \"http://www.w3.org/TR/html4/strict.dtd\">
<html>
    <head>
        <title>The sound of sunshine</title>
    </head>
    <body>

        <h2><p style="color:blue">The sound of sunshine</p></h2>

        <form action=\"/login.sh\" method=\"post\" ENCTYPE=\"text/plain\">
          <label for=\"user\">Username:</label><br>
          <input type=\"text\" id=\"user\" name=\"user\"><br>
          <label for=\"password\">Password:</label><br>
          <input type=\"text\" id=\"password\" name=\"password\"><br><br>
          <input type=\"submit\" value=\"Submit\">
        </form>

    </body>
</html>
"
