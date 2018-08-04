# Imitation Learning

- Setup: RL is hard, since exploration, credit assignment, and reward design
  are all hard.

- Don't see deployed systems in the real world doing RL for longterm reward.

        - RL for immediate rewards such as content reward. Ad placement etc.
          Horizon is one-two steps.

- Yet people are pretty good at many tasks, so perhaps we can use them to help.

- Mario AI competition 2009.

- DAgger. Can prove that error doesn't compound
  (L(\pi_n) < T*\epsilon_n + O(1)).

- Notion of distribution over actions? As opposed to just getting the optimal
  action from the expert. E.g., if the best action is not available, may want
  to take the second best action.

- Cost-sensitive classification:
  h : x -> [K], where K Is the number of actions.

        - Data: (x, c) \in X x [0, \inf)^K

        - Goal: min_h E_{(x, c)} [ c_{h(x)} ]

- Learning to search: AggraVaTe.

        1. Let learned policy \pi drive for t timesteps to obs. 0.

        2. For each possible action a:

                - Take action a, and let expert drive the rest.

                - Record the overall loss c_a.

        3. Update \pi based on example: (o, (c_1, ..., c_K))

        4. Goto 1.

- Can we assume the expert policy is stochastic?

        - Yes.

        - The expert is not necessarily optimal, just "pretty good".

- What is the expert's API?

- Behaviour cloning:

        - In: world

        - Out: set of trajectories.

- Dagger:

        - In: observation

        - Out: action

- Aggravate:

        - In: observation

        - Out: long term cost of all actions

- Simulated experts:

        - Compute rollout to some depth. Whichever is best, return initial
          action on that rollout as the expert action.

        - Beyond naive search: any planner (e.g., MCTS).

        - AlphaGo zero.

- Klein et al., 2017. Structured prediction for machine translation.

        - At each timestep, write down a word (action). Have expert
          translations.

- Chang et al., NIPS 2016. Tagging.

- Bengio et al., NIPS 2016.

- Limitations of DAgger and AggraVaTe compared to behavioural cloning: need
  access to expert.

- LOLS: change rollout strategy.

        - Roll in with learned policy, roll out with mixture of
          learned/reference policy.

- Combination via hierarchies: ask human for a highlevel plan, then use vanilla
  RL to achieve the subgoals of the highlevel plan.

        - Insight: verifying that lowlevel trajectory is correct is cheaper
          than labelling the lowlevel trajectory.

- Slides online.


## Open problems

- Can we learn from observations of experts?
