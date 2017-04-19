# elixir Cookbook

[![Build Status](https://travis-ci.org/chef-cookbooks/elixir.svg?branch=master)](https://travis-ci.org/chef-cookbooks/elixir) [![Cookbook Version](https://img.shields.io/cookbook/v/elixir.svg)](https://supermarket.chef.io/cookbooks/elixir)

A cookbook to manage an installation of [Elixir](http://elixir-lang.org/).

## Requirements

### Platforms

- Debian/Ubuntu
- RHEL/CentOS/Scientific/Amazon/Oracle

### Chef

- Chef 12.1+

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

## License and Authors

Author:: Jamie Winsor ([jamie@vialstudios.com](mailto:jamie@vialstudios.com))

```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
