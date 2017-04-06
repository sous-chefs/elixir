#
# Cookbook:: elixir
# Recipe:: _package
#
# Copyright:: 2013-2017, Jamie Winsor (<jamie@vialstudios.com>)
#

elixir_path = File.join(node['elixir']['_versions_path'], node['elixir']['version'])

include_recipe 'erlang::esl'
include_recipe 'libarchive'

asset = github_asset 'Precompiled.zip' do
  repo 'elixir-lang/elixir'
  release "v#{node['elixir']['version']}"
end

directory elixir_path do
  recursive true
end

libarchive_file 'Precompiled.zip' do
  path asset.asset_path
  extract_to elixir_path
end

link node['elixir']['install_path'] do
  to elixir_path
end
