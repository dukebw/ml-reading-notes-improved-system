# PyTorch Internals

## Build system

Uses `setup.py` from Python standard library `distutils`. PyTorch Python files
are installed using `build_py`. All Python packages are installed except for
`tools` and `tools.*`, by passing
`packages = find_packages(exclude=('tools', 'tools.*',))` to `setup()`.

The Python packages installed, then, are all under the `torch` directory.
