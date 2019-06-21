# Synthesis


## Unsupervised domain mapping (geometric consistency?)

- Cycle consistency constraint.

- DistanceGAN.


## DeepVoxels

- Given a training set of pictures of an object and camera poses.

- Use camera parameters to project images from 2d to 3d voxel grid.
  Then use an unseen (training) view as a loss for rendering from 3d voxel grid
  projected to 2d.

- Explicit occlusion reasoning.


## Inverse path tracing for joint material and lighting estimation


## Visual centrifuge: model-free video representation

- Layer composition (e.g., reflection, occlusion).

- Decompose a video into its composing layers.

- Train on average of two randomly paired Kinetics-600 videos.

- Permutation invariant loss.

- Edge emphasis loss.


## Domain adaptation (Luc van Gool)
