# Cross-compile for Linux arm7hf

This repo contains Dockerfiles to cross-compile for the arm7hf architecture, which is used by small 32-bit platforms like the Raspberry Pi Zero 2W.

I've found arm7hf is a fairly uncommon architecture and most projects do not target releases for it.
This repo is a cross-compiler toolkit to help bridge the gap so more projects can run on arm7hf.

**Why?** The Raspberry Pi Zero 2W is a tiny but very powerful platform based on arm7hf.
Many useful tools can run on the Pi Zero - but those tools many not be available for arm7hf.
Moreover, since it is such a tiny computer, some software is too complex to even compile on the Pi Zero.
Cross-compiling enables a more powerful computer to build software to run on a different architecture.

Using this repo, I've successfully built several projects for Raspberry Pi Zero 2W with a Macbook.
In one case, a 6-hour build that failed on Pi Zero took just 3 minutes on a laptop - and it actually worked, too.

## Usage

### Rust (with Cargo)

To cross-compile a Rust project with Cargo:

1. clone this repo
2. run the dockerfile (chmod u+x if neceessary)
3. change path to the rust project
4. run the docker image to build the project
5. the build result is in `target/armv7-unknown-linux-gnueabihf/release`

```bash
git clone https://github.com/iandennismiller/cross-compile-linux-arm7hf
cd cross-compile-linux-arm7hf
./cross-compile-rust-arm7hf.dockerfile
cd MY_RUST_PROJECT
docker run --rm -v $PWD:/app local/cross-compile-rust-armv7hf
ls target/armv7-unknown-linux-gnueabihf/release
```
