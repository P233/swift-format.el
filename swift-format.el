(defvar swift-format-program "swift-format"
  "The executable swift-format cammand.")

(defun swift-format--call (cur-buffer output-buffer-name)
  "Execute the swift-format command. Process CUR-BUFFER in the OUTPUT-BUFFER-NAME buffer."
  (with-current-buffer (get-buffer-create output-buffer-name)
    (erase-buffer)
    (insert-buffer-substring cur-buffer)
    (if (zerop (shell-command-on-region (point-min) (point-max) swift-format-program cur-buffer t output-buffer-name))
        (progn (copy-to-buffer cur-buffer (point-min) (point-max))
               (kill-buffer))
      (display-buffer output-buffer-name)
      (error "Format failed, see the %s buffer for details" output-buffer-name))))

;;;###autoload
(defun swift-format-buffer ()
  "Format the current buffer with swift-format."
  (interactive)
  (unless (executable-find swift-format-program)
    (error "Could not locate executable \"%s\"" swift-format-program))

  (let ((cur-point (point))
        (cur-win-start (window-start))
        (output-buffer-name "*swift-format*"))
    (swift-format--call (current-buffer) output-buffer-name)
    (goto-char cur-point)
    (set-window-start (selected-window) cur-win-start))
  (message "Formatted buffer with swift-format."))


(provide 'swift-format)
