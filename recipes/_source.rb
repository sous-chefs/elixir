#
# Cookbook Name:: elixir
# Recipe:: _source
#
# Copyright (C) 2013-2014 Jamie Winsor (<jamie@vialstudios.com>)
#

node.set[:erlang][:install_method]    = "source"
node.set[:erlang][:source][:version]  = "17.5"
node.set[:erlang][:source][:url]      = "http://erlang.org/download/otp_src_#{node[:erlang][:source][:version]}.tar.gz"
node.set[:erlang][:source][:checksum] = "3c28820c981b30c50df8ac2a4a238e5813454fa3ed2ad530bc7948a282846474"

include_recipe "erlang::default"
include_recipe "git::default"

git "elixir" do
  repository node[:elixir][:source][:repo]
  revision "v#{node[:elixir][:version]}"
  destination node[:elixir][:source][:_path]

  action :sync
end

bash "elixir-make-clean" do
  cwd node[:elixir][:source][:_path]
  code "make clean"

  action :nothing
  subscribes :run, "git[elixir]", :immediately
end

bash "elixir-make" do
  cwd node[:elixir][:source][:_path]
  code "make"

  action :run
end

link node[:elixir][:install_path] do
  to node[:elixir][:source][:_path]
end
