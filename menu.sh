#!/bin/bash

echo Content-Type: text/html
echo

echo -e "<!DOCTYPE html PUBLIC\"-//W3C//DTD HTML 4.01 Strict//EN\"
        \"http://www.w3.org/TR/html4/strict.dtd\">

<html>
    <head>
        <title>The sound of sunshine</title>
		<style>
		ul {
		  list-style-type: none;
		  margin: 0;
		  padding: 0;
		  overflow: hidden;
		  background-color: #0099CC;
		}

		li {
		  float: left;
		}

		li a {
		  display: block;
		  color: white;
		  text-align: center;
		  padding: 14px 16px;
		  text-decoration: none;
		}

		li a:hover {
		  background-color: #111;
		}
		</style>
    </head>

    <body>
        <h3><font face="Helvetica" size="15px" color="\#FF7A59">The sound of sunshine's Menu</font></h3>

		<ul>
		  <li><a href=\"pmanagement.sh\">Process Management</a></li>
		  <li><a href=\"monitor.sh\">Monitoring</a></li>
		  <li><a href=\"turnoff.sh\">Turn Off</a></li>
		  <li><a href=\"restart.sh\">Restart</a></li>
          <li><a href=\"logmanagement.sh\">Logs Management</a></li>
		  <li><a href=\"usermanagement.sh\">Users Management</a></li>
		  <li><a href=\"pfilter.sh\">Packet Filtering</a></li>
		  <li><a href=\"cron.sh\">Pre-programmed tasks Management</a></li>
          <li><a href=\"music.sh\">Musical Functionalities</a></li>
		</ul>

		<br>

    </body>
</html>
"
