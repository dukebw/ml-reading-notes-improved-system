# Learning-based learning systems


- XGBoost: A scalable Tree Boosting System

- MXNet: a flexible..

        - Training deep nets with sublinear memory cost

        - Distributed training with two-level param. server

- TVM ODSI paper, Neurips 2018 paper

- Operator fusion optimizations _exhaust_ bandwidth of current manual
  engineering efforts for designing low-level tensor operations.

        - Directly optimize low-level fused tensor op with TVM.

- Supported optimizations: loop tiling, accelerator primitives.

- Statistical cost model \hat{f}(e, c) using training data of running
  expressions from search space on hardware.

        - Low experimental cost compared to other, e.g., Bayes opt.
          applications.

                - Statistical cost model must be fast to train and predict.

- Program aware modeling:

        - Take configuration: size/order of loops, threading choices, memory
          scope and flatten into feature vector. Directly feed into favourite
          model.

                - Ignores domain knowledge.

        - High-level config -> AST. Extract statistcal features of AST directly
          to low-level cost model.

                - Can build a task-invariant model, since AST representation is
                  common across tasks.

- Taking advantage of fused ops?

- Reproducing the NeurIPS experiments?

- Using TVM for unstructured pruned tensor ops?

- End-to-end based learning of entire system stack:

        - The rest of TVM, besides AutoTVM.

        - AutoTVM based on Halide, Loopy.

        - Tensorization challenge for fixed-function accelerators such as TPU.

        - Memory subsystem of TPU (memory latency hiding).

                - Lower a high-level multi-threaded program into a pipelined
                  dependency graph of fixed-function calls to an accelerator.

- VTA open accelerator architecture.

- New research frontiers:

        - high-level diff'able programming IR

        - new architectures (accelerators), RISC-V

        - trusted enclave

        - ML: test bed for automatic optimization.

- TVM conference.

- Next:

        - Full-stack AutoTVM: optimize net, tensor op jointly

        - Lifelong learning systems.

                - Net2net ICLR 2016.

                - Smart data acquisition, task prioritization.

                - Build real-world learning systems as test beds
                  (with learning-based learning systems as starting point).

- Comments:

        - Extend to models whose runtime depends on the data (future direction).

        - How can the programmer take advantage of domain specific knowledge
          when using TVM? Specify microkernels.

        - Device placement optimization (future work).
