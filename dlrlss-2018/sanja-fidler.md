# Deep computer vision

- Objects: 2D box, segmentation, 3D box/segm

- Stereo, flow

- 3D scene reconstruction

- Localization

- Actions, events

- Affordances

        - Uses "where can I sit?" to motivate that affordance depends on
          semantics as well as geometry.

- Robotics to motivate vision

- Building virtual environments, and transferring to the real world.


## Segmentation

- Two types: stuff (e.g., floor, road), discrete objects (e.g., table, chair).

- Foreground vs. background

- Unsupervised segmentation: grouping pixels based on similarity (irrespective
  of classes).

- Segmenting common objects?

- Instance segmentation (assign IDs to each individual car).

- Panoptic segmentation: want semantic labels as well as IDs of objects.

- DeepLab (Semantic Image Segmentation. (Chen et al., ICLR 2015).

        - Atrous convolutions for high resolutions

        - Filter has the same number of nonzero weights

        - Use fully connected CRFs to smooth coarse results

                - Potentials: unary term, pairwise term, and higher order terms.

                - Each pixel connects to four adjacent neighbours.

                        - Too local.

                - Densely connected pixels. Gaussian smoothness dropoff on
                  potential, along with appearance smoothness (pixels of
                  different contrasts probably belong to different classes).

                        - 2011 approximate inference for densely connected
                          CRFs. Factorize distribution and iteratively update
                          (message passing scheme). Efficient Gaussian
                          filtering in high dimensional space. Can be done fast
                          (pemutohedral lattice).

- CNN + CRF. CRF as RNN, Zheng et al., 2016. Schwing and Urtasun, 2016.

        - Mean-field inference for dense CRF.


### 3D segmentation

- RGB image + depth. 2.5D.

- 2D vs. 3D. Some points that appear to be local context in 2D, can be
  determined to be far away using geometry.

- 3D point cloud: non-uniformly structured data.

        - Approaches: fusion, multi-view, 3D CNNs, point-set, lattice

- Fusion: Long et al., 2015. Eigen and Fergus, 2015.

- R-CNN with depth. Learning rich features from RGB-D images for object
  detection and segmentation. Gupta et al., ECCV'14.

        - Fine-tune from synthetic data.

        - A little bit of synthetic data helps, while too much hurts.

        - Fusion is good.

- Multiview: Multiview CNNs for 3D shape recognition. Su et al., ECCV 2015.

        - Multiview CNN for segmentation. 3D shape segmentation with projective
          CNNs. CVPR 2017.

- VoxNet: 3D CNN. Maturana and Scherer, IROS 2015.

        - Suffers from 3D discretization (high memory consumption).

- OctNet: exploits sparsity of 3D data. Riegler et al., CVPR 2017.

        - Use OctTrees from 3D graphics to represent 3D point cloud data.

        - OctTrees suffer from dereferencing problem from following pointers
          between parents and children.

        - Use bit representation of shallow OctTrees.

        - Accuracy boost from higher resolution achievable with OctTree pays
          off for pose estimation (whereas there is a ceiling for semantic
          segmentation accuracy)

- PointNet. Qi et al., CVPR 2017. Use pooling to represent a set.

        - PointNet++.

- 3D Graph NN. Qi et al., ICCV 2017.

        - Graph NNs: a bunch of nodes, each getting an input. Then there are
          edges represent dependencies between the nodes. Train the thing with
          backprop.

        - Message computation: mt a->b = Me(a,b)(h_t^a)

        - Message aggregation. Average messages from neighbours.

        - Update: h_{t + 1}^b = U(h_t^b, m_t^b)

        - Every input is a different graph, but through propagation the graph
          is the same.

        - Derivations of CNNs as a special case of graph NNs?

        - Graph NNs are potentially "more powerful" than CRFs, because CRFs act
          on the output space. Could CRFs not act on hidden states as well?

        - Mean field inference of CRFs as special case of GNNs.


### Instance Segmentation

- Bai and Urtasun, CVPR 2017. Watershed transform: use a pixel's brightness as
  its height in a basin, and draw lines to segment.

        - Requires tricks to make it work, e.g., predicting normals twoards
          object centers.

        - Discretize distance transforms into 16 bins, with bin 0 being 2
          pixels from the edge of an object.

- Mask R-CNN. RoIAlign: don't want to snap to discretized grid of features;
  bilinear interpolate instead.


### Interactive instance segmentation

- Interactive annotation models

- GrabCut

- Annotation object instances with polygon-RNN. Castrejon et al., CVPR 2017.

        - Polygon-RNN++. Acuna et al., CVPR 2018.

- Deep Exteme Cut. Maninis et al., CVPR 2018. CNN, and at some level insert
  four more channels (global context that is RGB of the crop around the extreme
  points selected by the user, as well as the points themselves + Gaussian
  blur).


## Performing tasks

- Puig et al., CVPR 2018. VirtualHome. Back to robot motivation.

        - Concept: represent activities as robot-readable programs.

        - Used scratch to get annotators to turn a description of a task
          (written by another turker) into a program.

        - Predict programs from text, and from video of the program simulation.

        - Future work: RL platform.
