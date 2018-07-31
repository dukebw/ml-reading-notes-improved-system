# Grounded language learning (with NNs)

- Other research on grounding: semantic parsing, models of language
  acquisition, etc.

- Language-vision integration.

- SHRDLU (Winograd, 1972).

        - Constructions and vocab determined in advance.

- Embodiment: match the perceptual scope at training with evaluation.
  Psychology: "cognition depends on aspects of the agent's body other than the
  brain."

- Meaning is context dependent.

- Brittleness and leverage.

        - Brittleness: divergence (training scope, evaluation scope).

        - Leverage: model's effect on world from observer scope?

        - More divergence => more leverage power.

- Approach #1: grow both training and evaluation scopes together into the world
  scope.

        - Vision-language environments: Beattie et al., 2016,
          Vizdoom (Kempka et al., 2016), etc.

        - Simulated language learning (Hermann et al., 2017).

        - ACTRCE (Wu et al., 2018). Hindsight experience replay in the language
          setting.

        - Embodied question answering (Das et al., 2018). Language, vision,
          navigation, and question-answering in a single model.

- Approach #2: evaluation = world scope, grow training scope to world scope.

        - What if our agents had access to search?

        - Image dispersion (Kiela et al., 2014). Searching "cuska" returns
          pictures of snakes => concrete concept. salidzinat => returns various
          images, therefore more abstract.

                 - Idea is that the more diverse the returned images are, the
                   more abstract the concept.

        - Picturebook, Kiros et al., 2018: ground language through image
          search. Run all 2.2 million words in GloVe vocabulary through search.

        - Navigating through streetview (Mirowski et al., 2018).

        - Playing games via YouTube (Aytar and Pfaff et al., 2018).


## Building blocks

- Current approaches for connecting multiple modalities.

- Three ways for modalities to interact: matching, fusion, and modulation.

        - Matching: score(X, Y)

        - Fusion: vec(X, Y)

        - Modulation: vec(X | Y)

- Matching: learning a joint embedding space for retrieval. E.g., embed a
  caption and ask "what is the closest image for this caption?"

- Fusion: e.g., Arevalo et al., 2017, Fukui et al., 2016.

- Feature-wise linear modulation (Perez et al., 2017).

- Mikolov et al., 2013. PCA on different languages.


## Grounding and related research

- Grounding's relation to: contextualization, multi-apt representations,
  relevance realization, specificity, natural language generation and dialogue.

- Perspective shifting (Barsalou): spouse, children, pets, works of art,
  explosive material, toxic material. "Things you pay attention to in a fire".

- Contextualization through cross-situational learning: "which words relate to
  bike" using triplet (two captioned images with bikes, one without).

- May et al., 2012. "The crane was so massive it blocked the sun".

- Contextualized reps. McCann et al., 2017. Elmo. Peters et al., 2018.

        - https://einstein.ai/research/learned-in-translation-contextualized-word-vectors

- Winograd schemas (Winograd, Levesque, et al.).

        - "The trophy doesn't fit into the brown suitcase because it's too
          [small/large]."

        - Multi-apt representations (e.g., radford et al., 2018).

- Relevance realization

- Aligning books and movies (Kiros and Zhu et al., 2015).

- Specificity (Jas and Parikh, 2015). Agreement of annotators.

- GuessWhat?! DeVries et al., 2017.

- Cooperative visual dialog agents (Das et al., 2017).

- Talk the walk (DeVries et al., 2018).

- Capacity vs. specificity in natural language generation.

- Visual storytelling (Huang et al., 2016).

- Hierarchical neural story generation (Fan et al., 2018).


## Questions

- Aspects of language (e.g., intent) cannot be captured visually, and may
  require an acting agent.

        - Complex simulations.

        - Social interactions.

- Applying multi-modal learning ideas in science or mathematics, where the
  complexity is more "under control", as opposed to "in the wild" language
  learning in the entire natural world.

- How should human evaluation be done?

- Infer-light. Gated BoW almost as good as recurrent networks. Local
  convolutions make up the gap.

        - Semantic caching: take question vector, and add a layer with sigmoid
          units. Layer normalization -> sigmoids with temperature reducing over
          time -> get thresholds to code a vector with almost as much
          information as the real-value vector.

- Are the complex models easy to train?

        - Matching models with joint embedding space and contrastive loss can
          be difficult. Use pretrained then finetune.

        - Adding RL difficult. Imitation/supervised learning then finetune RL
          afterwards.
