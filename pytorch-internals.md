# PyTorch Internals


## Build system

Uses `setup.py` from Python standard library `distutils`. PyTorch Python files
are installed by passing `build_py` in the `cmdclass` parameter to `setup()`.
Each class passed in `cmdclass` to `setup()` is instantiated and called instead
of the default class of the same command name.

All Python packages are installed except for `tools` and `tools.*`, by passing
`packages = find_packages(exclude=('tools', 'tools.*',))` to `setup()`. The
Python packages installed, then, are all under the `torch` directory.

The `ext_modules` argument passed to `setup()` causes `build_ext` to be called
from the `build` command to `setup.py`.

Two cwrap files are processed by `build_ext`:
torch/csrc/generic/TensorMethods.cwrap, and torch/csrc/cudnn/cuDNN.cwrap. Each
is passed a set of plugins, which call `plugin.initialize()`.

The `*.cwrap` files are each read and declarations are wrapped by calling
`wrap_declarations()`. Declarations are pyyaml delimited by `[[` and `]]`. In
the `wrap_declarations()` call, each plugin calls
`plugin.process_declarations()` and then `plugin.process_wrapper()`.

Then, each plugin calls `plugin.process_full_file` on the wrapped declarations.
The result is written to TensorMethods.cpp and cudNN.cpp.

THPPlugin wraps each declaration in each cwrap file with `#if` macros depending
on the supported backends (currently CPU and CUDA). Other pyyaml statements
control wrapping with e.g. `IS_DISTRIBUTED` and `TH_REAL_IS_HALF`.

THPPlugin generates other code based on the yaml statements, including
converting argument `cname` options to be wrapped in THTensor_() or
THSTensor_() (if sparse).

References: http://pytorch.org/2017/05/11/Internals.html,
            http://pytorch.org/2017/06/27/Internals2.html


## How and where backprop is implemented


## A trip through the internals of training an MLP
