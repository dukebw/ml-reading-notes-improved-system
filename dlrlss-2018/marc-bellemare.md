# Deep RL

- ALE: diverse, interesting, and independent.

- RL vulnerable to environment overfitting. Whiteson et al., 2011.

- ALE: tune hyperparameters on five games, and test on the remaining ~50 games,
  in order to capture generalization scores.

- Independent: designed by people, for people, rather than with a specific
  research agenda.

- 2010-2013: basic features, RAM, LSH on pixels, and DISCO: object detection.

- Ben Recht's performance profiles an improvement on score distribution.

- Median (rather than mean) scores better performance measure for Atari games.

- Persistent algorithms. Bellemare et al., 2015.

        - Attributes DQN to significant improvements.

        - Stack four frames to overcome some of the partial observability in
          Atari games.

- LSTM layer.

- Bootstrap Q-functions. Osband et al., 2016.

- Dueling networks. Wang et al., 2016

- Noisy networks. Fortunato et al., 2017.

- Prioritized replay. Schaul et al., 2016. Train on the samples with high TD
  error.

- Importance sampling. Gruslys et al., 2018.

- Off-policy corrections. Gelada et al., in prep.

- Double Q-learning. van Hasselt et al., 2015.

- Advantage learning. Bellemare et al., 2015.

- Q(\lambda). Harutyunyan et al., 2016.

- Retrace. Munos et al., 2016.

- Distributional methods. Bellemare et al., 2017.

- Dabney et al., 2018.

- Distributional RL. E.g., park place: E[R(x)] = 1/36*(-2000) + 35/36*200 > 0

        - Tree of possible outcomes based on a roll of the dice.

        - Sequence of rewards: Bellman Equation.

        - When we play out a game, we play out one specific trajectory. Look at
          each playout as an instantiation of a random variable
          Z^\pi(x) = \sum_i R(x_i).

        - Bellman equation: E[Z^\pi(x)] = E[R(x)] + \gamma E[Z^\pi(X')]

        - Distributional method: remove the expectation signs:
          Z^\pi(x) = R(x) + \gamma Z^\pi(X')

                - Distribution of Z^\pi(x) is the same as the sum of the other
                  random variables.

        - Novelty: looking at the whole distribution instead of just a few of
          the moments (Bellman, 1957, Sobel, 1982, etc.).

        1. Sample a transition.

        2. Compute sample backup.

        3. Project onto approximate support.

        4. Update towards projection, i.e., take a KL-minimizing step.

- Bellshaped curve is a result of having a histogram, and repeatedly applying a
  _ factor: called dispersion.

- More distributional stuff:

        - Quantile regression. Dabney et al., 2017.

        - Implicit quantile networks. Dabney et al., 2018.

        - Distributional actor-critic. Barth-maron et al., 2018.

        - Generative quantile networks. Ostrovski et al., 2018.

        - The rainbow agent, Hees et al., 2018.

- Exploration:

        - Exploration bonus (Strehl and Littman, 2008): Add \beta / N(x, a) to
          reward signal.

        - Most observations in ALE experienced once. Blundell et al., 2016. So,
          can't count them.

        - Start with generative model. (Density model, e.g., pixelCNN). Assume:
                1. That higher density correlates with seeing something more
                   often.

                2. Density model? correlates to model quality.

        - \rho_n(x) = \hat{N}_n(x) / \hat{n}

        - \pho'_n(x): same but add one to each count.

        - Solve to get a notion of the count. Bellemare et al., 2016.

        - Why not just use loglikelihood? If you use likelihood, it will favour
          going back to places that are very rare.

        - CTS model. Autoregressive based on variable-order Markov predictor.

        - Mixed Monte Carlo for faster credit assignment.

- Challenge domains: where are we at now with the ALE and deep RL?

        - Agent performance negatively correlates with release date of Atari
          game.


## Questions

- Tradeoff with exploration? Best you can do to manage the tradeoff is some
  kind of regret bound.

- Learning distributions: no advantage for tabular or linear approximations,
  over just predicting the mean expected cumulative reward.
