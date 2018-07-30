# NNs for NLP


## Sentence classification

- Bag of words: add up score vectors (onehot?) for each word in the sentence,
  plus bias, then run through softmax to get probabilities.

        - Broken e.g., by "I don't love this movie", "there's nothing I don't
          love about this movie".

- Continuous bag of words (CBOW): sum features, multiply by weight matrix, add
  bias to get scores.

- Deep CBOW (Iyer et al., 2014): sum features, run through a feedforward NN,
  add bias to get scores.

        - Issue: doesn't handle relative positions of words.

- Modeling sentences with n-grams: unigram, bigram, trigram, etc. All possible
  n-grams -> bag of n-grams.

        - Problem: longer n-grams lead to sparsity.

- Time delay NNs (Waibel et al., 1989): take feature vectors for each 2-gram
  (x1, x2), do: tanh(W*[x1; x2] + b)). Then do pooling -> softmax.

        - Equivalent to 1D convolutions.

        - Collobert and Weston, 2011.

        - Context window modeling: get the surrounding context before tagging.

        - Sentence modeling.

        - Pooling: max, average, k-max (did you see this feature up to k
          times?), dynamic (did you see this feature in the beginning? middle?
          end?).

- Long distance dependencies in language: "_She_ does not have very much
  confidence in _herself_."

        - Selectional preference: "the reign has lasted as long as the life of
          the queen," versus "the rain has lasted as long as the life of the
          clouds."

- RNNs (Elman, 1990).

        - Weaknesses: due to indirect passing of information, credit assignment
          is difficult.

        - Slow, due to serial processing.

- Language models: can score (good/bad) and generate sentences.

- Count-based language models: count up the frequency of the n-grams, and
  divide to get the probability (e.g., divide frequency of "I hate this movie"
  by frequency of "I hate this").

        - Sparsity: smoothing and backing off.

        - Problems: long-distance dependencies, similar words, intervening
          words.

        - Bag of n-gram words with conditional probabilities described by
          W_{1, a} of the next word given the most previous word is "a",
          W_{2, giving} of the next word given the second most previous word is
          "giving", etc.

                - Doesn't solve similar words or long-range dependency models.

- Neural language models (Bengio et al., 2004).

        - Similar words are close in input and output embedding spaces.

- Rule of thumb: given problems, can my current model handle these? If not,
  what changes need to be made?

- Evaluation of language models:

        - Log-likelihood over the test set.

        - Per-word log-likelihood (-WLL).

        - Per-word cross-entropy.

        - Perplexity: 2^entropy = e^{-WLL)

                - Number of times you would have to guess uniform randomly to
                  get the word correct.

- Conditioned language model (Sutskever et al., 2014).


## Generation: two methods: sampling, and argmax

- Ancestral sampling: randomly generate words one-by-one:

        ```
        while y_{j - 1} != "</s>"
            y_j ~ P(y_j | X, y_1, ..., y_{j - 1})
        ```

        - An exact method for sampling from P(Y | X).

- Argmax search: greedy search: one-by-one, pick the single highest-probability
  word.

        ```
        while y_{j - 1} != "</s>"
            y_j = argmax P(y_j | X, y_1, ..., y_{j - 1})
        ```

        - Issue: e.g., "I am from Pennsylvania", but if ""

- Beam search: keep multiple hypotheses.

        - Instead of picking one high-probability word, maintain several paths.

- Representing sentences as vectors.

        - "You can't cram the meaning of a whole goshdarn sentence into a
          single goshdarn vector!" - Ray Mooney

        - Use multiple vectors, depending on the length of the sentence.

                - Attention: Bahdanau et al., 2015.

                        - Use query vector and key vector

                - Idea from human translation: keeping an entire 60-word
                  sentence in your head while translating it is hard.

                - Intra/self-attention: Cheng et al., 2016.
                  Vaswani et al., 2017.

                - Google, ACL 2018: attention is _not_ all you need.


## Language analysis models: p(structure | text)

        - Tagging: one tag to each word (identify people, places and things in
          text).

        - Syntactic parsing (e.g., dependency parse).

        - Simple tagging: BiLSTMs.

        - Simple parsing: linearized tree + seq2seq.

                - Can get further by exploiting problem structure.

                        - BiLSTM conditional random fields
                          (e.g., Ma and Hovy, 2015). Additional layer that
                          considers the consistency between tags. Training and
                          prediction use dynamic programming (Viterbi at
                          prediction time).

                        - Stack LSTMs (Dyer et al., 2015).


## Overcoming data sparsity.

- Koen and Knowles, 2017. BLEU scores against corpus size. Bias/variance
  tradeoff.

- Pretraining. Widely used in word embeddings (Turian et al., 2010), e.g.,
  word2vec, GloVe, Fasttext (recommended, since it uses subword units).

        - Sentence representations (Dai et al., 2015).

        - Contextual word emeddings (), e.g., Elmo. Get a representation for
          the word in context.

- Multi-task learning. Randomly choose minibatch from one of the multiple
  tasks, and training on it. Collobert and Weston, 2011.

- Cross-domain, cross-lingual learning.

        - Adapatation methods: pretrain on one language, finetune on the other.

        - Adding domain/language tags.

        - Shared parameters.

- Better inductive bias: better models scale better. Models that match our
  linguistic intuitions.


## Semantic parsing/machine reading: P(semantics | text)

- Executable meaning representations: parsing to queries: e.g., Free917 --
  Freebase query language (Cai and Yates, 2013).

        - Used in search engines.

        - Parsing to commands: e.g., IFTTT -- commands to smartphone interfaces
          (Quirk et al., 2015).

        - Parsing to source code: e.g., CoNaLa -- Stack Overflow
          questions/answers (Yin et al., 2018). Dataset!

- Semantic parsing with syntax: tree-based model that generates AST
  (Yin and Neubig, 2017). Work better than seq2seq, especially in
  data-deficient situations.

- Machine reading: semantic parsing-based QA: query a known knowledge base for
  answers. Read a passage and answer questions about that passage.

        - MCTest (Richardson et al., 2013). 500 passages, 2000 questions.

        - RACE (Lai et al., 2017): 28 000 passages, 100 000 questions from
          English comprehension tests.

        - SQuAD (Rajpurkar et al., 2016). 500 passages, 100 000 questions on
          Wikipedia text.

        - TriviaQA (Joshi et al., 2017).

        - Need attention and multi-step reasoning.

        - Bidirectional attention flow (Seo et al., 2017). Take (query,
          document) pair and compute attention in both directions.

        - "Reasoning" example: memory networks (Sukhbaatar et al., 2015).


## Challenges for Neural NLP/NLU in 2018

- Scaling down

- Robust solutions. Deep networks do shallow pattern matching in big data
  scenarios.

- "Deeper reasoning".

- Interpretability.


## Resources

- web.stanford.edu/class/cs224n

- phontron.com/class/nn4nlp2018
