# Emacs dispwatch #

This package watches the current display geometry (pixel width and height) and gives your
hook a call if it changes.  Intended use case is plugging/unplugging a monitor.

## Usage ##

Require or use-package this. Make a hook function which takes one argument, a new display
string like "1024x768". Add your hook to `dispwatch-display-change-hooks'. You will get
called when that changes, eg by removing or adding a monitor.  Then call `dispwatch-enable'
to get started and `dispwatch-disable' to stop.

## Example ##

```lisp
(defun my-display-changed-hook (disp)
  (cond ((equalp disp "3840x1080")   ; laptop + ext monitor
	 (setq font-size-pt 10))
	((equalp disp "1920x1080")      ; just laptop
	 (setq font-size-pt 12))))

(add-to-list 'load-path (expand-file-name "~/prj/dispwatch/"))

(use-package dispwatch
  :config (progn
	  (add-hook 'dispwatch-display-change-hooks #'my-display-changed-hook)
	  (dispwatch-enable)))
```

## TODO ##

* Elpa/melpa package?
* This could be included as part of [ewmctrl](https://github.com/flexibeast/ewmctrl), more generally saving and restoring different sets of window configurations as the geometry changes. I have [an open issue](https://github.com/flexibeast/ewmctrl/issues/13) with those guys to discuss. Alternatively, this package can also stand by itself and be used by a window saver/restorer.
