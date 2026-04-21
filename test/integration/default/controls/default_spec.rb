# frozen_string_literal: true

require_relative '../../spec_helper'

control 'elixir-default-01' do
  impact 1.0
  title 'Elixir is installed from the default resource path'

  describe command("#{elixir_bin} --version") do
    its('exit_status') { should eq 0 }
    its('stdout') { should match(/Elixir 1\.19\.5/) }
  end
end

control 'elixir-default-02' do
  impact 0.7
  title 'The active installation path is linked into place'

  describe file(install_path) do
    it { should be_symlink }
  end
end
