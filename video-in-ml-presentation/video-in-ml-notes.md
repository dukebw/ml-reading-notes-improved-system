Video understanding in machine learning

Abstract:

In this presentation I will explain current research's answers to the questions
"Do the same deep learning design principles that brought success in such
challenges as ILSVRC image classification generalize to tasks in video
understanding?" and "Can the additional temporal information in video be
leveraged to improve upon the techniques that work on static images?".

I will give an overview of tasks in video understanding, including video
classification, spatiotemporal object detection and dense captioning events in
video, by comparing these tasks to their analogous tasks in static images.

I will explain three currently dominant model architectures for video
classification, namely 2D ConvNet + LSTM (Donahue et al., 2014), 3D ConvNet
(Tran et al., 2014) and Two-Stream networks (Simonyan and Zisserman, 2014). I
will dicuss how current results (Carreira and Zisserman, 2017) indicate that
the temporal information extracted from optical flow in Two-Stream networks is
complementary to features extracted from RGB alone.

Questions:

Do similar supervised learning techniques that brought success on
ImageNet generalize to tasks in video understanding?

Can the additional temporal information in video be leveraged to improve
upon the techniques that work on static images?

Key points:

1. Classification

        - ImageNet image classification vs. Kinetics video classification.
          E.g. deep networks such as Inception and ResNet on ImageNet, vs. the
          current variety of networks vying for dominance in video
          classification (Conv + LSTM, C3D and two-stream).

                - CIFAR 10/100

                - ImageNet (1.2M images) vs. Kinetics (310K clips, 10s each)

                        - Kinetics:

                        - Kinetics videos are sourced from YouTube, and
                          therefore there are both a greater volume of clips
                          and a greater variety of performers compared to the
                          previous standard video classification datasets,
                          UCF-101 and HMDB-51.

                        - Can train Conv3D models from scratch, whereas UCF-101
                          (9.5K videos per split of three splits into
                          train/test data) and HMDB-51 (3.7K per split)
                          required pre-training on Sports-1M.

                        - Focused on human actions (e.g. hugging, washing
                          dishes), as opposed to activities or events (e.g.
                          playing tennis).

                        - 400 classes in total.

                        - Gathered by first running a pre-trained classifier on
                          videos in order to find regions of interest, and then
                          manually refining the clips using Amazon Mechanical
                          Turk.

                        - ImageNet:

                        - Data collected from Flickr, and other search engines.

                        - ImageNet is focused on covering all nouns in the
                          English language, using tens of millions of manually
                          annotated images. ILSVRC image classification uses a
                          subset of these ImageNet images.

                        - In ILSVRC2012, 90 synsets were replaced with dog
                          breeds, in order to evaluate fine-grained
                          classification.

                        - ImageNet and Kinetics are similar in that they are
                          both used successfully for pre-training and
                          fine-tuning networks to smaller datasets. This was
                          shown by (Carreira and Zisserman, 2017), where they
                          pre-trained on Kinetics and achieved state of the art
                          results with existing networks, achieved 79.9%
                          accuracy with 3D-ConvNet on UCF-101 (compared to
                          49.2% with no pre-training) and 49.4% (24.3%) on
                          HMDB-51. Other architectures (LSTM, Two-Stream and
                          3D-Fused) achieved smaller boosts, larger on HMDB-51
                          than UCF-101, since HMDB-51 is overall a more
                          difficult dataset (on purpose, e.g. "drawing sword"
                          actions are in the same video as "sword" and "sword
                          exercise").

                - Image architectures: Inception-ResNet-v2
                        - 3.1% top-5 error on the ILSVRC validation set, with
                          four models ensembled.

                        - 43 inception modules of multiple varieties, giving a
                          total of 5 + 7 + 10*7 + 3 + 20*5 + 7 + 10*4 + 1 + 2 =
                          235 conv layers.

                        - Designed with the constraint that it is the same size
                          as its pure-inception counterpart Inception-v4, which
                          I counted as having 43M parameters.

                - Video architectures:
                        - Need architectures that can find temporal ordering:
                          e.g. opening vs. closing a door.

                        - C3D: 79M parameters from eight conv layers and two
                          fully-connected layers, with batch normalization
                          after each layer. This was for 112x112 input images.

                        - This brings up one difficulty of applying image
                          convolutional network design principles to video:
                          the number of parameters is automatically tripled,
                          assuming the standard 3x3x3 kernel sizes.
                          Furthermore, memory usage on GPU will be linear in
                          the temporal stride of the convolution, which for
                          examples adds a factor of 16 to pre-pooling layers
                          for temporal receptive field = 16 frame networks.

                        - C3D is trained using 16-frame snippets from different
                          clips, and at test time entire 10s clips are fed in,
                          with 8-frame overlap between snippets, and the result
                          averaged. A linear-SVM was used, in place of
                          averaging, in (Tran et al., 2014).

                        - CNN + LSTM: an LSTM layer with 512 hidden units and
                          batch normalization was placed on top of
                          Inception-V1. Inception-V1 is a smaller network than
                          Inception-ResNet-v2, with 9 inception modules and 58
                          conv layers total.

                        - LSTMs are recurrent neural networks that curry
                          temporal information through their cell state. At
                          each time-step, cell state is updated based on
                          learned functions of the previous cell state via a
                          gated self-loop, as well as the inputs for the next
                          time-step. This allows the cell state to carry over
                          from time-step to time-step, allowing information to
                          propagate a long way through time. Inputs and
                          cell-state are both gated via learned parameters that
                          depend on the output of the previous state and the
                          input of the current state. Even the output is gated.
                          Cell state = activations.

                        - The LSTM is added to the last average-pooling layer
                          of Inception-V1, with a fully-connected layer on top
                          for the classifier. Training is done with
                          cross-entropy losses on the outputs at all steps.

                        - Optical flow: forward displacement of a pixel between
                          frames t and t+1. Can also be represented by
                          trajectory stacking: in this case each optical flow
                          pixel (u, v) in a given frame in the stack contains
                          the current position of the pixel originally at
                          (u, v) in frame 0.

                        - As seen from the classification error on the Kinetics
                          dataset, the introduction of optical flow reduced the
                          error by about 4% for the best network, two-stream I3D.

                          I3D is a variant on two-stream that takes the optical
                          flow and RGB frames as input to a 3D convnet, which
                          has an "inflated" Inception-V1 architecture, meaning
                          that the Inception-V1 architecture was used with 3D
                          convolutional kernels.

                          Note that the relatively poor performance of the
                          flow-only streams on Kinetics is in contrast to the
                          HMDB-51 and UCF-101 datasets, where the flow streams
                          significantly out-perform RGB-only streams.
                          Qualitatively, Kinetics has more camera motion than
                          HMDB-51 or UCF-101, which the TV-L1 optical flow
                          algorithm has difficulty with. An optical flow
                          algorithm robust to camera motion could produce even
                          larger improvements to the activity recognizer.

                          This brings us back to our first question. Since
                          ConvNets seem to have trouble learning optical flow
                          when trained with cross entropy on class labels, does
                          it mean that the model design paradigm must change
                          for video?

                - ActivityNet (20K full-length videos from YouTube)

                - Sports 1M

                - YouTube 8M

2. Detection

        - Object detection in images vs. in videos.
          E.g. fast, faster, and mask R-CNN vs. temporal action proposals, and
          spatiotemporal action proposals (tubelets).

                - ImageNet VID object detection vs. ImageNet image object
                  detection, or MS COCO image object detection

        - Fast R-CNN uses a convnet to extract feature maps from an image.
          These feature maps are shared between the region proposal network,
          and the classifier. The region proposal network uses the convnet
          feature maps to produce a set of bounding box proposals. The bounding
          box proposals are used along with the convnet features, via an RoI
          pooling layer, to create fixed-size 7x7 activations for input to a
          fully-connected classifier. Positive object detections from the
          classifier layer are combined with non-maximum suppression.

        - Tubelet proposal networks paper:

                - Data: ImageNet VID. One bounding box ground truth annotation
                  per frame, each manually labelled.

                - Model: Tubelet Proposal Network, which generates 300 tubelet
                  proposals per frame in 0.5s.

                        1. Static anchor proposal made with RPN. (Due to high
                           recall rate).

                        2. Features extracted from static anchor bounding box
                           at all frames (receptive field 363 pixels).

                        3. Followed by regression layer to estimate temporal
                           displacements from static anchor bounding box. This
                           Tubelet Proposal Network is a GoogLeNet with batch
                           normalization.

                        4. ROI-pooled-across-time features (tubelet features) are then
                           extracted from the tubelets by a classification CNN.

                        5. The classification CNN features are input to an
                           encoder-decoder LSTM for classification. The LSTM
                           has 1024 cell units and 1024 hidden outputs.

                - Inference: 128 tubelets from four videos per mini-batch.
                  CNN-LSTM is trained with SGD with momentum 0.9 for 20000
                  iterations. The initial learning rate is 0.1.

                - Criticism: Smoothed L1 loss for robust box regression:
                  d(x) = 0.5x^2 if |x| < 1,
                         |x| - 0.5 otherwise.
                  On normalized temporal displacements of the bounding box
                  selected from whichever box has highest IoU with the
                  predicted box (negative prediction otherwise).

3. Captioning

        - Image captioning and dense image captioning vs. dense captioning
          events in video.

                - MS COCO image captioning vs. ActivityNet captions

        - Dense captioning in videos

                - Data: ActivityNet captions

                        - 20k videos, from YouTube, as long as ten minutes.

                        - Each video annotated with on average 3.65 sentences.

                        - Events can occur at the same time: e.g. "the man is
                          playing piano" while "the woman begins singing".

                - Model:

                        - Model inputs: frames in temporal orders.

                        - Model outputs: tuples of (start, stop, sentence)

                        1. Extract C3D features from 16-frame chunks of the
                           video.

                        2. Proposal module generates tuple
                           (start, stop, score, hidden representation).
                           Proposals with scores higher than a threshold are
                           forwarded to language model. NxD where D = 500, and
                           N = T/delta (where delta = 16).

                           Proposal unit is an LSTM that operates at strides
                           1, 2, 4 and 8 over the C3D features.

                           K event proposals output at every time step.

                           Hidden state of LSTM is used as the feature
                           representation of the detected event.

                        3. Captioning module takes as input hidden
                           representation from proposal module, as well as past
                           and future context from other events.

                           Past and future context of all events is passed
                           using an attention module that takes the current
                           event proposal's hidden representation as input.

                           Language LSTMs have two layers and 512 hidden units.

                - Inference:

                        - Alternately train language model and proposal model
                          every 500 iterations.

                - Criticism:

                        - Weighted cross-entropy loss on proposal confidence.
                          MSE on (start, stop)?

                        - Cross-entropy loss across all words in sentences.

4. Other image and video understanding tasks

        - Segmentation vs. spatio-temporal segmentation.

        - Monocular depth in images vs. videos.

        - An outlier: optical flow is a purely temporal task.

5. Taking advantage of the abundance of video input data with unsupervised
   learning.

   "When we're learning to see, nobody's telling us what the right answers are --
   we just look.

   Every so often, your mother says "that's a dog", but that's very little information.
   You'd be lucky if you got a few bits of information -- even one bit per second
   -- that way.

   The brain's visual system has 10^14 neural connections. And you only live for 10^9
   seconds. So it's no use learning one bit per second. You need more like 10^5 bits per
   second. And there's only one place you can get that much information: from the input
   itself."

   Geoffrey Hinton, 1996

   - Weakly supervised techniques
