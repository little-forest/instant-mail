FROM        alpine:3.7
MAINTAINER  Yusuke KOMORI

# install packages
RUN         apk add --no-cache --update sed postfix dovecot rsyslog supervisor tzdata gettext && \
              (rm "/tmp/"* 2>/dev/null || true) && (rm -rf /var/cache/apk/* 2>/dev/null || true)

ADD         script/init /init
ADD         supervisord/supervisord.conf /etc/supervisord.conf
ADD         postfix/main.cf.template /etc/postfix/main.cf
ADD         dovecot/99-virtual-mailbox.conf /etc/dovecot/conf.d/99-virtual-mailbox.conf

RUN         addgroup -g 5000 vmail && \
              mkdir /var/mail && chown -R vmail.vmail /var/mail && chmod 770 /var/mail

#  25 SMTP
# 110 POP3
# 143 IMAP
EXPOSE      25 110 143

ENTRYPOINT  /init && /usr/bin/supervisord -c /etc/supervisord.conf
