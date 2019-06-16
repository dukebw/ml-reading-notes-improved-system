# Towards Relightable Volumetric Human Performance Capture


## Display technology

- laser produced 3d display in the air

- rendering for an interactive 360 light field display

- Star wars example

- Vuzix, Intel glasses displays.


## Volumetric capture

- How to capture people in as much fidelity as possible, to project them into a
  remote space.

- Microsoft holoportation.
  Multi-view cameras?

- Breakthrough 1: 3d depth cameras. IR stereo/RGB/structured light cameras.

        - Kinect not good enough!

- Breakthrough 2: temporal stability.

        - Mesh tracking and dynamically fusing data over time.

        - Denoising.

- Usage:

        - Living memories.

        - Remote meetings.

        - Performances.

- PerceptiveIO

        - Acquired by google -> augmented perception.

- Challenge: capturing humans in motion.

- CMOS sensor revolution:

        - Slo-mo 3D depth camera.

                - Combine multiple 3D sensors together with a structured light
                  illuminator.

                - 180 FPS: more robust quality, fewer iterations of nonlinear
                  optimization solve.

- Augmented perception:

        - Dense SfM from single moving RGB camera.

        - Holodeck.

        - Building light stages and combining them with light cameras.


## High quality depth sensors

- Passive depth: dual camera.
  Estimate depth by triangulation via matching.

        - Moving camera.

        - Pros: available sensors, calibration.

        - Cons: textureless scenes, dynamic scenes, stereo fattening stereo
          quadratic error.

- Time of flight sensors.
  Phase change.

        - Pros: small form factor, very low compute, good quality edges.

        - Cons: hard to distinguish direct bounces from indirect bounces
          (multipath).
          bias in low SNR regions, motion artifacts, hardware complexity.

- Temporal structured light.

        - Pros: Precise depth measurements, low compute (lookup).

        - Cons: motion artifacts, hardware complexity, short range,
          multi-sensor interference.

- Spatial structured light.

        - Project random dot pattern on scene and observe scene with camera.

        - Pros: Single camera, less stereo fattening.

        - Cons: calibration, non-trivial emitter, degradation outdoors,
          multi-sensor interference, stereo quadratic error (resolution &
          baseline).

- Active stereo.

- Design constraints:

        - Commodity hardware, framerate, etc.

        - Higher fps, lower exposure improves data for tracking.

- Active stereo setup for volumetric capture, since it can run at high speed
  (200Hz+ depth @ 720p, and can harness mobile phone CMOS sensors).

- Proposed depth sensor:

        - 1000-4000Hz.

        - 1MPixel.

        1mm error.

- Choose camera, lens and illuminator.

- Choosing your baseline (e.g., close-up hand tracking vs. full-body
  reconstruction system).

- The need 4 speed in realtime dense visual tracking, Siggraph asia 2018.

- Motion2fusion: realtime volumetric performance capture, Siggraph Asia 2017.

- Designing your own structure light illuminator.

- Camera sensor: ximea MX124

- Filter and lens: off-the-shelf Kowa lens and tight bandpass filter centered
  at 860nm.

- IR illuminator.

- High resolution IR pattern.

- Want to marry active stereo depth stensors with light stage for reflectance
  field estimation and photometric stereo.


## Depth estimation via triangulation: basics, challenges and algorithms

- Depth from stereo.

- Most common technology in human capture systems: multiple stereo pods.

- Stereo perception -> 3D reconstruction.

- Computing disparity:

        - Restrict search to matching point on epipolar line.

        - Rectify images and search on horizontal scanlines.

- A taxonomy and evaluation of dense two-frame stereo correspondence
  algorithms, Scharstein, Szeliski.

- Cost volume filtering.

        - A 3d grid where for every pixel we compute the matching cost for
          every pixel in the other image.

        - Fast cost-volume filtering for visual correspondence and beyond,
          Rhemann.

        - Convolution then find min/max cost.

        - GCNet (Kendall, ICCV 2017), StereoNet (Khamis, ECCV 2018).

