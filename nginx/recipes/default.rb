package 'nginx'

service 'nginx' do
  supports reload: true, status: true, restart: true
  action [:enable, :start]
end

template '/etc/nginx/nginx.conf' do
  notifies :reload, "service[nginx]"
end

# comment out default nginx site
# or just comment out include /etc/nginx/sites-enabled/*; line
# in the nginx.conf.erb
template '/etc/nginx/sites-available/default' do
  source 'default_config'
  notifies :reload, "service[nginx]"
end

link '/etc/nginx/sites-enabled/default' do
  to '/etc/nginx/sites-available/default'
end
