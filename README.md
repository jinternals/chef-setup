# Chef





## chef server setup

https://downloads.chef.io/chef-server
https://downloads.chef.io/manage



```
mkdir ~/learn-chef </br>
cd ~/learn-chef </br>
mkdir .chef </br>
cd .chef/ </br>
```

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