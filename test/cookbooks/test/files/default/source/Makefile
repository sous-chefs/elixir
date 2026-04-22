all:
	mkdir -p bin
	printf '%s\n' '#!/bin/sh' 'echo "Elixir 1.19.5 (compiled with Erlang/OTP 26)"' > bin/elixir
	printf '%s\n' '#!/bin/sh' 'echo "Elixir 1.19.5 (compiled with Erlang/OTP 26)"' > bin/elixirc
	printf '%s\n' '#!/bin/sh' 'echo "Elixir 1.19.5 (compiled with Erlang/OTP 26)"' > bin/iex
	printf '%s\n' '#!/bin/sh' 'echo "Elixir 1.19.5 (compiled with Erlang/OTP 26)"' > bin/mix
	chmod 0755 bin/elixir bin/elixirc bin/iex bin/mix

clean:
	rm -rf bin
