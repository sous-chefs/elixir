#
# Cookbook Name:: elixir
# Recipe:: package
#
# Copyright (C) 2013-2014 Jamie Winsor (<jamie@vialstudios.com>)
#

node.normal[:erlang][:esl][:version] = "1:17.1"

include_recipe "apt::default"
include_recipe "erlang::esl"
include_recipe "libarchive"

asset = github_asset "Precompiled.zip" do
  repo "elixir-lang/elixir"
  release node[:elixir][:source][:revision]
end

libarchive_file "Precompiled.zip" do
  path asset.asset_path
  extract_to node[:elixir][:install_path]
end
