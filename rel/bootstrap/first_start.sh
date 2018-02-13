#!/bin/sh

mix local.hex --force
mix deps.get
mix local.rebar --force

MIX_ENV=prod PORT=4000 mix release --env=prod

# _build/prod/rel/edistillery/bin/edistillery