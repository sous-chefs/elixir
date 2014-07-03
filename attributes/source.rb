#
# Cookbook Name:: elixir
# Attributes:: source
#
# Copyright (C) 2013-2014 Jamie Winsor (<jamie@vialstudios.com>)
#

include_attribute "elixir::default"

default[:elixir][:source][:repo]     = "https://github.com/elixir-lang/elixir.git"
default[:elixir][:source][:revision] = "v#{node[:elixir][:version]}"
