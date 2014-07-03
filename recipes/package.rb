#
# Cookbook Name:: elixir
# Recipe:: package
#
# Copyright (C) 2013-2014 Jamie Winsor (<jamie@vialstudios.com>)
#

include_recipe "apt::default"

apt_repository "erlang-solutions" do
  uri "http://packages.erlang-solutions.com/ubuntu"
  distribution node[:lsb][:codename]
  components ["contrib"]
  key "http://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc"

  action :add
end

package "erlang"
package "elixir"
