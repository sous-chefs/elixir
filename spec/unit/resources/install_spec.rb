# frozen_string_literal: true

require 'spec_helper'

describe 'elixir_install' do
  step_into :elixir_install
  platform 'ubuntu', '24.04'

  let(:cache_path) { Chef::Config[:file_cache_path] }

  context 'with the default package install path' do
    recipe do
      elixir_install 'default' do
        manage_erlang false
      end
    end

    it { is_expected.to create_directory('/opt/elixir') }
    it { is_expected.to create_remote_file("#{cache_path}/elixir-v1.19.5-otp-28.zip") }
    it { is_expected.to extract_archive_file("#{cache_path}/elixir-v1.19.5-otp-28.zip").with(destination: '/opt/elixir/1.19.5-otp-28') }
    it { is_expected.to create_link('/usr/local/lib/elixir').with(to: '/opt/elixir/1.19.5-otp-28') }

    %w(elixir elixirc iex mix).each do |command|
      it { is_expected.to create_link("/usr/bin/#{command}").with(to: "/usr/local/lib/elixir/bin/#{command}") }
    end
  end

  context 'with the source install path' do
    recipe do
      elixir_install 'default' do
        install_method :source
        manage_erlang false
        source_path '/srv/elixir/source'
      end
    end

    it { is_expected.to include_recipe('git::default') }
    it do
      is_expected.to sync_git('/srv/elixir/source').with(
        repository: 'https://github.com/elixir-lang/elixir.git',
        revision: 'v1.19.5'
      )
    end
    it 'notifies the source build steps' do
      expect(chef_run.git('/srv/elixir/source')).to notify('bash[elixir-make-clean]').to(:run).immediately
      expect(chef_run.git('/srv/elixir/source')).to notify('bash[elixir-make]').to(:run).immediately
    end
    it { is_expected.to create_link('/usr/local/lib/elixir').with(to: '/srv/elixir/source') }
  end

  context 'with action :remove for the package path' do
    recipe do
      elixir_install 'default' do
        action :remove
      end
    end

    it { is_expected.to delete_link('/usr/local/lib/elixir') }
    it { is_expected.to delete_file("#{cache_path}/elixir-v1.19.5-otp-28.zip") }
    it { is_expected.to delete_directory('/opt/elixir/1.19.5-otp-28') }
  end
end
