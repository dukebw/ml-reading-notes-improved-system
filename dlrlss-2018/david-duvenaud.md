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


# Generative models.


## Probabilistic graphical models

- Variational EM algorithms for non-Gaussian latent variable models. Palmer et al., NIPS 2005

- Hoffman et al., NIPS 2010.

- Ghahramani and Hinton, Neural Computation 2000.

- Issue: not enough complexity (focus on exponential family models).


## Differentiable latent-variable models

- y = f_\theta(x)

- y ~ N(u = f_\theta(z), \sigma = diag(g_\theta(z))) parametrize probability
  distribution by NN.

- Four approaches: sequential models (cons: O(N), impose order where there is
  none), VAEs (cons: factorized likelihood causes blurry samples), normalized
  models (cons: need to cripple layers, therefore need many parameters?),
  implicit models (GANs) (cons: no likelihood, hard to train).

        - Sequential models: pixel RNNs. van den Oord et al. Require an order
          in images, which are inherently unordered.

        - Variational inference: optimize a distribution q_\phi(z | x) to match
          p_\theta(z | x). Optimize, for every single datapoint, q(z | x), to
          match p(z | x).

                - Adding priors isn't cool, integrating over entire hypotheses
                  is cool.

- Helmholtz machine. Dayan et al., 1996?

- Real NVP (non-volume preserving transformations). Density estimation using
  Real NVP. Dinh et al., 2016.

        - First generative model class besides GANs with decent looking image
          samples.

- Flows as Euler integrators (normalizing flows -- class of density models).

        - Normalizing the change of volume requires the determinant,
          computation of which has cost O(D^3).

        - For continuous transformations, only trace is needed (divergence?).

        - Trained models predict a vector field to turn a Gaussian into another
          distribution.

        - Use GANs as a recognition network in a VAE: Lars et al., 2017.
          Mohamed and Lakshminarayanan, 2016. Tran et al., 2017.

- Boltzmann machines.

- Composing graphical models. Johnson et al., NIPS 2016.

- Sparse probabilistic projects. Archambeau and Bach, 2008.

- Wiltschko, Johnson, et al., Neuron 2015. Mouse example.

        - Sequence of discrete latent variables (with upper bound 50),
          transformed into 100-dim.  continuous variables x.

- Generating sentences from a continuous space. Bowman et al. Text
  autoencoders.


## Future work

- Training GANs to generate text.

- Training VAEs with discrete latent variables.

- Training agents to communicate with each other using words.

        - RL NTMs. Zaremba and Sutskever, 2015.

- Training agents or programs to decide which discrete actions to take.

- Training generative models of structures objects of large size (e.g.,
  programs, graphs, large texts, etc.)

- Why are things easy? Gradient descent and reverse-mode AD.

        - If your objective function is differentiable, rather than get 1 bit
          of information from it (e.g., good vs. bad), you get D many bits of
          information (the derivative with respect to each parameter).

- Neural sketch learning.

- Killoran et al., 2017.

- Attend, infer, repeat. Eslami et al.

- Generating long action-conditional video.

- Modeling uncertainty in the generative process.

- Coherent multiscale models.

        - Expensive to generate in large scale models.

- Data-efficient model-based RL.

        - "Planning by imagining things in your head". Generative models can't
          look far enough ahead to be used for planning.

- Utility framework separating modeling from decision making.

- Composable language of models from simple components.

- Approximate optimal thing (don't reinvent Bayes' rule).
