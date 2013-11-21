#
# Cookbook Name:: elixir
# Recipe:: source
#
# Copyright (C) 2013 Jamie Winsor (<jamie@vialstudios.com>)
#

node.set[:erlang][:install_method]    = "source"
node.set[:erlang][:source][:version]  = "R16B02"
node.set[:erlang][:source][:url]      = "http://erlang.org/download/otp_src_#{node[:erlang][:source][:version]}.tar.gz"
node.set[:erlang][:source][:checksum] = "ca63bcde0e5ae0f2df9457f97b3115a4"

include_recipe "erlang::default"
include_recipe "git::default"

git "elixir" do
  repository node[:elixir][:source][:repo]
  revision node[:elixir][:source][:revision]
  destination node[:elixir][:install_path]

  action :sync
end

bash "elixir-make-clean" do
  cwd node[:elixir][:install_path]
  code "make clean"

  subscribes :run, "git[elixir]"
end

bash "elixir-make" do
  cwd node[:elixir][:install_path]
  code "make"
  timeout 300

  action :run
end
