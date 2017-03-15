# elixir-cookbook

A cookbook to manage an installation of [Elixir](http://elixir-lang.org/).

## Supported Platforms

- CentOS
- Ubuntu

## Attributes

Key                                 | Type   | Description                                   | Default
----------------------------------- | ------ | --------------------------------------------- | ---------------------------------------------
`node[:elixir][:install_path]`      | String | Path that Elixir will reside in               | "/usr/local/lib/elixir"
`node[:elixir][:install_method]`    | String | Method of installation: "package" or "source" | "package"
`node[:elixir][:source][:repo]`     | String | Git source repository location                | "<https://github.com/elixir-lang/elixir.git>"
`node[:elixir][:source][:revision]` | String | Version of Elixir to compile                  | "v0.14.2"

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
