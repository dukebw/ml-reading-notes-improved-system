# Bayesian NNs

- Bayesian or frequentist xkcd

- Why Bayesian deep learning?

        - Powerful framework for model construction and understanding
          generalization.

        - Uncertainty representation (crucial for decision making).

        - Better point estimates.

        - Successful at the "second wave of NNs". Neal, 1998.

        - NNs less mysterious through probability theory.

- Why not Bayesian deep learning?

        - Can be computationally intractable.

        - Can involve "a lot of moving parts".

- Basic regression problem.

        - Probabilistic approach: y(x) = f(x, w) + \eps(x). Take
          \eps(x) = N(0, \sigma^2)

                - Take log likelihood, and minimize (e.g., add prior as
                  regularizer). Still not Bayesian, since Bayesians want to do
                  marginalization (of the parameters).

- Bayesian inference: Bayes rule, sum rule, and product rule.

- Example: bent coin with \lambda probability of tails. Observe two tails.
  Predict probability of next flip being tails. Use Beta prior.

- Take a and b as pseuodo-observations, and treat Bayesian inference as an
  online algorithm, where at each step the prior is the previous timestep's
  posterior.

- A function space view: Gaussian processes. Phd thesis, Neal, 1996. Neural
  nets with infinite hidden units are Gaussian processes!

        - GPs: nonparametric regression model.

        - Easier to represent belief in function space (e.g., 95% confidence
          interval).

- Joke: everything is a GP with a special type of kernel function.

- Consider: f(x) = a_0 + a_1 x, a_0, a_1 ~ N(0, 1).

- RBF kernels. GPs with an RBF kernel are universal approximators.

- Learning and predictions with GPs:

        1. Learning: optimize marginal likelihood.

        2. Inference: conditioned on kernel hyperparameters \theta, form the
           predictive distribution for test inputs X_\star.

        - Have to compute a log determinant, which is O(n^3) naively. Can only
          do this for about a thousand samples, max.

- Marginal likelihood is important for model selection, e.g., for bias-variance
  tradeoff.

- "How can GPs possibly replace NNs? Have we thrown the baby out with the
  bathwater?" MacKay, 1998.

        - Develop more expressive kernel functions using NNs. NNs provide
          powerful inductive biases (e.g., adaptive basis functions, CNNs).

        - Deep kernel learning. Wilson et al., AISTATS, 2016. Train NN + GP
          jointly with maximizing marginal likelihood?

        - https://github.com/cornellius-gp/gpytorch

        - Kernel approximation, admitting fast matrix vector multiplications.
          Wilson and Nickisch, 2015.

        - Run GPs on millions of points in seconds, sintead of thousands of
          points in hours.

        - Tensor trained (tensorizing) neural networks (Russian groups).

- Learning flexible non-Euclidean similarity metrics.

- Learning scalable deep kernels with recurrent structure.
  Al-Shedivat et al., JMLR 2017.

- Bayesian GAN. Wilson and Saatchi, NIPS 2017.

        - Sampling posterior generators.

- Foundational skill: scientific computing (advice: take a course).

- Wide optima generalize better. Keskar et al., 2017.

        - Bayesian marginalization gives very different point predictions
          compared to optimization.

- Loss surfaces in deep learning:

        1. Loss surfaces, mode connectivity, and fast ensembling of DNNs.

                - Found that optima in high dimensions are connected by Bezier
                  curves.

                - Use to derive new types of loss functions that lead to broad
                  optima.

        2. Averaging weights leads to wider optima and better generalization.

                - Stochastic weight averaging generalizes better, due to shift
                  in loss surface between train and test.

                - Have to move further away to increase test error with the SWA
                  solution.

                - SGD with constant LR proposals are on the surface of a
                  hypersphere. Averaging lets us go inside the sphere to a
                  point of higher density.

                        - Try at home: sample from high dimensional Gaussian
                          and take norm (on surphace of hypersphere, as opposed
                          to low-dim. Gaussian samples).

        3. Something about consistency based semisupervised learning.

- https://people.orie.cornell.edu/andrew/code

- Stochastic gradient Hamiltonian Monte Carlo.

- Different local optima may correspond to multiple modes, each with a unique
  hidden representation.

- Import ideas from GANs when thinking of inference methods to replace
  variational (e.g., using alpha divergences).

- Function space approach.

- Inspiration from Bayesian approach.


## Questions

- Contradiction: flat vs. sharp minima, when they are the same in function space.

        - Function space definition of the width?

        - Empirically: sample random directions and see how the error is
          increasing in those directions.

- Decaying learning rate vs. averaging.

        - Convex optimization: benefits of averaging come in the form of
          improved convergence (no concept of generalization).

        - Here: averaging gives improved generalization, still working on
          improved convergence.

        - Making the learning rate very small: could get stuck in an
          undesirable solution.

        - Something else: take higher order moments of SGD trajectories to get
          predictive uncertainties.

- Bayesian GAN: given a finite amount of information, you have uncertainty
  about the generator.

        - Use discriminator as a likelihood to update posterior over
          generators.

- Bayes opt in high dimensions?

        - 6 years ago: Bayes opt to achieve SOTA on CIFAR-10.

        - Bayes opt works well for A/B testing.

        - People haven't been using Bayes opt for computer vision benchmarks.

                - Community has already established good hyperparameters on
                  benchmark datasets.

                - All big companies use Bayes opt on new problems.

                - Issues: scalability, kernel selection. Kernel learning is a
                  lot like architecture learning.
