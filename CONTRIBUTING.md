# How to contribute

Thank you for your interest in contributing to this utilities collection!

## Testing

Unfortunately, we don't know a tool to test the code automatically. Therefore, every change needs to be tested manually on one of our development PLCs.

Please test your changes if you have access to one or more PLCs.

## Submitting changes

Please send a [GitHub Pull Request to structured-text-utilities](https://github.com/WengerAG/structured-text-utilities/pull/new/master) with a clear list of what you've done (read more about [pull requests](http://help.github.com/pull-requests/)). Please follow our coding conventions (below) and make sure all of your commits are atomic (one feature per commit).

Always write a clear log message for your commits. One-line messages are fine for small changes, but bigger changes should look like this:

    $ git commit -m "A brief summary of the commit
    > 
    > A paragraph describing what changed and its impact."

## Coding conventions

Start reading our code and you'll get the hang of it. We optimize for readability:

  * We indent using tabs.
  * We ALWAYS put spaces after list items and method parameters (`[1, 2, 3]`, not `[1,2,3]`) and around operators (`x + 1`, not `x+1`).
  * In most cases, function names starts with a verb (e.g. `CALCULATE_LREAL_ARRAY_STATISTICS`), exceptions are acceptable if internal functions are similar (e.g. `STRING_TO_INT`) or an adjective after a noun suits better (e.g. `STRING_ENDSWITH`).
  * We avoid BOOL parameters in functions. If a function provides different modes or formats (or will do it in near future), add an ENUM type parameter with meaningful names (e.g. `TIME_FORMAT : (ISO8601);`).
  * This is open source software. Consider the people who will read your code, and make it look nice for them. It's sort of like driving a car: Perhaps you love doing donuts when you're alone, but with passengers the goal is to make the ride as smooth as possible.

Thanks!