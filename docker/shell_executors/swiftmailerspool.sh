#!/bin/sh
swiftmailerSpoolSend() {
	if [ "$APP_ENV" != 'prod' ]; then
		cd /srv/api && php bin/console swiftmailer:spool:send --message-limit=10 --time-limit=10 --env=dev  > /dev/null 2>>var/log/mail_error.log
		sleep 5
	else
		cd /srv/api && php bin/console swiftmailer:spool:send --message-limit=10 --time-limit=10 --env=prod  > /dev/null 2>>var/log/mail_error.log
		sleep 5
	fi
}
swiftmailerSpoolSend