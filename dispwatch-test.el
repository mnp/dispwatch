;;; dispwatch-test.el --- Unit tests -*- Lisp-Interaction-Mode; lexical-binding: t -*-

(require 'cl)

(defun count-dispwatch-timers ()
  (count-if (lambda (x)
	      (eq 'dispwatch--check-display (elt x 5)))
	    timer-list))

(ert-deftest enable-disable ()
  (let ((saved dispwatch-mode))
    ;; start with none
    (should (null (dispwatch-mode -1)))
    (should (= 0 (count-dispwatch-timers)))
    (should (null dispwatch-mode))

    ;; enable should add the timer
    (should (eq t (dispwatch-mode 1)))
    (should (= 1 (count-dispwatch-timers)))
    (should dispwatch-mode)

    ;; enable again should still have only one timer
    (should (eq t (dispwatch-mode 1)))
    (should (= 1 (count-dispwatch-timers)))
    (should dispwatch-mode)

    ;; disable should have none
    (should (null (dispwatch-mode -1)))
    (should (= 0 (count-dispwatch-timers)))
    (should (null dispwatch-mode))

    ;; restore
    (dispwatch-mode (if saved 1 -1))))


