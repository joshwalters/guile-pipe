;; Copyright (C) 2015 Josh Walters <josh@joshwalters.com>
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; Pipe macros for functional chaining, similar to the UNIX pipe "|" operator.
;;-Version: 0.1.0
(define-module (pipe)
               #:export (-> ->>)
               #:version (0 1 0))

;; Thread first macro.
;; The first s-expression will be inserted as the firts argument of the next s-expesssion.
;; Example: (-> 100 (/ 10) (/ 5)) becomes (/ (/ 100 10) 5)
(define-syntax ->
  (syntax-rules ()
                ((_) #f)
                ((_ x) x)
                ((_ x (f . (f-rest ...))) (f x f-rest ...))
                ((_ x f) (f x))
                ((_ x (f . (f-rest ...)) rest ...) (-> (f x f-rest ...) rest ...))
                ((_ x f rest ...) (-> (f x) rest ...))
                ))

;; Thread last macro.
;; The first s-expression will be inserted as the last argument of the next s-expesssion.
;; Example: (-> 100 (/ 10) (/ 5)) becomes (/ 5 (/ 10 100))
(define-syntax ->>
  (syntax-rules ()
                ((_) #f)
                ((_ x) x)
                ((_ x (f ...)) (f ... x))
                ((_ x f) `(f x))
                ((_ x (f ...) rest ...) (->> (f ... x) rest ...))
                ((_ x f rest ...) (->> (f x) rest ...))))
