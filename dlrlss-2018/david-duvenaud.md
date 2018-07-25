# Autodiff


- Problems: loops, branching, recursion, closures, data structures

- HIPS/autograd

        - differentiates native Python code (including most of Numpy and Scipy)

        - Handles problems above.

- Example

        - Parameters: list of (weight, bias) tuples.

        ```python
        import autograd.numpy as np

        """Make Numpy NN."""
        grad_function = grad(loglik)
        ```

                - Returns a list of tuples of gradients

        - Compiling machine learning programs via high-level tracing. Frostig
          et al. SysML 2018.

        - Package jax

        - Distributed software development style.

- F : R^n -> R

        - F is an NN.

- y = D(c), c = C(b), b = B(a), a = A(x)

- F'(x) dy/dx (Jacobian)

        - F'(x) = dy/dc dc/db db/da da/dx

        - dy/dc is vector valued, other Jacobians are matrices

        - In which order should the matrices be multiplied?

        - E.g., forward accumulation (right associative)

        - E.g., reverse accumulation (left associative)

        - Forward accumulation <-> Jacobian-vector products (building the
          Jacobian one column at a time) (F'(x) v). Use v = dx/dx.

        - Reverse accumulation <-> vector-Jacobian products. Build Jacobian one
          row at a time. Use v = dy/dy.


## Non-chain composition

        - Fan-in: y = F(x1, x2)

- Principles and Techniques of Algorithmic Diff'n, 2nd edition (Griewank and Walther, SIAM, 2008)

- Reverse mode AD, Pearlmutter and Suskind (SIAM, 2008)

- Implementation: monitor function execution at runtime.


# Autodiff ingredients

1. Trace the composition of primitive functions.

        - Autograd defines a wrapper around numpy that keeps track of inputs
          and outputs for each function that is called.

2. Define a vector-Jacobian product (VJP) operator for each primitive.

        - Folk theorem: Writing down the Jacobian is expensive, but computing
          VJP is approximately as expensive as the original function
          evaluation.

        - E.g., grad_sort reverses the permutation done on the forward pass
          (transpose the permutation matrix).

- User-defined primitives: define your own gradient with the `@primitive`
  decorator.

3. Compose VJPs backward (chain rule) -- topological sort.

        - Autograd gets higher-order differentiation for free, since autograd
          itself is written in numpy.


# Advanced Autodiff

- Jamie Townsend

- Getting forward from reverse automatically.

- Generalized Gauss-Newtown matrix vector product

- Martens and Grosse, ICML 2015. Pearlmutter, Neural Computation 1994. Martens

- Differentiate through the entire training procedure.

        - Snoek, Larochelle and Adams, Practical Bayes Opt, NIPS 2012

        - Golovin et al., Google Vizier: A Service for Black-Box Optimization, SIGKDD 2017.

        - Bengio, Gradient-based optimization.

        - One more

- The implicit function theorem:

- Fixed point iteration has a closed form gradient in terms of itself.

        - Johnson et al., Composing Graphical Models with NNs, NIPS 2016.

        - Amos and Kolter, Optnet, ICML 2017.


# Bayesian inference

- Stochastic variational inference

- Weight uncertainty in NNs.

- Autodiff: Variational inference, JMLR 2017.


# Questions

- Jax: hashes parts of computation graphs, to keep track of whether they get
  called multiple times.

- If you do backprop twice, is it the same as computing the Laplacian? You
  might expect to get the Hessian if you do backprop twice. Didn't answer
  directly? Talked about autograd being able to compute Hessian-vector products
  (but not practical).
