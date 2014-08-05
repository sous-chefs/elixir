#
# Cookbook Name:: elixir
# Recipe:: default
#
# Copyright (C) 2013-2014 Jamie Winsor (<jamie@vialstudios.com>)
#

ChefElixir.validate_attributes!(node)
include_recipe "elixir::_#{node[:elixir][:install_method]}"

bin_path    = File.join(node[:elixir][:install_path], "bin")
executables = ["elixir", "elixirc", "iex", "mix"]

executables.each do |executable|
  link "/usr/bin/#{executable}" do
    to File.join(bin_path, executable)
  end
end
