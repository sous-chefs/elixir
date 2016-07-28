#
# Cookbook Name:: elixir
# Recipe:: _package
#
# Copyright (C) 2013-2015 Jamie Winsor (<jamie@vialstudios.com>)
#

case node['platform_family']
when 'debian'
  node.normal[:apt][:compile_time_update] = true
end

elixir_path = File.join(node[:elixir][:_versions_path], node[:elixir][:version])

include_recipe "apt::default"
include_recipe "erlang::esl"
include_recipe "libarchive"

asset = github_asset "Precompiled.zip" do
  repo "elixir-lang/elixir"
  release "v#{node[:elixir][:version]}"
end

directory elixir_path do
  recursive true
end

libarchive_file "Precompiled.zip" do
  path asset.asset_path
  extract_to elixir_path
end

link node[:elixir][:install_path] do
  to elixir_path
end
