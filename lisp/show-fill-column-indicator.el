;;; show-fill-column-indicator.el --- find file (or url) at point

;; Copyright (C) 2018 Free Software Foundation, Inc.

;; Author: Henrik Nyman <henrikjohannesnyman@gmail.com>
;; Maintainer: emacs-devel@gnu.org
;; Created: 06 Mar 2018
;; Keywords: buffer fill-column

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Provides a minor mode interface for `show-fill-column-indicator'.
;;
;; Toggle displaying of fill column indicator with M-x
;; show-fill-column-indicator-mode.  To enable fill column indicator
;; in all buffers, use M-x global-show-fill-column-indicator-mode.

;;; Code:

(defgroup show-fill-column-indicator nil
  "Display line numbers in the buffer."
  :group 'convenience
  :group 'display)

(defcustom display-line-numbers-type t
  "The default type of line numbers to use in `display-line-numbers-mode'.
See `display-line-numbers' for value options."
  :group 'show-fill-column-indicator
  :type 'boolean
  :version "26.1")

;;;###autoload
(define-minor-mode show-fill-column-indicator-mode
  "Toggle display of fill column indicator in the current buffer.

The indicator will be drawn at `fill-column'th column of the buffer."
  :lighter nil
  (if show-fill-column-indicator-mode
      (setq show-fill-column-indicator t)
    (setq show-fill-column-indicator nil)))

(defun show-fill-column-indicator--turn-on ()
  "Turn on `show-fill-column-indicator-mode'."
  (unless (or (minibufferp)
              ;; taken from linum.el
              (and (daemonp) (null (frame-parameter nil 'client))))
    (show-fill-column-indicator-mode)))

;;;###autoload
(define-globalized-minor-mode global-show-fill-column-indicator-mode
  show-fill-column-indicator-mode show-fill-column-indicator--turn-on)

(provide 'show-fill-column-indicator)
;;; show-fill-column-indicator.el ends here
