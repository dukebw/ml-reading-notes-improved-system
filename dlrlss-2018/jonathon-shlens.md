# Convnets


1. Normalization.

        - E.g., batch norm, layer norm, instance norm, normalizing the
          normalizers, group normalization (Wu and He, 2018).

        - Group norm: normalize across distinct subsets of channels
          (generalizes layer norm, which has one group).

        - How does batch norm help optimization? (Santurkar et al., 2018).

2. More parameters.

        - Learning transferable architectures.

        - Convolutional object detectors, 2018

3. Transfer learning.


## Interpreting features

- First layer neurons form a Gabor function basis.

- AlexNet paper: one GPU learned Gabor filters, the other learned a bunch of
  colour differentiating filters. Why?

- Nonlinearities distort and warp feature space (Olah, 2014).

- Marr's level 2 and 3 features.

- Understanding deep image representations by inverting them.
  (Mahendran and Vedaldi, 2014).


## Opportunities

- Image quality assesment. (Z Wang et al., 2003).

- MSE: Love it or leave it? (Z Wang and A Bovik, 2009).

- Why do deep convnets generalize so poorly to small image transformations?
  (Azulay and Weiss, 2018).

- Adversarial stuff
