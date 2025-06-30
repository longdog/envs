#!/usr/bin/env bats

load 'libs/bats-support/load'
load 'libs/bats-assert/load'

setup() {
  TMPDIR=$(mktemp -d)
  current=$(realpath .)
  cd "$TMPDIR"

  # Simulate a git project
  mkdir -p app/back
  cd app
  git init -q
  git remote add origin https://github.com/example/project.git
  cd back
  export HOME="$TMPDIR/home"
  mkdir -p "$HOME/.config/envs"

  # Copy the script under test
  SCRIPT="$TMPDIR/envs"
  cp "$current/envs" "$SCRIPT"
  chmod +x "$SCRIPT"
}

teardown() {
  rm -rf "$TMPDIR"
}

@test "creates .env symlink when no local .env exists" {
  run "$SCRIPT"
  assert_success
  assert_output --partial "Symlink created"
  expected_target="$HOME/.config/envs/github.com-example-project.git/back/.env"
  [ -L .env ]
  [ "$(readlink .env)" = "$expected_target" ]
}

@test "moves existing .env to centralized location" {
  echo "FOO=bar" > .env
  run "$SCRIPT"
  assert_success
  assert_output --partial "Preserving existing .env file"

  central_env="$HOME/.config/envs/github.com-example-project.git/back/.env"
  [ -f "$central_env" ]
  [ "$(cat "$central_env")" = "FOO=bar" ]
  [ -L .env ]
  [ "$(readlink .env)" = "$central_env" ]
}

@test "does nothing if not inside a git repo" {
  cd "$TMPDIR"
  run "$SCRIPT"
  assert_failure
  assert_output --partial "Error: Not a git repository"
}
