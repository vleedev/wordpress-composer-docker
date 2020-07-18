#!/bin/sh
messengerConsume() {
	if [ "$APP_ENV" != 'prod' ]; then
		cd /srv/api && php bin/console messenger:stop-workers && php bin/console messenger:consume put_images_to_microsatdb_async -vv --time-limit=3600
	else
		cd /srv/api && php bin/console messenger:stop-workers && php bin/console messenger:consume put_images_to_microsatdb_async --time-limit=3600
	fi
}
messengerConsume