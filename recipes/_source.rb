#
# Cookbook Name:: elixir
# Recipe:: _source
#
# Copyright (C) 2013-2015 Jamie Winsor (<jamie@vialstudios.com>)
#

node.override[:erlang][:install_method] = 'source'

include_recipe 'erlang::default'
include_recipe 'git::default'

git 'elixir' do
  repository node[:elixir][:source][:repo]
  revision "v#{node[:elixir][:version]}"
  destination node[:elixir][:source][:_path]
  action :sync
end

bash 'elixir-make-clean' do
  cwd node[:elixir][:source][:_path]
  code 'make clean'
  action :nothing
  subscribes :run, 'git[elixir]', :immediately
end

bash 'elixir-make' do
  cwd node[:elixir][:source][:_path]
  code 'make'
  action :run
end

link node[:elixir][:install_path] do
  to node[:elixir][:source][:_path]
end
