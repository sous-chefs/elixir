name             "elixir"
maintainer       "Jamie Winsor"
maintainer_email "jamie@vialstudios.com"
license          "Apache 2.0"
description      "Manages an Elixir installation"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))
version          "0.10.0"

depends "apt", "~> 2.7"
depends "git"
depends "github"
depends "erlang"
depends "libarchive", "~> 0.4"
