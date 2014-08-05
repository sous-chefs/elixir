#
# Cookbook Name:: elixir
# Recipe:: default
#
# Copyright (C) 2013-2014 Jamie Winsor (<jamie@vialstudios.com>)
#

ChefElixir.validate_attributes!(node)
include_recipe "elixir::_#{node[:elixir][:install_method]}"
