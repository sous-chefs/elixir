#
# Cookbook Name:: elixir
# Library:: chef_elixir
#
# Copyright (C) 2013-2014 Jamie Winsor (<jamie@vialstudios.com>)
#

module ChefElixir
  class << self
    INSTALL_METHODS = [
      "source",
      "package",
    ].freeze

    def validate_attributes!(node)
      unless node.has_key?(:elixir) && node[:elixir].has_key?(:install_method)
        Chef::Application.fatal!("Missing required attribute 'elixir/install_method'.")
      end

      unless INSTALL_METHODS.include?(node[:elixir][:install_method])
        msg = "Unsupported install method for Elixir '#{node[:elixir][:install_method]}'. Please set the " +
        "'elixir/install_method' attribute to one of the supported install methods: #{INSTALL_METHODS.join(', ')}."
        Chef::Application.fatal!(msg)
      end
    end
  end
end
