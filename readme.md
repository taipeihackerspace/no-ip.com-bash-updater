README
======

Bash script to update the ip of an account on no-ip.com

How to use
----------

* Configure the script with the correct username, password, hostname, based on the .credentials.example file
* Make sure the script is executable (`chmod +x noipupdater.sh`)
* Run the script (`./noipupdater.sh`)

Tips!
-----

Place this in your cron file:

    */15 * * * * /dir/where/file/is/noipupdater.sh

This will run the script every fifteen minutes.

Note: Some users have had problem executing the cron. If that is your case, remove the `.sh` extension.

Happy updating!
