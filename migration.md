# Migration Guide

This cookbook migrated from install-method recipes and attributes to a custom resource.

## Breaking change

This is a breaking change for operators upgrading from older cookbook versions. If your existing wrapper cookbook, role, or policyfile still sets `node['elixir']` attributes and converges `include_recipe 'elixir::default'`, you must update that code before upgrading to a release that uses the `elixir_install` resource.

An in-place cookbook version bump without that migration will fail because the legacy `attributes/` data and recipe entry points no longer exist.

## What changed

* `attributes/` was removed.
* `recipes/default.rb`, `recipes/_package.rb`, and `recipes/_source.rb` were removed.
* The public interface is now the `elixir_install` resource.
* Install method, version selection, and Erlang behavior now live on resource properties.

## How to migrate

Legacy pattern:

```ruby
node.default['elixir']['install_method'] = 'source'
node.default['elixir']['version'] = '1.19.5'

include_recipe 'elixir::default'
```

Resource-first pattern:

```ruby
elixir_install 'default' do
  install_method :source
  version '1.19.5'
end
```

Package install example:

```ruby
elixir_install 'default'
```

## Attribute migration

Move old cookbook attributes to resource properties:

* version -> `version`
* install method -> `install_method`
* install path -> `install_path` or `versions_path`
* source repository settings -> `source_repo`, `source_revision`, `source_path`
* Erlang behavior -> `manage_erlang`, `erlang_install_method`, `erlang_source_version`

## Important note

The resource models both package and source installs explicitly. New wrapper cookbooks should declare the intended install path directly instead of relying on recipe branching.
