# Chef





mkdir ~/learn-chef
cd ~/learn-chef
mkdir .chef
cd .chef/
touch knife.rb

```
		current_dir = File.dirname(__FILE__)
		log_level                 :info
		log_location              STDOUT
		node_name                 "chefadmin"
		client_key                "#{current_dir}/chefadmin.pem"
		chef_server_url           "https://chef-server/organizations/jinternals"
		cookbook_path             ["#{current_dir}/../cookbooks"]

```