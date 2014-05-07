#
# Cookbook Name:: elixir
# Recipe:: source
#
# Copyright (C) 2013 Jamie Winsor (<jamie@vialstudios.com>)
#

node.set[:erlang][:install_method]    = "source"
node.set[:erlang][:source][:version]  = "17.0"
node.set[:erlang][:source][:url]      = "http://erlang.org/download/otp_src_#{node[:erlang][:source][:version]}.tar.gz"
node.set[:erlang][:source][:checksum] = "a5f78c1cf0eb7724de3a59babc1a28e5"

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

  action :nothing
  subscribes :run, "git[elixir]", :immediately
end

bash "elixir-make" do
  cwd node[:elixir][:install_path]
  code "make"

  action :run
end
