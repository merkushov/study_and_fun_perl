# About

This is a small example of code calculating the factorial of a positive integer.

It is written to demonstrate some design examples, such as:

* Modular code structure with classes
* Using AutoTests (Test::More) and Performance Tests (Benchmark)
* Integration of third-party code into Perl code (Inline::CPP)
* Used the Multiple Precision Arithmetic Library (gmplib)

# Usage

```
$ apt-get install cpanm
$ cpanm --installdeps .
$ perl ./performance_benchmark.pl
```

# Performance

For a laptop on an i3 processor, the result looks like this

```
                            Rate Tree (perl) Trivial+recursion (perl) Trivial (perl) Trivial (c++)
Tree (perl)               7.92/s          --                     -87%           -93%         -100%
Trivial+recursion (perl)  61.7/s        679%                       --           -49%         -100%
Trivial (perl)             121/s       1433%                      97%             --          -99%
Trivial (c++)            12618/s     159196%                   20341%         10289%            --
```