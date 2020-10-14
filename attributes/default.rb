#
# Cookbook:: elixir
# Attributes:: default
#
# Copyright:: 2013-2019, Jamie Winsor (<jamie@vialstudios.com>)
#

default['elixir']['version']        = '1.11.0'
default['elixir']['install_method'] = 'package'
default['elixir']['install_path']   = '/usr/local/lib/elixir'

#
# Private
#

default['elixir']['_versions_path'] = '/opt/elixir'
