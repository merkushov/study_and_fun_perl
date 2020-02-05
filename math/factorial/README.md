# About

This is a small example of code calculating the factorial of a positive integer.

It is written to demonstrate some design examples, such as:

* Modular code structure with classes
* Using AutoTests (Test::More) and Performance Tests (Benchmark)
* Integration of third-party code into Perl code (Inline::CPP)
* Used the Multiple Precision Arithmetic Library (gmplib)
* Memory leak check

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
Tree (perl)               6.97/s          --                     -88%           -94%         -100%
Trivial+recursion (perl)  56.4/s        709%                       --           -50%         -100%
Trivial (perl)             113/s       1522%                     100%             --          -99%
Trivial (c++)            12500/s     179300%                   22063%         10963%            --
```

# BUGS

* `Factorial::TrivialCPP` have a memory leak