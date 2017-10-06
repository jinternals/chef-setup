#!/bin/bash
apt-get update
apt-get -y install curl

# install Chef server
if [ ! $(which chef-server-ctl) ]; then

	echo "Installing Chef server..."
	dpkg -i /package/chef-server-core_12.16.14-1_amd64.deb
	chef-server-ctl reconfigure

	echo "Waiting for services..."
    	until (curl -D - http://localhost:8000/_status) | grep "200 OK"; do sleep 15s; done
  	while (curl http://localhost:8000/_status) | grep "fail"; do sleep 15s; done


  	echo "Creating initial user and organization..."
  	chef-server-ctl user-create chefadmin Mradul Pandey pandeymradul@gmail.com password --filename /keys/chefadmin.pem
  	chef-server-ctl org-create jinternals "Jinternals" --association_user chefadmin --filename jinternals-validator.pem


	echo "Installing Chef manage..."
	dpkg -i /package/chef-manage_2.5.8-1_amd64.deb
	chef-server-ctl reconfigure
	chef-manage-ctl reconfigure --accept-license

fi

echo "Your Chef server is ready!"
