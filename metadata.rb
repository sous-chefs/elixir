name             'elixir'
maintainer       'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license          'Apache-2.0'
description      'Manages an Elixir installation'
version          '1.1.0'

%w(ubuntu debian redhat centos suse opensuse opensuseleap scientific oracle amazon).each do |os|
  supports os
end

depends 'git', '>= 5.0.0'
depends 'github'
depends 'erlang', '>= 3.0.0'
depends 'libarchive', '>= 2.0.0'

source_url 'https://github.com/chef-cookbooks/elixir'
issues_url 'https://github.com/chef-cookbooks/elixir/issues'
chef_version '>= 12.15'
