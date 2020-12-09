[![MELPA](https://melpa.org/packages/dispwatch-badge.svg)](https://melpa.org/#/dispwatch)

# Emacs dispwatch #

This package watches the current display configuration (name, pixel width and height,
physical dimensions, and work area) and gives your hook a call if it changes.
Intended use case is plugging/unplugging a monitor.

## Usage ##

Require or use-package this. Make a hook function which takes one argument, a pair of
pixel width and height, like `(1024 . 768)`, then add your hook to
`dispwatch-display-change-hooks`. You will get called when that changes, eg by removing
or adding a monitor.  Then call `(dispwatch-mode 1)` to get started and `(dispwatch-mode -1)`
to stop. `(dispwatch-mode)` toggles.

## Example ##

```lisp
(defun my-display-changed-hook (disp)
  (message "rejiggering for %s" disp)
  (cond ((equal disp '(3840 . 1080))   ; laptop + ext monitor
         (setq font-size-pt 10))
        ((equal disp '(1920 . 1080))    ; just laptop
         (setq font-size-pt 11))
        (t (message "Unknown display size %sx%s" (car disp) (cdr disp)))))

(use-package dispwatch
  :config (and
      (add-hook 'dispwatch-display-change-hooks #'my-display-changed-hook)
      (dispwatch-mode 1)))
```

## TODO ##

* This could be included as part of [ewmctrl](https://github.com/flexibeast/ewmctrl), more generally saving and restoring different sets of window configurations as the geometry changes. I have [an open issue](https://github.com/flexibeast/ewmctrl/issues/13) with those guys to discuss. Alternatively, this package can also stand by itself and be used by a window saver/restorer.
