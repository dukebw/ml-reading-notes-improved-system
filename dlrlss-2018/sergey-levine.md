# Policy search

- Difference between state and observations: state is Markov, observations are
  not.

- TD. Baxter and Bartlett, 2001.

- Natural gradient. Peters and Schaal, 2008.


## Model-based

- Dependency on open-loop vs. closed-loop planning.

- Deterministic case: maximize the reward subject to the constraint that states
  change according to known world dynamics.

        - Open-loop control.

- Stochastic open-loop case: state transitions are probability distributions.

        - Open-loop planning doesn't work, because current actions depend on
          stochastic state transition (so the actions can't all be decided
          ahead of time).

        - Open-loop vs. closed-loop: open-loop doesn't care about interaction
          with the environment in between actions, whereas closed-loop does.

- Stochastic closed-loop control: form of policy: e.g., NN, linear feedback,
  etc.

- Policy search with a model: backpropagate directly into the policy (use
  reparametrization trick, moment matching etc. for stochastic dynamics).

        - Possible but difficult (for same reason that RNNs are difficult to
          train).

- Model-free optimization with a model (even though you know the dynamics of
  the model, ignore the gradients).

        - Flexible model-based policy search. Parmas et al., ICML 2018.

- Learning policies without BPTT: guided policy search.

        - End-to-end training of deep visuomotor policies. Levine et al., 2016.


### Learning the model

1. Run base policy to collect D.

2. Learn dynamics model f(s, a) to minimize MSE f(s_i, a_i) - s_i'.

3. Plan through model to choose actions.

- How system identification works in classical robotics.

- Design a good base policy.

- Works if you can hand-engineer a good dynamics model.

- Doesn't work in general due to distributional shift. Fitting the model to
  \pi_0 instead of \pi_1. Problem exacerbated with higher capacity models due
  to overfitting.

- Model-based reinforcement learning v1.0: repeat 1-3 above, then go back to 2
  and repeat, appending more data to the dataset as you go.

- v1.5: re-plan every single timestep. More resistant to having an incorrect
  model.

- Observations (instead of states): learn POMDP model. Embed to control.
  Watter et al., 2015.

        - Deep spatial autoencoder. Finn et al., 2016.

- Readings:

        - Integrated architectures for learning, planning. Sutton, ICML 1990.

        - PILCO. Deisenroth and Rasmussen, ICML 2011.

        - Agnostic system identification. Ross and Bagnell, ICML 2012.

        - Nagabandi et al., NN dynamics models, 2018.

        - Deep visual foresight. Finn et al., 2017.

        - Homework 4 from Berkeley deep RL course.


## Questions

- Rewards + demonstrations: initialize policy with demonstrations, then
  finetune it with rewards.
