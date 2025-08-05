# General
parallel echo ::: A B C                                             parallel echo using A B and C as inputs
parallel echo ::: $(cat file.txt)                                   parallel echo everything inside file.txt (line-based)
parallel echo :::: file.txt                                         same as above (shortcut)

## Arguments
--verbose                                                           print commands that are being run
-j N                                                                run N jobs in parallel
-j+k                                                                run as many jobs as there are CPUs + k additional ones (e.g. -j+0 for same number of jobs as CPUs)
--link                                                              join input lists together (instead of running every possible combination, see "Combinations of parameters)

## Piping into parallel
cat file.txt | grep "2" | parallel echo "hello"                     appends everything from grep to echo "hello"...

## Combinations of parameters
parallel echo ::: A B C ::: 1 2 3                                   do every possible combination of arguments (A1, A2, A3, B1, ... C3)
parallel --link echo ::: A B C ::: 1 2 3                            link two "lists" of inputs (A1, B2, C3)
parallel ./my_script.sh {2} --flag {1} ::: A B C ::: 1 2 3          control where certain input lists are going to be placed
