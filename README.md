# Rosette-Example-Usage

I tried using each of the types of solver aided queries and was not successful with all of them, but I learned some things about Rosette while trying a few problems out. I tried a few simple problems since I already coded up someone else's example about factoring polynomials for the class presentation, and I still didn't know how each of the types of queries could be coded after researching for the presentation.

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


### Failed Attempt

I also tried to make a program that would simplify any simple arithmatic expression into the form `(a/b) x + c`, but I learned that Rosette throws errors if you try to add multiple holes in an expression (ex. `(/ (??) (??))`. 

I tried the following forms to see if it was an issue with the order or using two holes in a binary expression but none worked. I also looked up the error it threw online, and all I could find was a stackoverflow thread about the same error being thrown when there were unnecessary partheneses which didnt apply to this issue. I also tried using rational numbers rather than an `a/b` term and it threw an error about needing a solvable type.
  ```
  (+ (/ (* x (??)) (??)) (??))
  (+ (* x (/ (??) (??))) (??))
  (+ (* x (??) (/ 1 (??))) (??)))
  ```

## Solve

### solve_expression.rkt

Takes an arithmatic expression and solves for `x`. Can solve for any expression that can be represented by Racket. Example expression: `3x + 2 = 5`

![](https://github.com/sedona-thomas/Rosette-Example-Usage/blob/main/Outputs/solve_expression.png?raw=true)

### Failed Attempt

I also tried to use the example from [Growing Solver-Aided Languages with ROSETTE](https://homes.cs.washington.edu/~emina/doc/rosette.onward13.pdf) to learn more about using structs to 

## Verify

I tried getting verify to output a useful binding, but it seems to require you to access the verification condition (the Rosette structure that stores the values of all assertions). I tried using it like `solve` to try to output bindings for a counterexample, but it only outputted an empty model.
