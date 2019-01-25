sudo -s
cat $SPLUNK_HOME/etc/splunk.version &> /dev/null
if [ $? -eq 0 ]; then
    echo "Package  is installed!"
else
    echo "Package  is NOT installed!"
	sudo apt-get -y update
	sleep 10
	sudo wget https://download.splunk.com/products/splunk/releases/7.2.3/linux/splunk-7.2.3-06d57c595b80-Linux-x86_64.tgz
	sleep 10
	sudo tar xvzf splunk-7.2.3-06d57c595b80-Linux-x86_64.tgz -C /opt
	sleep 10
	sudo -s
	echo SPLUNK_HOME=\"/opt/splunk\" >> /etc/environment
	source /etc/environment
	cd /opt/splunk/bin
	./splunk start  --accept-license --answer-yes --seed-passwd srinivas
	sudo ufw allow 8000
fi

