Format swift buffer with https://github.com/apple/swift-format

```elisp
(use-package swift-format
  :load-path "path/to/swift-format"
  :after swift-mode
  :hook
  (swift-mode . (lambda ()
                  (add-hook 'before-save-hook 'swift-format-buffer nil t))))
```
