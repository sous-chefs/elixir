# elixir Cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/elixir.svg)](https://supermarket.chef.io/cookbooks/elixir)
[![CI State](https://github.com/sous-chefs/elixir/workflows/ci/badge.svg)](https://github.com/sous-chefs/elixir/actions?query=workflow%3Aci)
[![OpenCollective](https://opencollective.com/sous-chefs/backers/badge.svg)](#backers)
[![OpenCollective](https://opencollective.com/sous-chefs/sponsors/badge.svg)](#sponsors)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

A cookbook to manage an installation of [Elixir](http://elixir-lang.org/).

## Maintainers

This cookbook is maintained by the Sous Chefs. The Sous Chefs are a community of Chef cookbook maintainers working together to maintain important cookbooks. If you’d like to know more please visit [sous-chefs.org](https://sous-chefs.org/) or come chat with us on the Chef Community Slack in [#sous-chefs](https://chefcommunity.slack.com/messages/C2V7B88SF).

## Requirements

### Platforms

- Debian/Ubuntu
- RHEL/CentOS/Scientific/Amazon/Oracle

### Chef

- Chef 15.3+

### Cookbooks

- git
- github
- erlang
- libarchive

## Attributes

Key                              | Type   | Description                                   | Default
-------------------------------- | ------ | --------------------------------------------- | ---------------------------------------------
`node[:elixir][:install_path]`   | String | Path that Elixir will reside in               | "/usr/local/lib/elixir"
`node[:elixir][:install_method]` | String | Method of installation: "package" or "source" | "package"
`node[:elixir][:source][:repo]`  | String | Git source repository location                | "<https://github.com/elixir-lang/elixir.git>"
`node[:elixir][:version]`        | String | Version of Elixir to compile                  | "v1.4.2"

## Usage

Include `elixir` in your node's `run_list`

```json
{
  "run_list": [
    "recipe[elixir::default]"
  ]
}
```

### elixir::default

This will install Elixir and Erlang on the node. By default, Elixir and Erlang will be installed from packages. If you want to install from source you can set the `node[:elixir][:install_method]` attribute.

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
