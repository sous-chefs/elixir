#
# Cookbook:: elixir
# Attributes:: default
#
# Copyright:: 2013-2017, Jamie Winsor (<jamie@vialstudios.com>)
#

default['elixir']['version']        = '1.4.2'
default['elixir']['install_method'] = 'package'
default['elixir']['install_path']   = '/usr/local/lib/elixir'

#
# Private
#

default['elixir']['_versions_path'] = '/opt/elixir'