- Edge fattening for large matching window size.

        - Segment according to colour of cenetre pixel in patch (adaptive
          support weights).

        - Useful for loss function.

- Depth from multi-view stereo:

        1. Select window reference image.

        2. Project into neighbouring images along epipolar line.

        3. Find minimum (maximum) matching cost across neighbouring images.

        - Furukawa and Hernandez.

- Pixelwise view selection for unstructured multi-view stereo, Shonberger.

- Massively parallel multiview stereopsis by surface normal diffusion

- Accurate, dense and robust multi-view stereo.

- High-quality streamable free-viewpoint video, Collet.

- Dense and accurate depth maps (untextured regions, specular surfaces).

- Extremely realistic reconstruction (fine details).

- Relightability.

- Active stereo: high resolution IR pattern.

- Input -> mesh:

        - Input: colour and IR images.

        - System: 58 RGB cameras and 32 IR cameras.

        - Run MVS algorithms on IR and RGB independently.

                - View selection, matching cost calculation, and depth
                  estimation.

        - View selection: neighbour criteria.

        - Matching cost: first layer (conv1) VGG features on colour, ZNCC (zero
          normalized cross correlation) on IR with 7x7 matching window.

        - Depth optimization: patchmatch framework (Bleyer, 2011).


## Depth estimation in the age of deep learning

- Input modality:

        - Single RGB image.

        - Single RGB + (low quality/sparse) depth.

        - Binocular stereo.

        - Multi-view.

- Output representation:

        - Depth map:

                - Absolute depth map (e.g., millimeters).

                - Disparity map.

                        - Close range.

        - Surface normal.

        - Derivative.

        - Mesh.

                - MeshDepth: disconnected mesh-based deep depth prediction.

- Loss functions:

        - Regression for each pixel.

        - Handle depth confience (missing depth) and truncation/saturation.

        - Huber loss.

        - Charbonnier loss (saturate faster to handle noise in ground truth).

        - View synthesis loss.

                - ActiveStereoNet: End-to-end self-supervised learning for
                  active stereo systems, Zhang.

        - Occlusion: use left-right/right-left loopback error to ignore error
          for disocclusions.

        - Smoothness loss (disparity should be smooth).

        - SSIM patch feature for view synthesis loss.

        - Adaptive support weight.

- How to use the depth?

        - DeepLIDAR: Deep surface normal guided..., Qiu.

        - Sparsity invariant CNNs, Living.

        - Treat sparse depth as an image together with a binary availability
          mask.

        - Sparse invariant convolution.

        - Estimate surface normals first then combine with sensor depth to get
          completed depth.

