# frozen_string_literal: true

provides :elixir_install
unified_mode true

default_action :install

property :version, String, default: '1.19.5'
property :install_method, Symbol, equal_to: %i(package source), default: :package
property :install_path, String, default: '/usr/local/lib/elixir'
property :versions_path, String, default: '/opt/elixir'
property :link_bin_path, String, default: '/usr/bin'
property :manage_erlang, [true, false], default: true, desired_state: false
property :erlang_install_method, Symbol, equal_to: %i(source esl package), default: :esl, desired_state: false
property :erlang_source_version, String, default: '26.2.5.19', desired_state: false
property :otp_major, [String, Integer], coerce: proc { |value| value.to_s }, default: '28'
property :package_url, String, default: lazy { "https://builds.hex.pm/builds/elixir/v#{version}-otp-#{otp_major}.zip" }
property :source_repo, String, default: 'https://github.com/elixir-lang/elixir.git'
property :source_revision, String, default: lazy { "v#{version}" }
property :source_path, String, default: lazy { ::File.join(versions_path, 'source') }

action :install do
  cleanup_legacy_install_path

  directory new_resource.versions_path do
    recursive true
  end

  converge_erlang if new_resource.manage_erlang

  case new_resource.install_method
  when :package
    remote_file package_archive_path do
      source new_resource.package_url
    end

    archive_file package_archive_path do
      destination package_install_path
      overwrite false
      not_if { ::File.exist?(::File.join(package_install_path, 'bin', 'elixir')) }
    end

    link new_resource.install_path do
      to package_install_path
    end
  when :source
    include_recipe 'git::default'

    git new_resource.source_path do
      repository new_resource.source_repo
      revision new_resource.source_revision
      action :sync
      notifies :run, 'bash[elixir-make-clean]', :immediately
      notifies :run, 'bash[elixir-make]', :immediately
    end

    bash 'elixir-make-clean' do
      cwd new_resource.source_path
      code 'make clean'
      action :nothing
    end

    bash 'elixir-make' do
      cwd new_resource.source_path
      code 'make'
      action :nothing
    end

    link new_resource.install_path do
      to new_resource.source_path
    end
  end

  executables.each do |command|
    link ::File.join(new_resource.link_bin_path, command) do
      to ::File.join(new_resource.install_path, 'bin', command)
    end
  end
end

action :remove do
  executables.each do |command|
    link ::File.join(new_resource.link_bin_path, command) do
      action :delete
    end
  end

  link new_resource.install_path do
    action :delete
  end

  case new_resource.install_method
  when :package
    file package_archive_path do
      action :delete
    end

    directory package_install_path do
      recursive true
      action :delete
    end
  when :source
    directory new_resource.source_path do
      recursive true
      action :delete
    end
  end
end

action_class do
  def cleanup_legacy_install_path
    directory new_resource.install_path do
      recursive true
      action :delete
      only_if { ::File.directory?(new_resource.install_path) && !::File.symlink?(new_resource.install_path) }
    end
  end

  def converge_erlang
    apt_update 'elixir-package-cache' if platform_family?('debian')

    case new_resource.erlang_install_method
    when :source
      node.override['erlang']['install_method'] = 'source'
      node.override['erlang']['source']['version'] = new_resource.erlang_source_version
      node.override['erlang']['source']['url'] = "https://www.erlang.org/download/otp_src_#{new_resource.erlang_source_version}.tar.gz"
      node.override['erlang']['source']['checksum'] = nil
      include_recipe 'erlang::default'
    when :esl
      include_recipe 'erlang::esl'
    when :package
      include_recipe 'erlang::package'
    end
  end

  def executables
    %w(elixir elixirc iex mix)
  end

  def package_archive_path
    ::File.join(Chef::Config[:file_cache_path], "elixir-v#{new_resource.version}-otp-#{new_resource.otp_major}.zip")
  end

  def package_install_path
    ::File.join(new_resource.versions_path, "#{new_resource.version}-otp-#{new_resource.otp_major}")
  end
end
