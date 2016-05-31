include_recipe "nginx::default"

template "/etc/nginx/sites-available/default" do
  source "nginx_default.erb"
  mode 0644
  owner "root"
  owner "root"
  notifies :restart, "service[nginx]", :delayed
end
