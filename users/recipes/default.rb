gem_package 'ruby-shadow' do
end

node[:users] .each do |name, conf|

  home_dir = "/home/#{name}"


  user name do
    shell "/bin/bash"
    password conf[:password]
  end

  directory home_dir do
    owner name
    mode 0700
  end

  user name do
    home home_dir
    action :modify
  end

  directory "#{home_dir}/.ssh" do
    owner name
    mode 0700
  end

  template "#{home_dir}/.ssh/authorized_keys" do
    source 'authorized_keys.erb'
    owner name
    mode 0600
    variables keys: conf[:ssh_keys]
  end

end
