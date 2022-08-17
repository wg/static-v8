#!/bin/bash

set -eu

git submodule update --init --recursive

TARGETS+=("aarch64-unknown-linux-musl")
TARGETS+=("armv7-unknown-linux-musleabihf")
TARGETS+=("x86_64-unknown-linux-musl")

NPROC=$(($(getconf _NPROCESSORS_ONLN) - 1))

export MAKEFLAGS="-j ${NPROC}"
export NINJAFLAGS="-j ${NPROC}"

RUST_TOOLCHAIN=$(cat rusty_v8/rust-toolchain)

for TARGET in "${TARGETS[@]}"; do
    rustup "+${RUST_TOOLCHAIN}" target add "${TARGET}"

    build/build-tools   "${TARGET}"

    build/build-v8      "${TARGET}" debug
    build/build-v8      "${TARGET}" release

    build/copy-archives "${TARGET}"
done
