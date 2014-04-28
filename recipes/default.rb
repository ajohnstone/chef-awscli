#
# Cookbook Name:: awscli
# Recipe:: default
#
# Copyright (C) 2013 Nils De Moor
#
# All rights reserved - Do Not Redistribute
#

include_recipe "python"


python_pip "awscli" do
  action :install
  version node[:awscli][:version]
end

if node[:awscli][:complete]
  file '/etc/profile.d/awscli.sh' do
    owner "root"
    group "root"
    mode 00644
    content 'complete -C aws_completer aws'
  end
end

directory "#{node[:awscli][:user_home]}/.aws" do
  action :create
  owner node[:awscli][:user]
end

template "#{node[:awscli][:user_home]}/.aws/config" do
  source "config.erb"
  action :create
  owner node[:awscli][:user]
  mode 0600
end
