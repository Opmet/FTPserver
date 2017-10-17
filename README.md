# Ftp file server
A debian-based docker container for vsftpd server. In this small implementation guest users are able to download files from internet.

In a browser, the link will look something like this. ftp://ftpGuest:1234@192.168.1.54/foo.txt

## Install container

1. <b>Build dockerfile.</b><br />
   <span style="color:DodgerBlue;">
      sudo docker build -t legionem/vsftpd:latest .<br /><br />
   </span>

2. <b>Run container in detached mode on port 21.</b><br />
   <span style="color:DodgerBlue;">
      sudo docker run -d -p 21:21 --name vsftpd legionem/vsftpd:latest<br /><br />
   </span>

## Some tips for Administration

* <b>Copying files from host to running docker container.</b><br />
  <span style="color:DodgerBlue;">
     sudo docker cp foo.txt vsftpd:/home/ftpGuest/foo.txt<br /><br />
  </span>
   
* <b>Remove files in running docker container.</b><br />
  <span style="color:DodgerBlue;">
     sudo docker exec -it vsftpd rm /home/ftpGuest/foo.txt<br /><br />
  </span>
   
* <b>Create a bash session in the container.</b><br />
  <span style="color:DodgerBlue;">
     sudo docker exec -it vsftpd bash<br /><br />
  </span>
   
* <b>Step out from container bash session and restart.</b><br />
  <span style="color:DodgerBlue;">
     exit<br />
     sudo docker container restart vsftpd<br /><br />
  </span>
   
* <b>To read log file install nano and run.</b><br />
  <span style="color:DodgerBlue;">
     apt-get update<br />
     apt-get install nano<br />
     nano /var/log/vsftpd.log<br /><br />
  </span>
  
## Helpful links
* [help.ubuntu.com](https://help.ubuntu.com/community/vsftpd) - VSFTPD: Very Secure File Transfer Protocol Deamon.
* [security.appspot.com](https://security.appspot.com/vsftpd/vsftpd_conf.html) - Config file for vsftpd.
* [ubuntuforums.org](https://ubuntuforums.org/showthread.php?t=518293) - Easy FTP with vsftpd.
* [purplearrowblog.wordpress.com](https://purplearrowblog.wordpress.com/2016/03/11/how-to-setup-vsftp-and-user-accounts/) - How to setup vsFTP and user accounts?
* [github.com](https://github.com/Odiobill/docker.vsftpd) - Very light vsftpd installation based on Debian.