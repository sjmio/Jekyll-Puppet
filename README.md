Jekyll-Puppet
=============

Jekyll-Puppet automatically configures a git-push deployable Jekyll setup using puppet onto a server.


What Jekyll-Puppet does
-----------------------
* Creates deploy user
* Sets up git bare repository that you can git push to
* Install git Post-receive hook, so when you push it's automatically deployed. See: [Jekyll Deployment](https://github.com/mojombo/jekyll/wiki/Deployment)
* Configures webserver (nginx)


Install
-------
Only tested on Ubuntu so far. You'll need puppet and git to get started.

1. Update aptitude and install dependencies:
   `sudo aptitude update && sudo aptitude install puppet git rubygems`
2. Clone this git repo somewhere on your server
3. Run puppet agent to configure everything:
   `sudo puppet apply --modulepath=modules setup.pp`
4. Append your ssh public-key (id_rsa.pub) to the 'deploy' users ~/.ssh/authorized_keys. Note that `ssh-copy-id deploy@myserver.com` won't work since the deploy user is setup without a password.


Pushing Changes
---------------
Now you can clone anyones Jekyll repository (or create you own) and push it to your new server.

1. `git remote add deploy deploy@myserver.com:~/jekyll.git`
2. `git push deploy master`



Customization
-------------

Edit setup.pp if you want to make any customizations. (i.e.- not using nginx, adjust the www-root, deploy user, etc..)

