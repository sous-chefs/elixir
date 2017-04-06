#
# Cookbook:: elixir
# Attributes:: source
#
# Copyright:: 2013-2017, Jamie Winsor (<jamie@vialstudios.com>)
#

include_attribute 'elixir::default'

default['elixir']['source']['repo'] = 'https://github.com/elixir-lang/elixir.git'

#
# Private
#

force_override['elixir']['source']['_path'] = File.join(node['elixir']['_versions_path'], 'source')
