
;;
;; パッケージリストの追加
;;

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;;
;; key-settings
;;

(keyboard-translate ?\C-h ?\C-?)

;;
;; color-theme
;;
(load-theme 'flatland t)

;;
;; backup fileを作らない
;;
;;; *.~のbackup file
(setq make-backup-files nil)
;;; .#*のbackup file
(setq auto-save-default nil)

;;
;; auto-complete
;;
(require 'auto-complete-config)

(global-auto-complete-mode t)
(ac-config-default)

;;
;; nlinum-mode 行表示
;;
;; バッファの左側に行番号を表示する
(global-nlinum-mode t)
;; 5桁分の表示領域を確保する
(setq nlinum-format "%5d")


;; 
;; undo-tree
;; 
;; undo-treeを読み込む
(require 'undo-tree)

;; undo-treeを起動時に有効にする
(global-undo-tree-mode t)

;; M-/をredoに設定する
(global-set-key (kbd "M-/") 'undo-tree-redo)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a2e7b508533d46b701ad3b055e7c708323fb110b6676a8be458a758dd8f24e27" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "cdfc5c44f19211cfff5994221078d7d5549eeb9feda4f595a2fd8ca40467776c" "a4c9e536d86666d4494ef7f43c84807162d9bd29b0dfd39bdf2c3d845dcc7b2e" default)))
 '(package-selected-packages
   (quote
    (markdown-mode flatland-theme zenburn-theme yaml-mode web-mode nlinum anything php-completion php-mode rbenv undo-tree auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;
;; rbenv.el
;;

(require 'rbenv)
(global-rbenv-mode)

(setq rbenv-installation-dir "/usr/local/bin/rbenv")

;;
;; electric-pair-mode
;;

(electric-pair-mode t)
(add-to-list 'electric-pair-pairs '(?| . ?|))
 

;;
;; php-mode 
;;

(require 'php-mode)

;;
;; php-completion
;;

;; php-mode-hook
(add-hook 'php-mode-hook
	  (lambda ()
            (require 'php-completion)
            (php-completion-mode t)
            (define-key php-mode-map (kbd "C-o") 'phpcmp-complete) ;php-completionの補完実行キーバインドの設定
            (make-local-variable 'ac-sources)
            (setq ac-sources '(
                               ac-source-words-in-same-mode-buffers
                               ac-source-php-completion
                               ac-source-filename
                               ))))

;;
;; web-mode 
;;

(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

;;
;; yaml-mode
;;

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))
(define-key yaml-mode-map "\C-m" 'newline-and-indent)

;;
;; markdown-mode
;;

(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
