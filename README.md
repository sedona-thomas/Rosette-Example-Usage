# Rosette-Example-Usage

I tried using each of the types of solver aided queries and was not successful with all of them, but I learned some things about Rosette during the process. I tried a few simple problems since I had already coded up someone else's example about factoring polynomials for the class presentation, and I still didn't know how each of the types of queries could be coded after researching for the presentation. I decided against a more complicated problem since there was still a lot of confusion using Rosette and it seemed more appropriate to try to better understand how the basic structure of Rosette works. I also included some failed attempts and what I learned from them, including an attempt to run the DOM example from the Rosette paper.

## Synthesize

### simplify_expression.rkt

Takes a messy arithmatic expression and simplifies it into `ax + b` form. It can have any combination of addition, subtraction, multiplication, and division as long as the exponent of x when expended out is 1 (no division by x).

![](https://github.com/sedona-thomas/Rosette-Example-Usage/blob/main/Outputs/simplify_expression.png?raw=true)

### factor_polynomial.rkt

Example code from the class presentation. Takes a complicated polynomial and factors into terms. All you need to know is the degree of the polynomial to manually add that many terms with holes to be filled in.

![](https://github.com/sedona-thomas/Rosette-Example-Usage/blob/main/Outputs/factor_polynomial.png?raw=true)

### expand_polynomial.rkt

Adapted from factor_polynomial.rkt to take a factored polynomial and expand it out. All you need to know is the number of terms in the factored polynomial to add that many `((* x^y (??)) (??))` terms where y is every number <= the number of terms in the fatcored polynomial.

![](https://github.com/sedona-thomas/Rosette-Example-Usage/blob/main/Outputs/expand_polynomial.png?raw=true)

## Solve

### solve_expression.rkt

Takes an arithmatic expression and solves for `x`. Can solve for any expression that can be represented by Racket. Example expression: `3x + 2 = 5`

![](https://github.com/sedona-thomas/Rosette-Example-Usage/blob/main/Outputs/solve_expression.png?raw=true)

## Verify

I tried getting verify to output a useful binding, but it seems to require you to access the verification condition (the Rosette structure that stores the values of all assertions). I tried using it like `solve` to try to output bindings for a counterexample, but it only outputted an empty model.

## Additional Failed Attempts to Learn More About Rosette

### Synthesis: Failed Attempt with Too Many Holes

I also tried to make a program that would simplify any simple arithmatic expression into the form `(a/b) x + c`, but I learned that Rosette throws errors if you try to add multiple holes in an expression (ex. `(/ (??) (??))`.

I tried the following forms to see if it was an issue with the order or using two holes in a binary expression but none worked. I also looked up the error it threw online, and all I could find was a stackoverflow thread about the same error being thrown when there were unnecessary partheneses which didnt apply to this issue. I also tried using rational numbers rather than an `a/b` term and it threw an error about needing a solvable type.

  ```rkt
  (+ (/ (* x (??)) (??)) (??))
  (+ (* x (/ (??) (??))) (??))
  (+ (* x (??) (/ 1 (??))) (??)))
  ```

### Solve: Failed Attempt with the String Data Type

I also tried to use the example from [Growing Solver-Aided Languages with ROSETTE](https://homes.cs.washington.edu/~emina/doc/rosette.onward13.pdf) to learn more about using structs with Rosette, but I was unable to get the solver to work. For the presentation, Raven and I were still unsure exactly what was going on in the Document Object Model example for finding z-paths, so I tried to get the code snippet from the paper to run in Rosette.

When I ran each of the solve/generalize code snippets from the text, they returned that `string? is not a solvable type` and that generalize is not recognized by Rosette. I tried looking through the documentation to figure out why the string type was being rejected, and it seems that string is not a "lifted" data type that can be used as a symbolic constant. It seems that when the initial paper was written, Rosette was able to handle different data types than the current version (similar to the change with verify/debug queries).

The documentation also described how Racket structs are accepted by Rosette in the same form used in the example, but the examples in the documentation only contain data types explicitly listed for Rosette. It seems that the structs could require all values to be Rosette data types, but I could not find a clear answer to this in the documentation.
