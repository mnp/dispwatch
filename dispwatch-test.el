;;; dispwatch-test.el --- Unit tests -*- Lisp-Interaction-Mode; lexical-binding: t -*-

(defun count-dispwatch-timers ()
  (count-if (lambda (x)
	      (eq 'dispwatch--check-display (elt x 5)))
	    timer-list))

(ert-deftest enable-disable ()
  ;; enable should add the timer
  (should (eq t (dispwatch-mode 1)))
  (should (= 1 (count-dispwatch-timers)))

  ;; enable again should still have only one timer
  (should (eq t (dispwatch-mode 1)))
  (should (= 1 (count-dispwatch-timers)))

  ;; disable should have none
  (should (eq nil (dispwatch-mode -1)))
  (should (= 0 (count-dispwatch-timers))))


  

