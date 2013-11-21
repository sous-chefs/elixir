# elixir-cookbook

A cookbook to manage an installation of [Elixir](http://elixir-lang.org/).

## Supported Platforms

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
    <td><tt>[:elixir][:source][:repo]</tt></td>
    <td>String</td>
    <td>Git source repository location</td>
    <td><tt>"https://github.com/elixir-lang/elixir.git"</tt></td>
  </tr>

  <tr>
    <td><tt>[:elixir][:source][:revision]</tt></td>
    <td>String</td>
    <td>Version of Elixir to compile</td>
    <td><tt>"v0.11.2"</tt></td>
  </tr>
</table>

## Usage

### elixir::default

Include `elixir` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[elixir::default]"
  ]
}
```

_Note: You must have at least 1GB of memory to compile Elixir from source_

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Jamie Winsor (<jamie@vialstudios.com>)
