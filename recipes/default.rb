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
  version node[:awscli][:installing_version] if node[:awscli][:installing_version].present?
end

if node[:awscli][:complete]
  file '/etc/profile.d/awscli.sh' do
    owner "root"
    group "root"
    mode 00644
    content 'complete -C aws_completer aws'
  end
end

directory "/root/.aws" do
  action :create
end

template "/root/.aws/config" do
  source "config.erb"
  action :create
end
