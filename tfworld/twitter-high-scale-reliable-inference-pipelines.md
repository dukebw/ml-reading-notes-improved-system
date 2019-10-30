# Twitter: High-Scale Reliable ML Inference Pipelines

- They have a central team that provides an ML platform for applied research
  teams.

        - Platform: training / evaluation / inference.

        - Languages:

                - Training: python

                - Eval: Python, Java / Scala (JVM)

                - Inference: Python, Scala (JVM)

- Online services: Mesos / Finagle

- Offline: Hadoop, Scalding (doing MapReduce in Hadoop)

- Package TF (not TF due to some gRPC limitation) behind a JVM Finagle service.

- Use case diversity challenged:

        - Expensive to use GPUs, so they use their CPU cluster due to their scale.

        - Different model architectures, service uses cases.

- Load testing

        - Customer requirements:

                - E.g., 20ms, p999 (99.9% reliability?), 1k requests/s/CPU

        - Load testing framework:

                - Size, CPU, RAM.

                - TF threading parameters (inter, intra-op parallelism, OMP
                  thread configuration).

                - Post-mortem debugging "deep-dive" code?

- Latency optimization:

        - Backup requests.

- Reliability Challenge:

        - Memory leaks.

        - Performance degradation.

        - Regressions.

- In-house performance testing framework

        - Automatic performance tests: latency, RAM, CPU usage for "golden set
          of models".

        - Memory leaks: JVM object histogram over time (JHAT), jemalloc with leak detection.

        - Memory fragmentation: jemalloc, tcmalloc.

                - pmap over time.
