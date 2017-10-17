# debian-based container for vsftpd
# VERSION               0.1
FROM debian:latest
MAINTAINER Joakim Andersson  "joakim@ktv-sjobo.se"

RUN apt-get update && apt-get install -y --no-install-recommends vsftpd
RUN apt-get clean

# User settings for ftpGuest
RUN echo "/usr/sbin/nologin" >> /etc/shells
RUN useradd --create-home --shell /usr/sbin/nologin ftpGuest
RUN echo 'ftpGuest:1234' | chpasswd
RUN chmod 555 /home/ftpGuest

# Changes to vsftpd's configurations file
RUN echo "chroot_local_user=YES" >> /etc/vsftpd.conf
RUN echo "hide_ids=YES" >> /etc/vsftpd.conf

RUN mkdir -p /var/run/vsftpd/empty

VOLUME /etc

EXPOSE 21

CMD /usr/sbin/vsftpd