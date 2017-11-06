# devops

This folder is for provisioning processes.

# Virtual Machine

You will need last version of [Vagrant](https://www.vagrantup.com/) and [Oracle VM VirtualBox](https://www.virtualbox.org) with **VirtualBox Extension Pack**, this is because Vagrant runs on a particular version of VirtualBox (for each release).

## Deploy

Use command line console (to check the screen if any error), go to **devops** folder and execute the file "**deployVM.bat**"
(Note: **If the console hangs, try to press 'Enter'**. It's best not to stop the process, because it consumes time)

When finish, you will need to wait 1 or 2 minutes for a system restart (you will notice, because you will see the graphical environment)

You will use:


Login: **vagrant**

Password: **vagrant**

For root access you can use "**sudo <command>**" with same password or use "**sudo su -**" to have sharp(#) console.

**Couchbase** is available in your browser (outside of virtual machine, if you want).
The link is http://172.31.32.253:8091

You may adapt the file **/home/vagrant/ccugitclone.sh** to your needs.

## Notes

All the installation is described inside the "**Vagrantfile**"  
