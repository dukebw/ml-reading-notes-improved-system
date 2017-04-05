# CS 231n Lectures

## Lecture 1 - History of Computer Vision, course overview.

- Massive amount of image and video data on the web is the "Dark Matter" of
  computer vision. Companies like YouTube and Google want to classify this
  video data to improve search.

- Context in understanding the history of computer vision is integral in
  contributing to further developments. One needs to understand the history in
  order to understand the problem space.

- 540 million years ago speciation began. Andrew Parker: theorizes that
  speciation (explosion in species) is due to development of eyes. This is when
  vision began.

- Renaissance: Leonardo Da Vinci (16th century) invented "Camera Obscura".
  Beginning of human engineering of vision.

- How does vision work in biological brain? Hubel and Wiesel, 1959. Used awake
  but anesthetized cats. Electrical signal from primary visual cortex
  (beginning of visual process in brain).
    - Check if neurons fire when cats see something. E.g. put slide of a
      fish, showed it to the cat, then put another slide. Noticed that the
      movement of the slide when changing slides excited the cat's neuron.
      Noticed that the moving edge of the slide drove the neuron.
    - Neurons in primary visual cortex arranged in columns that "like" simple
      edges.
        - Beginning of visual processing is recognition of simple
          structures.
    - First stage of visual processing is in back of brain, furthest from
      the eye. Takes up 50% of the real estate in the brain.

- Larry Roberts "Block World" 1963 dissertation began the field of computer
  vision.
    - Conjectured that edges define the shape of objects that humans
      recognize.

- Summer of 1966: The Summer Vision Project. Attempt to solve computer vision
  over a summer. AI Group, MIT.

- John McCarthy founded AI lab at Stanford.

- David Marr, also at MIT. Wrote an influential book called "Vision". Gave us
  the insight that vision is hierarchical, based on neurological evidence.
    - Input image -> Edge image (primal sketch) -> 2 and 1/2-D sketch ->
      3-D model of the world.
        - "Stages of Visual Representation"

- Generalized Cylinder (Brooks and Binford, 1979).
    - World made up of simple shapes, and what we see is combinations of
      those shapes from different perspectives.

- Pictorial Structure (Fischler and Elschlager, 1973).
    - Probabilistic, compared to Brooks.
    - Simple parts connected by springs, allowing for deformation.

- David Lowe, 1987. Recognizing shaving razors using edges and simple shapes
  formed by the edges.

- Normalized Cut (Shi and Malik) 1997. "Perceptual grouping".

- "Real-Time Face Detection" Viola and Jones, 2001. First successful high level
  visual algorithm used by a consumer product.
    - Also the first vision work deployed on a computer and able to run in
      real time.
    - Shift from reconstructing 3-D model to recognition. This is bringing
      computer vision back to AI.

- "SIFT and Object Recognition", David Lowe, 1999.
    - About learning important features of an object. Allows recognition of
      an object in a cluttered scene.
    - Deep learning networks became more convincing partly because the
      features that neural nets learn are similar to the features invented
      by engineers.
    - Intellectual foundation for us to realize how useful deep learning
      features are.

- "Spatial Pyramid Matching" Lazebnik, Schmid and Ponce, 2006. Using SVM and
  kernel modules to recognize a scene.

- "Histogram of Gradients (HoG) Dalal and Triggs, 2005.

- "Deformable Part Model" Feizenswalb, McAllester, Ramanan, 2009.

- PASCAL Visual Object Challenge. Object recognition benchmark. Tens of
  thousands of images from twenty classes of objects.  Everingham et al.
  2006-2012.
    - Benchmarks needed to standardize results across research groups.

- ImageNet 22K categories and 14M images. www.image-net.org.
    - Standard competition: 1000 object classes over 1.4M images.
    - Began in 2010.
    - Russakovsky et al. arXiv, 2014.
    - Error rate cut in half in 2012 by AlexNet. Beginning of deep learning
      revolution.
    - ConvNets invented in 1980s.

- CS231n focuses on image classification.
    - Related problems: object detection, image captioning.
    - 2010 - SIFT
    - 2012 - AlexNet
    - 2014 - GoogLeNet, VGG
    - 2015 - MSRA (ResNet-152)

- Need to respect the history of CNNs, which were not invented overnight.

- Kunihiko Fukushima - beginning of neural network architecture.

