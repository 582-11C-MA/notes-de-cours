#lang slideshow

(current-main-font "Georgia")

(define (t text)
  (para #:decode? #t text))
(define (i text)
  (item #:decode? #t text))

(slide
  #:title "Comment on enseigne l'arithmétique"
  'alts
  (list (list (t "1 + 1 = 2")
        'next (t "1 + 2 = 3")
        'next (t "1 + 3 = ?"))
        (list (t "1 + 1 = 2 ← programmeur·se")
              (t "1 + 2 = 3 ← programmeur·se")
              (t "1 + 3 = ? ← ordinateur"))))

(slide
  #:title "Langage de programmation"
  (t "Qu'est-ce que c'est ?")
  'next (i "Un outil pour donner des instructions")
  'next (i "Un outil pour organiser des idées"))
(slide
  #:title "Comment organiser les idées"
  'next (t "Trois mécanismes :")
  'next (i "expressions atomiques")
  'next (i "moyens de combinaisons")
  'next (i "moyens d'abstraction"))
