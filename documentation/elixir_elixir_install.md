# elixir_elixir_install

Install Elixir from an upstream precompiled archive or from source.

## Actions

| Action | Description |
| --- | --- |
| `:install` | Installs Elixir and links the active binaries (default). |
| `:remove` | Removes the Elixir installation artifacts managed by the resource. |

## Properties

| Property | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | String | `name` | Resource name. |
| `version` | String | `"1.19.5"` | Elixir version to install. |
| `install_method` | Symbol | `:package` | Install from the upstream precompiled archive or from source. |
| `install_path` | String | `"/usr/local/lib/elixir"` | Symlink path for the active Elixir installation. |
| `versions_path` | String | `"/opt/elixir"` | Parent directory for managed Elixir installs. |
| `link_bin_path` | String | `"/usr/bin"` | Directory for command symlinks. |
| `manage_erlang` | true / false | `true` | Whether to manage Erlang with the `erlang` cookbook. |
| `erlang_install_method` | Symbol | `:esl` | Dependency strategy for Erlang when `manage_erlang` is true. |
| `erlang_source_version` | String | `"26.2.5.19"` | Erlang/OTP version to compile when `erlang_install_method` is `:source`. |
| `otp_major` | String / Integer | `"28"` | Erlang/OTP major used to select the upstream precompiled Elixir archive. |
| `package_url` | String | `https://builds.hex.pm/builds/elixir/v#{version}-otp-#{otp_major}.zip` | Upstream precompiled archive URL. |
| `source_repo` | String | `"https://github.com/elixir-lang/elixir.git"` | Git repository used for source installs. |
| `source_revision` | String | `"v#{version}"` | Git revision used for source installs. |
| `source_path` | String | `"/opt/elixir/source"` | Checkout path used for source installs. |

## Examples

### Basic usage

```ruby
elixir_install 'default'
```

### Compile from source

```ruby
elixir_install 'default' do
  install_method :source
end
```

### Use source-built Erlang

```ruby
elixir_install 'default' do
  erlang_install_method :source
  erlang_source_version '26.2.5.19'
end
```

### Use an externally managed Erlang runtime

```ruby
elixir_install 'default' do
  manage_erlang false
  otp_major '28'
end
```
