# frozen_string_literal: true

apt_update

package 'ca-certificates'
package 'erlang'
package 'zip'

directory '/tmp/elixir-package-fixture/bin' do
  recursive true
end

%w(elixir elixirc iex mix).each do |command|
  cookbook_file "/tmp/elixir-package-fixture/bin/#{command}" do
    source "package/bin/#{command}"
    mode '0755'
  end
end

execute 'build elixir package fixture archive' do
  cwd '/tmp/elixir-package-fixture'
  command 'zip -rq /tmp/elixir-v1.19.5-otp-26.zip bin'
  creates '/tmp/elixir-v1.19.5-otp-26.zip'
end

elixir_install 'default' do
  manage_erlang false
  otp_major '26'
  package_url 'file:///tmp/elixir-v1.19.5-otp-26.zip'
end
