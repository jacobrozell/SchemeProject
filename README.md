# Scheme - Lee County Funfair


### Quick start
1) Download [Dr. Racket](https://download.racket-lang.org/)
2) Open a new file.
3) Put the following line at the top of the file: 

```scheme
#lang racket
(require (planet dyoo/simply-scheme:1:2/simply-scheme) )

```

# Table of Contents
* [Summary](#summary)
* [API](#API)

___

#### Summary
The idea behind the project is as follows:
Lee county is organizing a county fair over the upcoming summer. You along with one
other friend plan to participate in several games including the bucket ball game. Each
player will be assigned a bucket to start with and the player that gets the bucket with the
highest worth wins the game. The worth of each bucket is calculated as per the rules
below. 

A bucket contains 10 balls of four different colors – red, blue, white, and green. Each
red is worth 10 points, each green is worth 15 points, each blue ball is worth 20 points,
and each white ball is worth 1 point. 

**You are going to write a computer program in
Scheme to look at a bucket and decide how many points it’s worth.**
___

### API

## ball-val
```scheme
(define (ball-val color)
  (let ((ball color))
    (cond ((equal? 'W ball) 1)
          ((equal? 'R ball) 10)
          ((equal? 'G ball) 15)
          ((equal? 'B ball) 20))))
```
```scheme
(ball-val 'R)
```
#### The procedure ball-val takes a color as an argument and returns how many points that color is worth.
___

## count-balls
```scheme
(define (count-balls color bucket)
  (count
   (keep (lambda (c) (equal? color c)) bucket)))
```
```scheme
(count-balls 'R '(R B G R R R B W R W))
```
#### The procedure count-balls takes a color and a bucket as an argument and returns the number of balls in the bucket with the given color.
___

## color-counts
```scheme
(define (color-counts bucket)
  (let ([R (count-balls 'R bucket)]
        [G (count-balls 'G bucket)]
        [B (count-balls 'B bucket)]
        [W (count-balls 'W bucket)])
    (display (list R G W B))))
```
```scheme
(color-counts '(R B G R R R B W R W))
```
#### The procedure color-counts takes a bucket as an argument and returns a
#### sentence containing the number of reds, the number of green, the number of blues, and
#### the number of whites in the bucket.
___

## bucket-val
```scheme
(define (bucket-val bucket)
  (let ((score 0))
    (apply + (map (lambda (c) (+ score (ball-val c))) bucket))))
```
```scheme
(bucket-val '(R B G R R R B W R W))
```
#### The procedure bucket-val takes a bucket as an argument and returns the total
#### number of points that the bucket is worth.
___

## judge
```scheme
(define (judge bucket_1 bucket_2)
  (let ((score1 (bucket-val bucket_1) ))
    (let ((score2 (bucket-val bucket_2) ))
      (cond ((> score1 score2) "Bucket 1, won!")
            ((> score2 score1) "Bucket 2, won!")
            ((equal? score1 score2) "It's a tie!")))))
```
```scheme
(judge '(R B G R R R B W R W) '(W R R R R G B B G W))
```
#### The procedure judge takes two arguments bucket_1 and bucket_2 and returns
#### which player won the game.
___

#### License
Auburn University
___

## Author
Jacob Rozell
