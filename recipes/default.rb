#
# Cookbook Name:: nginx_phpfpm
# Recipe:: default
#
# Copyright (C) 2016 Richard Acosta
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt::default'

include_recipe "nginx_phpfpm::nginx"
include_recipe "nginx_phpfpm::php"
