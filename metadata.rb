# frozen_string_literal: true

name              'elixir'
maintainer        'Sous Chefs'
maintainer_email  'help@sous-chefs.org'
license           'Apache-2.0'
description       'Provides an elixir_install resource for installing Elixir from upstream packages or source'
version           '3.0.15'
source_url        'https://github.com/sous-chefs/elixir'
issues_url        'https://github.com/sous-chefs/elixir/issues'
chef_version      '>= 15.3'

supports 'centos', '>= 9.0'
supports 'debian', '>= 12.0'
supports 'oracle', '>= 8.0'
supports 'redhat', '>= 8.0'
supports 'ubuntu', '>= 22.04'

depends 'git', '>= 5.0.0'
depends 'erlang', '>= 8.1.0'
