#
# Cookbook Name:: awscli
# Recipe:: default
#
# Copyright (C) 2013 Nils De Moor
# 
# All rights reserved - Do Not Redistribute
#

python_pip "awscli" do
  action :install
end

directory "/root/.aws" do
  action :create
end

template "root/.aws/config" do
  source "config.erb"
  action :create
end
