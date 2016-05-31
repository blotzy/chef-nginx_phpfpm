#
# Cookbook Name:: nginx_phpfpm
# Recipe:: php
#
# Copyright (C) 2016 Richard Acosta
#
# All rights reserved - Do Not Redistribute
#

%w(unixodbc unixodbc-dev libgeoip-dev sqlite3 subversion).each do |pkg|
  package pkg do
    action :install
  end
end

include_recipe "php::source"

service "php-fpm" do
  service_name "php-fpm"
  restart_command "/etc/init.d/php-fpm restart"
  reload_command "/etc/init.d/php-fpm reload"
end

template "/etc/init.d/php-fpm" do
  source "init.d.php-fpm.erb"
  mode 0755
  owner "root"
  group "root"
  notifies :restart, "service[php-fpm]", :delayed
end

template node[:php][:fpm][:conf] do
  source "php-fpm.conf.erb"
  mode 0644
  owner "root"
  group "root"
  variables({
    :directives => node[:php][:fpm][:directives]
  })
  notifies :restart, "service[php-fpm]", :delayed
end

execute "update-rc.d php-fpm" do
  command "update-rc.d php-fpm defaults"
end

template "#{node[:php][:ext_conf_dir]}/opcache.ini" do
  source "opcache.ini.erb"
  mode 0644
  owner "root"
  group "root"
  notifies :restart, "service[php-fpm]", :delayed
end

template "#{node[:php][:ext_conf_dir]}/timezone.ini" do
  source "timezone.ini.erb"
  mode 0644
  owner "root"
  group "root"
  variables({
    :timezone => node[:nginx_phpfpm][:timezone]
  })
  notifies :restart, "service[php-fpm]", :delayed
end

template "#{node[:php][:ext_conf_dir]}/php-zlib.ini" do
  source "php-zlib.ini.erb"
  mode 0644
  owner "root"
  group "root"
  variables({
    :compression_state => node[:nginx_phpfpm][:compression_state]
  })
  notifies :restart, "service[php-fpm]", :delayed
end
