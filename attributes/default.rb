#
# Cookbook Name:: elixir
# Attributes:: default
#
# Copyright (C) 2013-2015 Jamie Winsor (<jamie@vialstudios.com>)
#

default[:elixir][:version]        = "1.0.5"
default[:elixir][:install_method] = "package"
default[:elixir][:install_path]   = "/usr/local/lib/elixir"

#
# Private
#

default[:elixir][:_versions_path] = "/opt/elixir"
