# Networks: A Common Language

- Node classification / link prediction / community detection / network similarity

- Node classification

- GraphSAGE

        - Inductive representation learning on large graphs (W. Hamilton) + 1
          more.

        - Nodes aggregate information from neighbours using NNs.

        - Each update step is a binary function of the current embedding at
          that node, and the aggregated current embeddings of all neighbours.

- PinSAGE: GCNNs for web-scale recommender systems

        - Related pins, search, product recommendations, etc.

        - Pinterest: collections (boards) of images.

        - task: learn node embeddings so that
          d(z_cake1, z_cake2) < d(z_cake1, z_sweater).

        - Need resolution of 100

                - Hard negative samples.

        - Metric: mean reciprocal rank.

- Modeling polypharmacy side effects

        - Given combinations of drugs predict side effects.

        - Decagon

- Reasoning in knowledge graphs

        - Embedding local queries in knowledge graphs (W. Hamilton)
