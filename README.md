# elixir-cookbook

A cookbook to manage an installation of [Elixir](http://elixir-lang.org/).

## Supported Platforms

* CentOS
* Ubuntu

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>

  <tr>
    <td><tt>[:elixir][:install_path]</tt></td>
    <td>String</td>
    <td>Path that Elixir will reside in</td>
    <td><tt>"/usr/local/lib/elixir"</tt></td>
  </tr>

  <tr>
    <td><tt>[:elixir][:install_method]</tt></td>
    <td>String</td>
    <td>Method of installation: "package" or "source"</td>
    <tr><tt>package</tt></tr>
  </tr>

  <tr>
    <td><tt>[:elixir][:source][:repo]</tt></td>
    <td>String</td>
    <td>Git source repository location</td>
    <td><tt>"https://github.com/elixir-lang/elixir.git"</tt></td>
  </tr>

  <tr>
    <td><tt>[:elixir][:source][:revision]</tt></td>
    <td>String</td>
    <td>Version of Elixir to compile</td>
    <td><tt>"v0.14.2"</tt></td>
  </tr>
</table>

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

Author:: Jamie Winsor (<jamie@vialstudios.com>)
