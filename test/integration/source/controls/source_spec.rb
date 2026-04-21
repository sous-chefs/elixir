# frozen_string_literal: true

require_relative '../../spec_helper'

control 'elixir-source-01' do
  impact 1.0
  title 'Elixir is installed from source'

  describe command("#{elixir_bin} --version") do
    its('exit_status') { should eq 0 }
    its('stdout') { should match(/Elixir 1\.19\.5/) }
  end
end

control 'elixir-source-02' do
  impact 0.7
  title 'The source tree is the active installation'

  describe file(install_path) do
    it { should be_symlink }
    its('link_path') { should eq '/opt/elixir/source' }
  end
end
