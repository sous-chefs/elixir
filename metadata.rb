name             'elixir'
maintainer       'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license          'Apache-2.0'
description      'Manages an Elixir installation'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.12.0'

%w(ubuntu debian redhat centos suse opensuse opensuseleap scientific oracle amazon).each do |os|
  supports os
end

depends 'git'
depends 'github'
depends 'erlang'
depends 'libarchive'
depends 'validation', '>= 0.2.0'

source_url 'https://github.com/chef-cookbooks/elixir'
issues_url 'https://github.com/chef-cookbooks/elixir/issues'
chef_version '>= 12.1' if respond_to?(:chef_version)
