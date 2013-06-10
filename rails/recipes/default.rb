gem_package 'bundler' do
  version '1.3.5'
end

gem_package 'rails' do
  version '3.2.13'
end

# do not create 'current' direcotory, it must be a symlink created by capistrano

# common = {name: 'kayak', app_root: '/u/apps/kayak'}

# directory "#{common[:app_root]}" do
#   recursive true
#   owner 'vagrant'
#   group 'vagrant'
# end

# directory "#{common[:app_root]}/current" do
#   owner 'vagrant'
#   group 'vagrant'
# end

# %w[config log tmp pids sockets].each do |dir|
#   directory "#{common[:app_root]}/shared/#{dir}" do
#     owner 'vagrant'
#     group 'vagrant'
#     recursive true
#     mode 0755
#   end
# end

# template "#{node[:unicorn][:config_path]}/kayak.conf.rb" do
#   mode 0644
#   source "unicorn.conf.erb"
#   variables common
# end

# nginx_config_file = "/etc/nginx/sites-available/#{common[:name]}"

# template nginx_config_file do
#   mode 0644
#   source "nginx.conf.erb"
#   variables common.merge(server_names: 'kayak.test')
#   notifies :reload, "service[nginx]"
# end

# link "/etc/nginx/sites-enabled/#{common[:name]}" do
#   to nginx_config_file
#   notifies :reload, "service[nginx]"
# end