- Yann LeCun - groundbreaking work published in 1990s. Worked out the
  mathematical model of the backpropagation learning strategy.
    - Product was shipped to post offices to recognize zip codes. 1998.
    - 2012 - Alex Krizhevsky and Geoff Hinton used almost exactly the same
      architecture to win ImageNet (with larger capacity). A billion
      transistors for Krizhevsky compared to a million transistors for
      LeCun.

- Visual intelligence goes far beyond object recognition.
    - Dense labelling of an entire scene with perceptual grouping (know
      where every pixel belongs to).
    - Combining recognition with 3-D.
    - Anything to do with motion, affordance.
    - Deeply understand a picture: what people are doing, the relationship
      between objects, etc. (Justin Johnson)
    - Holy Grail: to be able to tell the story of a scene. Can we give a
      computer one picture, and out comes an imaginative description of the
      scene?
    - E.g. recognize importance of picture where Obama is standing on a
      scale. http://karpathy.github.io/2012/10/22/state-of-computer-vision/

## Lecture 2: Image Classification Pipeline

- Visual cortex invariant to stretching

- Once you know about image classification, anything else (e.g. object
  detection, segmentation) is a tiny delta on top of it.

- The problem: semantic gap.
    - Images represented as 3D arrays (RGB) of numbers with integers in
      [0, 255].
    - Challenges: viewpoint variation (rotation, cropping).
    - Illumination.
    - Deformation: many different pose.
    - Occlusion (cat behind curtain, cat in a couch).
    - Background clutter.
    - Intraclass variation (different kinds of cats).

- Few dozen ms to classify with human accuracy.

- No obvious way to hardcode an algorithm.
    - Attempts to make explicit recognition algorithm have been made.

- Rather take data-driver approach.
    1. Collect a dataset of images and labels.
    2. Use Machine Learning to train an image classifier.
    3. Evaluate the classifier on a withheld set of test images.

- E.g. Nearest Neighbour Classifier
    - Remember all training images and their labels.
    - Predict the label of the most similar training image.

- Example dataset: CIFAR-10
    - 10 labels
    - 50 000 training images, each image is tiny: 32x32x3.
    - 10 000 test images.
    - kNN produces a ranked list of images in the training data that are
      most similar to each test image.

- How to compare? (Distance metric).
    - L1 distance or Manhatten distance.
        - Absolute difference in pixel values.

- Question: How does the classification speed of kNN depend on the size of the
            training data?
    - Test time is linear in training example.
    - Training time is fast.
    - Test time should be fast.
    - Opposite to CNNs.
    - Approximate Nearest Neighbour (FLAN)

- The choice of distance is a hyperparameter (L1 vs. L2 distance).

- k is a hyperparamter in k-Nearest Neighbour.
    - Find the k nearest images, and have them vote on the label.

- What is the accuracy of kNN on the training data, using Euclidean distance?
    - 100%
    - Manhatten distance?

- What is the accuracy of the k-nearest neighbour classifier?
    - Not necessarily 100%

- What is the best distance, k to use? How do we set the hyperparameters?
    - Problem-dependent.

- Try out which hyperparameters work best on the test set.
    - Doesn't work well. Test set is a proxy for generalization.
    - Separate training data into folds. 20% is imagined test set data.
    - k-fold cross-validation: cycle the "test" set across each of the
      k-folds, and choose the set of hyperparameters that performs best
      when averaged across all k folds.

- Distance metrics of kNN on level of whole images can be unintuitive.
    - Compare e.g. linear shift of image, darkening, blacking out random
      blobs.

- Neural networks as playing with lego blocks: can easily stack together
  different layers into an architecture.
    - E.g. Karpathy's work on taking an image and producing a sentence
      description.
        - CNN for understanding images + RNN for understanding words.

### Linear Classification

- Parametric approach: construct a function f(x, W) taking the image and a set
  of weights (parameters) W. (+ b biases)
    - f(x, W) = Wx + b
      f 10x1, W 10x3072, x 3072x1, b 10x1

- Interpreting a linear classifier: what does a linear classifier do?
    - Weighted sum over the colours and each of the spatial positions.

- Another interpretation of linear classifier:
    - Images are points in a 3072 dimensional pixel space.
    - The classifiers are scores across some gradient in the space.

- Loss function will quantify the intuition of what is good and what is bad.
    - Look for a W that minimizes the loss.
