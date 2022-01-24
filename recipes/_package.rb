#
# Cookbook:: elixir
# Recipe:: _package
#
# Copyright:: 2013-2019, Jamie Winsor (<jamie@vialstudios.com>)
#

elixir_path = File.join(node['elixir']['_versions_path'], node['elixir']['version'])

include_recipe 'erlang::esl'

github_asset 'Precompiled.zip' do
  repo 'elixir-lang/elixir'
  release "v#{node['elixir']['version']}"
  extract_to elixir_path
  action :extract
end

link node['elixir']['install_path'] do
  to elixir_path
end
