#! /bin/bash
#chmod 755 start.sh
# fuc: source /etc/profile.d/rvm.sh && start app
# author: zhouwei
# date:2016-06-30

log_file=${PWD}/app.log
main(){
    source /etc/profile.d/rvm.sh
    rvm use ruby 2.5.3 --default
    # /etc/init.d/crond start 
    # rm -rf /var/run/syslogd.pid&&/etc/init.d/rsyslog start
    retval=$?
    if [ $retval -eq 0 ];
    then
	cd /home&&gem install mysql2 -v '0.5.2'&&bundle install&&RAILS_ENV=production bundle exec rake db:migrate&&bundle exec whenever --update-crontab -s environment=production&&puma -e production  
    else
	echo 'error'
    fi
}
main