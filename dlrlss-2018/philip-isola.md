# Generative models 2 (applications)


1. Data prediction.

2. Domain mapping.

3. Representation learning.

4. Model-based intelligence.

- Conditional generative model: high dimensional data in, high dimensional data
  out.

- Structured prediction: object labeling, edge detection, text-to-photo, future
  frame prediction.

- Challenges in data prediction:

        1. Output is high-dimensional, structured objects.

        2. Uncertainty in the mapping, many possible outputs.

- L2 reconstruction models pixel outputs independently, while a GAN with
  sufficient capacity samples from the full joint configuration over all
  pixels.

- Shrinking capacity: patch discriminator. Li and Wand, 2016.
  Shrivastava et al., 2017. Isola et al., 2017.

- Shrinking capacity: model misspecification. Theis et al., 2016. KLD vs. JSD.

        - Mode covering vs. mode seeking: Larsen et al., 2016.

- Conditional VAEs. Sohn et al., NIPS 2015.

- Toy problem (future frame prediction). Babaeizadeh et al., ICLR 2018.

        - Walker et al., ECCV 2016. Xue et al., NIPS 2016.

- InfoGAN. Chen et al., 2016.

- BiCycleGAN. Zhu et al., NIPS 2017.

- Cycle-consistent adversarial networks. Zhu et al., 2017.

- Simplicity hypothesis. Galanti et al., 2018.

- Unsupervised image-to-image networks. Liu et al., 2017.

- Domain adaptation. Tzeng et al., 2014.

- Syn2real: Richter et al., 2016. Krahenbuhl et al., 2018.

        - Map simulated GTA data to real data. Apply cycleGAN.

        - Hoffman et al., 2018.

- MRI -> CT scans. Quan et al. arxiv:1709.00753. Cardiac MR images from CT.
  Chartsias et al., 2017.

- Progressive GAN. Karras et al., 2018.

- Representation learning with contrastive predictive coding. Van den Oord et al., 2018.

- World Models. Ha and Schmidhuber 2018.

- Incentivizing exploration in RL with deep predictive models. Stadie et al., 2015.
