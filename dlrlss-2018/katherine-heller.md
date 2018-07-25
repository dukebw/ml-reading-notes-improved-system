# Machine Learning


## Marginal likelihoods


- E.g., compare hypothesis that data came from one Gaussian cluster vs. two by
  integrating over all model parameters.

        - P(D | m) = integral P(D | theta, m) P(theta | m) dtheta

                - The probability that all data points in D were generated from
                  the same model with unknown parameters theta.


## Bayesian Occam's Razor


- Models that are too simple are unlikely to generate the dataset.

- Models that are too complex can generate many possible datasets.


## Nonparametric Bayesian models


- Provide flexible priors to infer the number of clusters.

- "Infinite set of parameters": amount of information captured grows with data.


## Regression models


- GLMs, logistic regression

- Example: Donner party (from Ramsey, Schafer (2002). The Statistical Sleuth).

        - Party of ~80 people, 40 died. Dataset is binary classification with
          male/female factor variable, and age.

        - GLMs: y = w0 + w1*x.

                - p = g^-1(y). g link function.

                - use logit(p) = log(p/(1 - p))


# Questions

- Comment on complementary strengths of Bayesian methods and DNNs.

- Marginalizing over a search space of architectures and their parameters.

- Recommended Bayesian data analysis textbook.
