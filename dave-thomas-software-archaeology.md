# Dave Thomas (author of The Pragmatic Programmer) on software archaeology


General point: read for fun and education, not just to fix bugs. E.g., when you
notice your software has an interesting feature, look at the source code to see
how that feature is implemented.


## Static software reading

- Initially, open all of the files in the codebase in a text editor with a tiny
  font, in order to see the high level structure of the code (without actually
  reading it). Scroll through this a few times.

- Find the application code, and start reading in more detail there. This is
  usually in the largest file, e.g., a file that has a 400 line function is
  probably controlling the application.

        - Use grep -n to count domain knowledge words (e.g., "postage" in a
          shipping program).

        - Use grep | grep -v (invert match) to filter an avalanche of grep
          matches.

        - Learn awk. Learn command line tools for source code parsing in
          general.

- Put the code in a VCS, and add annotations (in the form of comments) to the
  code as you work through it.


## Dynamic software reading

- Can use debugger/printf to isolate specific known problems.

- For widepread coverage, set exceptions (asserts) at interesting points to
  look at the backtrace.

- Execution profiler to see program flow.

- If unit tests exist, run those, and read them to see how they work. Debug
  failures (within reason).

- Write your own tests for the code. As you read, come up with hypotheses about
  how the code works. Write unit tests to test those hypotheses, and of course
  check those tests into the VCS.
