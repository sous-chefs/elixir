# elixir Cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/elixir.svg)](https://supermarket.chef.io/cookbooks/elixir)
[![CI State](https://github.com/sous-chefs/elixir/workflows/ci/badge.svg)](https://github.com/sous-chefs/elixir/actions?query=workflow%3Aci)
[![OpenCollective](https://opencollective.com/sous-chefs/backers/badge.svg)](#backers)
[![OpenCollective](https://opencollective.com/sous-chefs/sponsors/badge.svg)](#sponsors)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

A cookbook to install [Elixir](https://elixir-lang.org/) with a custom resource.

## Maintainers

This cookbook is maintained by the Sous Chefs. The Sous Chefs are a community of Chef cookbook maintainers working together to maintain important cookbooks. If you’d like to know more please visit [sous-chefs.org](https://sous-chefs.org/) or come chat with us on the Chef Community Slack in [#sous-chefs](https://chefcommunity.slack.com/messages/C2V7B88SF).

## Requirements

### Platforms

* Ubuntu 22.04+
* Debian 12+
* RHEL compatible platforms supported through the `erlang` dependency path

### Chef

* Chef 15.3+

### Cookbooks

* erlang
* git

## Usage

Use the `elixir_install` resource in your own cookbook.

### Install the default upstream package build

```ruby
elixir_install 'default'
```

This installs Elixir `1.19.5` from the official upstream precompiled archive, links it to `/usr/local/lib/elixir`, and manages `/usr/bin/elixir`, `/usr/bin/elixirc`, `/usr/bin/iex`, and `/usr/bin/mix`.

### Compile Elixir from source

```ruby
elixir_install 'default' do
  install_method :source
end
```

### Common properties

| Property | Type | Default |
| --- | --- | --- |
| `version` | String | `"1.19.5"` |
| `install_method` | Symbol | `:package` |
| `install_path` | String | `"/usr/local/lib/elixir"` |
| `versions_path` | String | `"/opt/elixir"` |
| `otp_major` | String / Integer | `"28"` |
| `package_url` | String | `"https://builds.hex.pm/builds/elixir/v#{version}-otp-#{otp_major}.zip"` |
| `source_repo` | String | `"https://github.com/elixir-lang/elixir.git"` |
| `source_revision` | String | `"v#{version}"` |
| `source_path` | String | `"/opt/elixir/source"` |
| `manage_erlang` | true / false | `true` |
| `erlang_install_method` | Symbol | `:esl` |
| `erlang_source_version` | String | `"26.2.5.19"` |

See [documentation/elixir_elixir_install.md](documentation/elixir_elixir_install.md) for the full resource reference.

## Notes

* The resource models Elixir package and source installs explicitly. Package installs use the official Hex build archive for a specific Erlang/OTP major version.
* By default, the resource manages Erlang via `erlang::esl` and installs the Elixir OTP 28 precompiled archive. If you need source-built Erlang instead, set `erlang_install_method :source` and optionally override `erlang_source_version`.
* Current platform and dependency caveats are documented in [LIMITATIONS.md](LIMITATIONS.md).

## Contributors

This project exists thanks to all the people who [contribute.](https://opencollective.com/sous-chefs/contributors.svg?width=890&button=false)

### Backers

Thank you to all our backers!

![https://opencollective.com/sous-chefs#backers](https://opencollective.com/sous-chefs/backers.svg?width=600&avatarHeight=40)

### Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website.

![https://opencollective.com/sous-chefs/sponsor/0/website](https://opencollective.com/sous-chefs/sponsor/0/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/1/website](https://opencollective.com/sous-chefs/sponsor/1/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/2/website](https://opencollective.com/sous-chefs/sponsor/2/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/3/website](https://opencollective.com/sous-chefs/sponsor/3/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/4/website](https://opencollective.com/sous-chefs/sponsor/4/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/5/website](https://opencollective.com/sous-chefs/sponsor/5/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/6/website](https://opencollective.com/sous-chefs/sponsor/6/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/7/website](https://opencollective.com/sous-chefs/sponsor/7/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/8/website](https://opencollective.com/sous-chefs/sponsor/8/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/9/website](https://opencollective.com/sous-chefs/sponsor/9/avatar.svg?avatarHeight=100)
