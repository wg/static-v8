# static-v8 - build static v8

These scripts build static v8 and rusty_v8 libraries linked against
musl libc for aarch64, armv7, and x86-64.

[build.sh](build.sh) first builds cross compilers using
[musl-cross-make](https://github.com/richfelker/musl-cross-make)
and then builds v8 and rusty_v8 via [build-v8](build/build-v8).

## prerequisites (ubuntu package names)

    apt install bzip2 ccache clang git make ninja-build python-is-python3
    apt install qemu-user-static

    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
