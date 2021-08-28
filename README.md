# Guile Pipe

Guile pipe macros for functional chaining, similar to the UNIX pipe "|" operator.

Provides identical functionality to Clojure's function threading macros (-> and ->>).

## Requirements

[Guile](http://www.gnu.org/software/guile/) is required.

## Installation

Run `sudo ./install` to install pipe to Guile's site-dir folder.

## Alternative Installation

The [guixrus channel](https://git.sr.ht/~whereiseveryone/guixrus) also provides guile-pipe.

After [adding guixrus](https://git.sr.ht/~whereiseveryone/guixrus#permanent) to your [channels.scm](https://guix.gnu.org/manual/en/html_node/Using-a-Custom-Guix-Channel.html) run the following:

`guix install guile-pipe-guixrus`

## Usage

Import pipe with

```scheme
(use-modules (pipe))
```

You can then use the thread-first `->` and thread-last `->>` macros like so:

```scheme
guile> (-> 100 (/ 10) (/ 5))
2

guile> (->> 100 (/ 10) (/ 5))
50
```

### Thread first macro ->

The first s-expression will be inserted as the first argument of the next s-expesssion.
Example: `(-> 100 (/ 10) (/ 5))` becomes `(/ (/ 100 10) 5)`

### Thread last macro ->>
The first s-expression will be inserted as the last argument of the next s-expesssion.
Example: `(-> 100 (/ 10) (/ 5))` becomes `(/ 5 (/ 10 100))`

## License

Pipe is released under the GNU GPLv3 license.
