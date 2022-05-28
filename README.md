Emacs format swift file with https://github.com/apple/swift-format

```elisp
(use-package swift-format
  :load-path "path/to/swift-format"
  :hook
  (swift-mode . (lambda ()
                  (add-hook 'before-save-hook 'swift-format-buffer nil t))))
```
