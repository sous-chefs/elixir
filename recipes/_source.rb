#
# Cookbook Name:: elixir
# Recipe:: _source
#
# Copyright (C) 2013-2014 Jamie Winsor (<jamie@vialstudios.com>)
#

node.set[:erlang][:install_method]    = "source"
node.set[:erlang][:source][:version]  = "17.3"
node.set[:erlang][:source][:url]      = "http://erlang.org/download/otp_src_#{node[:erlang][:source][:version]}.tar.gz"
node.set[:erlang][:source][:checksum] = "d4be03eb346016f4ca95d53eb9437ffaa6106762f153620dd98cd7f7733b76e4"

include_recipe "erlang::default"
include_recipe "git::default"

git "elixir" do
  repository node[:elixir][:source][:repo]
  revision node[:elixir][:source][:revision]
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
