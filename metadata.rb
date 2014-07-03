name             "elixir"
maintainer       "Jamie Winsor"
maintainer_email "jamie@vialstudios.com"
license          "Apache 2.0"
description      "Manages an Elixir installation"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))
version          "0.7.0"

depends "apt"
depends "git"
depends "erlang"
