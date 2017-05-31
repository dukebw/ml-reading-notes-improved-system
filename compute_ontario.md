# Compute Ontario Notes

## C++ for HPC

- Support for concurrency standardized in C11/C++11.
        - Memory model.
                - Guarantees for sequential/concurrent memory accesses.
        - atomics/threads with locks/condition_variables/mutexes
        - futures/promises/packaged_tasks/async

- Two ampersands side-by-side: rvalue reference.
- In C++98, `const&` acceptions _both_ lvalue and rvalue references.
- C++ standard explicitly leaves memory location of references ambiguous, to
  allow compiler optimizations.

- C++98: copy semantics.
        - Four things specially named in a class:
                - Default constructor.
                - Copy constructor.
                        - `foo f = x;`, where `x` is of type `foo`.
                        - No previous instance.
                        - `A(A const& b) {}`
                        - Concurrency-related objects often cannot be
                          initialized with copy; need curly braces for move.
                - Copy-assignment operator.
                        - Previous instance. Has to deal with already-acquired
                          resources.
                        - `A& operator=(A const& b) {}`
                        - Lifetime of an object in C++ starts the moment after
                          its constructor
                - Destructor.
                        - Release resources allocated in constructor.
                        - Should never leak exceptions.

- Copy/move elision:
        - Introduced in C++98 standard.
        - Should the cost of copying or moving an object ever appear to be
          zero, the compiler can perform copy elision instead.
        - Optimizes away constructor/deconstructor pair class even in the case
          that those calls have side effects.
        - Can be avoided, e.g. using `volatile` keyword.

- C++11: move semantics.
        - Re-using already-allocated memory.
        - In the worst case, becomes O(copying data).
        - Can often be the cost of copying a pointer.
        - Easy way to use move semantics is not to use &&.
                - Write move constructor and move assignment operators.

- References: Rightmost ornament is an & (or &&).
        - References conceptually equivalent to `const` pointer.
                - `T * const` <=> `T&`
                - `T const * const` <=> `const T&`
                - `T` <=> `T&&`
                - `T const` <=> `T const&&`

- An lvalue is a value/variable that has a _user-defined name_.
- An rvalue does not have a user-defined name.

- `std::move` takes an lvalue and casts it to an rvalue.
        - Conceptually, move concerns ownership (responsibility of cleaning up
          the data is transferred).
        - E.g. moving objects around from thread-thread in a multi-agent
          simulation that uses multi-programming.
                - If only one thread owns the data (has access to its memory),
                  there is no contention.

- Multiple `new`s in initializer list: if earlier `new` is not `unique_ptr` or
  `shared_ptr` and later `new` fails, memory will be leaked since the
  constructor calls are unrolled.

- `A operator+(A&& b) const` <-- `const` here means that the `this` object is
  constant.
        - If we only invoke read-only operations on a type, it can be moved out
          of loops.

- `std::accumulate` vs. `std::reduce`: accumulate has a well-defined order.
- C++17 has defined versions of standard library functions for
  multi-programming.
- C++17: statistically tested RNGs.
- Modules added in C++20

### When to use move/forward

- Use `std::move()` when non-`const` lvalue needs to be moved.

- Use `std::forward<T>(value)` when `value`'s type can be an lvalue or rvalue
  reference, since `value`'s type is a template parameter.

- Use `std::forward<T>(value)` to do "perfect forwarding": pass the argument
  along exactly the way it was passed to the current function.

### Sharcnet

- `module list`
- `module unload intel openmpi/intel`
- `module avail gcc`
- `module load gcc/7.1.0`

### Concurrency

- `-pthread` needed to use any of the standard C++ threading stuff.

- `std::thread`
        - After creation must call either `detach()` or `join()`.
                - `detach()` runs the thread, and the caller must never
                  `join()` it.
        - Uncaught exceptions in the thread will call `std::terminate()`.
        - Threads are move only.
        - `get_id()` to get thread's ID.
        - `hardware_concurrency()` retrieves the number of hardware threads.
                - If using a threaded job on SHARCNET, and want to use
                  `hardware_concurrency()`, need to ask for the whole node
                  (since the node may otherwise be shared with other people).
        - Two more functions: get cache-line sizes and alignment of types.

- Using `std::lock_guard` (with RAII to release lock) works even when
  exceptions occur (?).
- Use `<chrono>` header for sleep: `sleep_for`, `sleep_until`.
- `std::vector` can contain move-only, e.g. `std::thread`, objects.

## Programming clusters with MPI

- Message-passing library for communication between distributed-memory
  machines.

- General MPI program structure:
        - MPI include files
        - (Serial code)
        - Initialize MPI environment (parallel code begins)
                - `MPI_Init(&argc, &argv)`
        - Do work and make message passing calls.
        - Terminate MPI environment.
                - `MPI_Finalize()`
        - (Serial code)

- `MPI_Comm_size`
