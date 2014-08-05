#
# Cookbook Name:: elixir
# Recipe:: package
#
# Copyright (C) 2013-2014 Jamie Winsor (<jamie@vialstudios.com>)
#

node.normal[:erlang][:esl][:version] = "1:17.1"

include_recipe "apt::default"
include_recipe "erlang::esl"
