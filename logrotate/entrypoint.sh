#!/usr/bin/env sh

echo "
${LOG_DIRECTORIES}{
${LOGROTATE_COPIES}
${LOGROTATE_MODE}
}
 " > /etc/logrotate.conf

echo "
${LOGROTATE_CRONSCHEDULE}	/usr/sbin/logrotate ${LOGROTATE_PARAMETERS} /etc/logrotate.conf
" > /etc/crontabs/root
echo "starting..."

crond -f


