# About

This is a small example of code calculating the factorial of a positive integer.

It is written to demonstrate some design examples, such as:

* Modular code structure with classes
* Using AutoTests (Test::More) and Performance Tests (Benchmark)
* Integration of third-party code into Perl code (Inline::CPP)
* 

# Usage

```
$ apt-get install cpanm
$ cpanm --installdeps .
$ perl ./performance_benchmark.pl
```

# Performance

For a laptop on an i3 processor, the result looks like this

```
                  Rate    Tree (perl) Trivial (perl)  Trivial (c++)
Tree (perl)     6.90/s             --           -94%          -100%
Trivial (perl)   117/s          1588%             --           -99%
Trivial (c++)  11351/s        164350%          9643%             --
```