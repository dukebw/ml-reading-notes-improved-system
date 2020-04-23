# Review: On the relationship between self-attention and convolutional layers

Reviewer: Brendan Duke

The authors investigated whether self-attention layers can, and whether they do
in practice, learn to mimic convolutional layers.

The authors were motivated by previous work by Ramachandran et al.
(Ramachandran, 2019), which found that a network composed only of
self-attention layers can outperform a convolutional network with similar FLOPs
and parameters.

Since Ramachandran et al. focused on performance and runtime and did not
investigate the functions learned by the self-attention layers of their
attention networks, the authors of the paper under review were well motivated
in choosing their topic.

The authors claim that self-attention layers, particularly those early layers
(near the input), can learn to mimic convolutional kernels.

The authors support their claim that self-attention layers can learn
convolutional kernels through a proof for the special case of quadratic
positional encoding when the number of attention heads is greater than or equal
to the number of parameters in the convolutional kernel.
The proof is straightforward and relies on the ability of each self-attention
head to learn (using the relative positional encoding) to attend to a single
pixel position only.

The authors also provide empirical evidence, in the way of visualization, that
self-attention heads (in a 6-layer network trained on CIFAR-10) using a learned
relative positional encoding do learn to attend to single pixels relative to
the output pixel's position.

I propose accepting this paper on the basis that the investigation of the
relationship between self-attention and convolution is novel, to the best of my
knowledge.
The authors also provide code for their experiments, which is especially
helpful since Ramachandran et al. did not release a public implementation.
Although the authors' investigation is limited in the sense of the narrow scope
of their proof (quadratic relative positional encoding) and their empirical
results (6-layer network on CIFAR-10), their initial investigation and
accompanying public implementation should spur future work on the relationship
between self-attention and convolution.


One possible improvement of the paper would be to spend more space empirically
investigating learned relative positional embeddings, and even fixed sinusoidal
relative positional embeddings, since these positional embeddings are used more
frequently in practice.
Since quadratic embeddings are cooked up to attend to a single location (the
parametrized center of the attention for that head), the conclusions drawn with
quadratic embeddings could be more convincing if those conclusions carried over
to other embedding types.

For learned embeddings, what is the motivation for using a look-up table
indexed by a set of discrete distances between pixels?
It seems that this throws away our prior knowledge about the linear
relationship between distances, e.g., 14 is much closer to 15 than 0 is to 15,
but the embedding initialization is random and doesn't reflect this.
Why not make the learned embedding a function of the distance, instead of using
the distance to index an LUT?
Could this explain the slightly worse performance of the SA learned compared to
SA quadratic in Table 1?
