# frozen_string_literal: true

apt_update

package 'ca-certificates'
package 'erlang'
package 'git'
package 'make'

directory '/tmp/elixir-source-fixture' do
  recursive true
end

cookbook_file '/tmp/elixir-source-fixture/Makefile' do
  source 'source/Makefile'
end

execute 'seed elixir source fixture repository' do
  cwd '/tmp/elixir-source-fixture'
  command <<~EOH
    git init -b main .
    git add Makefile
    git -c user.email=test@example.com -c user.name='Test Cookbook' commit -m 'Add fixture'
  EOH
  creates '/tmp/elixir-source-fixture/.git/refs/heads/main'
end

elixir_install 'default' do
  install_method :source
  manage_erlang false
  source_repo '/tmp/elixir-source-fixture'
  source_revision 'main'
end
