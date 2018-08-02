# ML product development

- General advice: with enough effort you can work in an area you initially
  regarded as your weakness.

- ML ensemble Toronto

- A/B testing: set up the system so that different subsets of users get
  different algorithms (for comparison).

        - Do this in a way s.t. the production system is not affected?

        - Also try an A/A test (pipelining test).

        - More sophisticated: multi-armed bandits. Algorithm is online (e.g.,
          shows more successful version more often).

- Kobo: esimating start and end of books, estimated time to read, plaigarism
  detection, adult book classification.

- Make data-driven decisions (not gut feelings).

- The long tail (e.g., in recommendation carousel): large amount of sales
  coming from tail of recommendation distribution.

- Decision support -> data-driven automation. E.g., cannot use
  human-in-the-loop for personalization (as opposed to market segments).

        - A/B -> multi-armed bandit.

        - Eliminating man in the middle.

- Start simple (rule-based, logistic regression).

- Invest time in creating pipelines, s.t. it's easy to setup and compare
  algorithms.

- If consuming research from academia: 95% of time spent on engineering.

        - Research scientists are also using this pipeline (written by
          engineers)? Need engineer to get and prepare the data, but sounds
          like researcher works from data files.


## Uber ATG

- Complex realtime robotics stack.

- Sensor data (LiDAR) + mapping/localization data (at cm level, more precise
  than GPS).

        - Then detect things.

        - Followed by tracking.

        - Several frames of detections and tracking => make predictions about
          where the actor will go (waypoints).

        - Planning: figure out what the trajectory is to get where you need to
          go.

        - Control: output the plan into the self-driving car.

- Paper last week about sensor fusion.

- Refine algorithms to more heavily weight objects in the vicinity.

- Composability important in understanding what the model does.

- Research -> production for an end-to-end detection/mapping/planning system.

- Data engineering: sensor data, geometry, timeseries data (adjusting for
  egomotion), creating good dataset splits. Petabytes of data. Before research.

- Research.

- Runtime optimization. Deep expertise in NNs and lowlevel GPU optimization.

- Integration and productization: take research, and plug it into the software
  stack that takes realtime sensor data, and controls the car.

- Infrastructure: data, compute, metrics. Develop own tech due to deep learning
  needs.

- New software -> replay logs -> simulate -> track testing -> small deployment
  -> fleetwide deployment (-> new software).

- Challenges: long tail distribution of situations (e.g., weather, traffic
  conditions, human behaviour, etc.).
