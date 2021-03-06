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

- Rather take data-driven approach.
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

- What is the accuracy of Nearest Neighbour on the training data, using Euclidean distance?
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

## Lecture 3: Linear Classification II

- TODO: 1. Define a loss function that quantifies the dissatisfaction with the
           scores across training data.
        2. Come up with a way to efficiently determine the parameters that
           minimize the loss.

- Multiclass SVM loss:
    \begin{equation}
        L_i = \sum_{j \neq y_i} \textrm{max}(0, s_j - s_{y_i} + 1)
        \label{multi_svm_loss}
    \end{equation}

    where s_{y_i} is the score of the ground truth label.
    - Loss is the average of this: $L = \frac{1}{N}\sum_{i=1}{N}L_i$.
        - Scaling or translating this loss by a constant would produce the same
          minimum.
        - Squared hinge loss takes square of max term in
          Equation~\ref{multi_svm_loss}.

```python
def L_i_vectorized(x, y, W):
    scores = W.dot(x)
    margins = np.maximum(0, scores - scores[y] + 1)
    margins[y] = 0
    loss_i = np.sum(margins)
    return loss_i
```

    - Problem with current loss function $L$: infinite solutions by scaling the
      weight vector $W$ that achieves a loss of zero by a constant greater than
      one.
        - Why does the constant have to be greater than one?

- Weight regularization: Add $\lambda R(W)$ to loss term.
        - L2 regularization          $R(W) = \sum_k \sum_l W_{k,l}^2$
        - L1 regularization          $R(W) = \sum_k \sum_l |W_{k,l}|$
        - Elastic net (L1 + L2)      $R(W) = \sum_k \sum_l \beta W_{k,l}^2 + |W_{k,l}|$
        - Max norm regularization
        - Dropout

- L2 regularization: motivation
        - Favours spreading the same absolute sum of weights evenly over
          different indices of the weight matrix.
                - Takes input features into account more evenly than favouring
                  less input dimensions.

- Softmax Classifier (Multinomial Logistic Regression)
        - Scores are unnormalized log probabilities.
        - P(Y = k | X = x_i) = e^{s_k} / \sum_j e^{s_j}, where s = f(x_i; W)
        - L_i = -log P(Y = y_i | X = x_i)
                - Want to maximize log likelihood, or minimize negative log
                  likelihood.
        - Should start at 1/NUM_CLASSES, then go to zero as the optimization
          progresses.

- SVM: L_i = \sum_{j \neq y_i} \max(0, s_j - s_{y_i} + 1)
        - The +1 gives a max-margin property (ref. cs229)
        - Refer to notes about why specifically +1 is used. +1 is not a
          hyper-parameter.

- Softmax vs. SVM: If a data point is taken and shaken around when there is a
  large amount of margin already, the SVM expresses no preference for greater
  margin. But, softmax does prefer a larger margin.

- Recap: - dataset of (x, y)
         - score function: s = f(x; W) = Wx
         - softmax/svm

- Take analytical gradient to do weight updates at each step
        - Check implementation using numerical gradient (gradient check).

- Gradient descent:

```python
while True:
        data_batch = sample_training_data(data, 256)
        weights_grad = evaluate_gradient(loss_fun, data, weights)
        weights += -step_size*weights_grad
```

- Weight regularization parameter and learning rate are largest "headaches" to
  worry about in hyper-parameter optimization.
        - Can start out with high learning rate and decay over time.

- Common mini-batch sizes are 32/64/128 examples. Set based on whatever fits on
  your GPU.

- Many forms of parameter update: momentum, Adagrad, RMSProp, Adam, ...

- Before ConvNets came about:
        - Computed many different feature types of images, piped those features
          into large vectors, and used linear classifiers on them.
                - Feature types: e.g. colour (hue) histogram, HOG/SIFT
                  features, GIST, LBP, Texton, SSIM, ...
                - Bag of words pipelines: look at patches and come up with
                  visual word vectors, then learn k-means centroids

## Lecture 4: Backpropagation

- On forward pass, can compute df/dx for each "gate" or computational node
  using the current activation.

- d \sig(x)/dx = (1 - \sig(x))\sig(x)

- Want to understand intuitively how gradients flow in a computation graph.
        - E.g. to debug vanishing gradient problem.
        - Add gate: gradient distributor
        - Max gate: gradient router
        - Mul gate: gradient... "switcher"?

- Gradients add when they backpropagate back through a computation graph.

```python
class ComputationalGraph(object):
        def forward(inputs):
                for gate in self.graph.nodes_topologically_sorted():
                        gate.forward()
                return loss

        def backward():
                for gate in reversed(self.graph.nodes_topologically_sorted()):
                        gate.backward()
                return inputs_gradients

class MultiplyGate(object):
        def forward(x, y):
                z = x*y
                self.x = x
                self.y = y
                return z

        def backward(dz):
                dx = self.y * dz
                dy = self.x * dz
                return [dx, dy]
```

- Memory blows up in forward pass, and is consumed during backward pass.

- E.g. Torch layers
        - Giant collection of layer objects in GitHub repo.

- Gradients for vectors are stored in a Jacobian matrix (dz/dx is an entire
  matrix of the derivative of every element of z with respect to every element
  of x).
        - In practice never (?) need to explicitly calculate the Jacobian.

- E.g. f(x) = max(0, x) example, with x.shape = [4096]. Jacobian (4096x4096 in
  principle) is diagonal with 1s wherever x_i > 0 and 0s otherwise.
        - With minibatch of 100, Jacobian actually in principle
          [409600, 409600].

- Communication between gates is always vectors.
        - Multiple gradients need to be kept track of in parallel if there are
          multiple loss functions.

- Writing SVM/Softmax:

```python
# forward pass
scores = #...
margins = #...
data_loss = #...
reg_loss = #...
loss = data_loss + reg_loss

# backward pass
dmargins = #...
dscores = #...
dW = #...
```

- Two-layer neural network: f = W_2*max(0, W_1*x)

- Writing two-layer net:

```python
h1 = #...
scores = #...
loss = #...

# backward pass
dscores = #...
dh1, dW2, db2 = #...
dW1, db1 = #...
```