- Input: binocular stereo.

        - Estimate disparity (don't use groundtruth depth).

        - Concatenation, siamese network.

- Input: stereo

        - Siamese feature extractor

        - Cost volume (i.e., correlation layer for 2D flow).

        - Soft-argmin.

        - Refinement.


## Depth estimation in the age of deep learning: multi-view stereo

- Occupancy grids, depth maps from images.

- 3D-R2N2: A unified approach for single and multi-view 3D object
  reconstruction, Choy.

- Learning a multi-view stereo machine, Kar.

        - Built-in geometry.

- MVSNet: Depth inference for unstructured multi-view stereo, Yao.

- Learning independent object motion from unlabeled stereoscopic videos, Cao.


## Multiview Keypoints

- Reduce the number of keyframes.

- Start: 2d keypoints prediction.

- Towards accurate multi-person pose estimation in the wild, papandreou.

- Triangulation algorithms.

        - Weighted by confidence.

        - Robust losses.

        - Alternative to robust losses: RANSAC.

- Multiview set of network 2d predictions for hand.

        - Robust triangulation: middle fingertip keypoint.

        - Kinematic model: include priors on joints of hand model.


## Detect, reconstruct, track and parametrize humans

- Sean Fanello.

- Kaiwen Guo, Mingsong Dou.

- Steps:

        - Depth sensors and multiview stereo.

        - Performer segmentation.

        - Mesh reconstruction.

        - Mesh tracking.

        - Mesh parametrization.

        - Texturing.

        - Reflectance maps computation.

        - (Compress textures and meshes, to put on mobile phone).

- Recap - depth sensors:

        - 12MP depth sensor with very dense pattern.

- Input -> mesh.

- Performer segmentation:

        - Environment reconstruction not part of performance.

        - Computation.

        - Salient regions.

        - Remove outliers (e.g., floaters).

        - Fg/bg segmentation enables ``shapes from silhouettes'' to recover
          thin structures.
          Hair?

- State of the art (Collet, 2015): green screen, lighting condition fixed.

- Proposed segmentation method: deep learning.

        - Single camera segmentation may suffer from issues: FOV of camera,
          exposure time, etc.

        - Idea: leverage depth to reproject segmentation to all views.

                - Outliers.

                - Lost quality around the edges.

                - Refine with dense CRF model to overcome these.

- The Dream:

        - Multiview segmentation with training data, and architecture for
          multiview consistency.

        - Alpha matting for precise edges.

        - Etc.

- Want a mesh since it is a common 3D representation, and is used in 3D
  modeling.

- Mesh reconstruction:

        - Outliers removal.

        - Enforce smoothness.

                - Take a point `p_i`.

                - Take it nearest neighbours.

                - Fit a local plane.

                - Replace `p_i` with its projection to the plane.

        - Surface reconstruction.

        - Benchmark for surface reconstruction, berger.

        - Surface reconstruction from unorganized points, Hoppe. (Best for
          overview, PhD thesis).

        - Partition...

- Poisson reconstruction.

        - Pros: watertight mesh, hole filling, efficiency.

        - Cons: may oversmooth, may fill the wrong holes.

        - Input: set of oriented points.

        - Indicator function: 1 inside your set and 0 outside.

        - Poisson surface reconstruction, Kazhdan.

        - Screened poisson surface reconstruction, Kazhdan.

        - Marching cubes algorithm.

        - Octree depth trade-offs.

- Mesh -> tracked mesh.

- Surface simplification using quadric error metric, Garland.

- Tracking:

        - Correspondences over time.

        - Shared topology and paremetrization (simplifies compression problem).

        - Simplifies rigging and animations.

        - Non-rigid tracking alignment:

                - Subsample reference model -> becomes deformation graph.

                - Try to align deformation graph to your data.

                - Embedded deformation for shape manipulation, Sumner.

- Start from rigid case: single moving camera pose.

- Deformation model:

        - Deformation graph.

        - Skinning weights: weight each point as a linear combination of its
          neighbours.

                - Geodesic distance for offline applications.

        - Iterate steps 1 and 2:

                1. Find correspondences.

                2. Minimize energy.

- Fusion4d: realtime performance capture of challenging scenes, Dou.

        - Visual hull, segmentation.

- Colour consistency constraint.

- Twinpod/twin fusion method.

        - Twinfusion, Guo.

- Topology changes.

        - When is it time to change your keyframes?

- High-quality streamable free-viewpoint video, Collet.

- Fusion4D, Motion2Fusion, Dou.

- Tracking as a labeling problem.

        - Model tracking problem with an MRF.

- Open questions:

        - Objective function?

        - Mesh representation?

        - How to compute skinning weights?

        - Optimal keyframe selection that doesn't rely on brute force?

- Mesh parametrization:

        - Texture mapping progressive meshes, Sander.

- UVAtlas, open source, Microsoft.

        1. Spectral clustering to divide the mesh into charts.

        2. Use spectral analysis to minimize the geodesic distance distortion.

        3. Perform a few iterations of the nonlinear optimization described in
           (Sander, 2001).
