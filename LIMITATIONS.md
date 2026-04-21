# Limitations

## Package Availability

### APT (Debian/Ubuntu)

* Elixir does not publish an official APT repository. The official install guide recommends distro packages, install scripts, or upstream precompiled archives instead.
* Ubuntu is listed explicitly in the official install guide. The guide notes that `apt` packages "tend to lag several versions behind" and suggests install scripts or distro packages with additional Erlang packaging where needed.
* Because this cookbook's package-style path installs upstream Elixir artifacts rather than distro-native repository packages, Debian/Ubuntu support is gated more by Erlang availability than by an Elixir-managed APT repository.

### DNF/YUM (RHEL family)

* Elixir does not publish an official DNF/YUM repository. The official install guide lists Fedora distro packages, but not an official upstream RPM repository for RHEL-family systems.
* For this cookbook, package-style installs are therefore best modeled as upstream precompiled archives plus an Erlang dependency path, not as a vendor-managed RPM repository flow.

### Upstream Precompiled Archives

* The official Elixir install guide says every release has a precompiled package.
* Current upstream packages are published per Erlang/OTP major version, for example `v1.19.5-otp-28.zip`, `v1.19.5-otp-27.zip`, and `v1.19.5-otp-26.zip`.
* The guide also documents a stable mirror URL pattern: `https://builds.hex.pm/builds/elixir/${ELIXIR_VERSION}-otp-${OTP_VERSION}.zip`.
* This means package installs need an explicit Erlang/OTP compatibility choice. The historic `Precompiled.zip` asset name used by this cookbook is a legacy GitHub release convention and is not the modern upstream packaging shape.

## Architecture Limitations

* The official install guide does not publish a Linux architecture matrix for the upstream precompiled archives.
* In practice, support is constrained by the Erlang runtime and build toolchain available on the target platform more than by cookbook logic.

## Source/Compiled Installation

### Build Dependencies

| Platform Family | Requirements |
| --- | --- |
| All | Erlang/OTP must already be installed; Elixir's official source instructions also require `make`. |
| Cookbook source path | This cookbook's legacy source flow also requires `git`, because it clones `https://github.com/elixir-lang/elixir.git` before building. |
| Debian | The dependent `erlang::source` path installs `tar`, `libncurses5-dev`, `openssl`, and `libssl-dev`. |
| RHEL/Fedora | The dependent `erlang::source` path installs `tar`, `ncurses-devel`, and `openssl-devel`. |
| SUSE | The dependent `erlang::source` path installs `tar`, `ncurses-devel`, and `libopenssl-devel`. |

## Known Issues

* Elixir v1.19 requires Erlang 26.0 or later according to the official install guide. Any cookbook default or test matrix using newer Elixir releases must align the Erlang dependency path accordingly.
* The current cookbook's package path depends on `erlang::esl`, but that recipe only handles Debian and RHEL-family nodes. Amazon Linux is currently declared in `metadata.rb`, yet the dependency path used by this cookbook does not actually install Erlang there.
* The current cookbook's source path forces `node['erlang']['install_method'] = 'source'`, but the dependent `erlang::source` recipe has no Amazon-specific branch either. Amazon support is therefore not currently supportable without extra dependency work.
* CentOS Linux 7 and 8 are end-of-life, Ubuntu 18.04/20.04 are no longer appropriate defaults for a new matrix, and Debian 9/10/11 are out of current support windows or near the end of support. Platform declarations and Kitchen matrices should be updated accordingly.

## Sources

* [https://elixir-lang.org/install.html](https://elixir-lang.org/install.html)
* [https://github.com/elixir-lang/elixir/releases](https://github.com/elixir-lang/elixir/releases)
* [https://endoflife.date/ubuntu](https://endoflife.date/ubuntu)
* [https://endoflife.date/debian](https://endoflife.date/debian)
* [https://endoflife.date/centos](https://endoflife.date/centos)
* [https://endoflife.date/centos-stream](https://endoflife.date/centos-stream)
* [https://endoflife.date/rhel](https://endoflife.date/rhel)
* [https://endoflife.date/oracle-linux](https://endoflife.date/oracle-linux)
* [https://endoflife.date/amazon-linux](https://endoflife.date/amazon-linux)
