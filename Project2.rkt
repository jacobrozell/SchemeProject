#lang racket
(require (planet dyoo/simply-scheme:1:2/simply-scheme) )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Project 2 - Jacob Rozell (jcr0058)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Create Procedures
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Ball-Val
(define (ball-val color)
  (let ((ball color))
    (cond ((equal? 'W ball) 1)
          ((equal? 'R ball) 10)
          ((equal? 'G ball) 15)
          ((equal? 'B ball) 20))))

;; Count-balls
(define (count-balls color bucket)
  (count
   (keep (lambda (c) (equal? color c)) bucket)))

;; Color-counts ;;;;;;;;;;;;;;;;;;;LAST ONE;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Red / Green / Blues / Whites
(define (color-counts bucket)
  (let ([R (count-balls 'R bucket)]
        [G (count-balls 'G bucket)]
        [B (count-balls 'B bucket)]
        [W (count-balls 'W bucket)])
    (display (list R G W B))))


;; Bucket-val
(define (bucket-val bucket)
  (let ((score 0))
    (apply + (map (lambda (c) (+ score (ball-val c))) bucket))))

;; Judge
(define (judge bucket_1 bucket_2)
  (let ((score1 (bucket-val bucket_1) ))
    (let ((score2 (bucket-val bucket_2) ))
      (cond ((> score1 score2) "Bucket 1, won!")
            ((> score2 score1) "Bucket 2, won!")
            ((equal? score1 score2) "It's a tie!")))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Call Procedures / Driver
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Create bucket1/bucket2 varibles:
(define bucket1 '(R B G R R R B W R W))
(define bucket2 '(W R R R R G B B G W))

;; Call Judge
(display "Judge decision: ")
(judge bucket1 bucket2)

;; Call bucket-val for bucket1
(display "Bucket 1 score: ")
(bucket-val bucket1)

;; Call bucket-val for bucket2
(display "Bucket 2 score: ")
(bucket-val bucket2)

;; Call color-counts for bucket 1
(display "Color Counts for Bucket 1: ")
(color-counts bucket1)
(newline)
;; Call color-counts for bucket 2
(display "Color Counts for Bucket 2: ")
(color-counts bucket2)







