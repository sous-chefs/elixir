#
# Cookbook:: elixir
# Recipe:: _source
#
# Copyright:: 2013-2019, Jamie Winsor (<jamie@vialstudios.com>)
#

node.override['erlang']['install_method'] = 'source'

include_recipe 'erlang::default'
include_recipe 'git::default'

git 'elixir' do
  repository node['elixir']['source']['repo']
  revision "v#{node['elixir']['version']}"
  destination node['elixir']['source']['_path']
  action :sync
  notifies :run, 'bash[elixir-make-clean]', :immediately
  notifies :run, 'bash[elixir-make]', :immediately
end

bash 'elixir-make-clean' do
  cwd node['elixir']['source']['_path']
  code 'make clean'
  action :nothing
end

bash 'elixir-make' do
  cwd node['elixir']['source']['_path']
  code 'make'
  action :nothing
end

link node['elixir']['install_path'] do
  to node['elixir']['source']['_path']
end
