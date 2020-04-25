;;; init.el --- Load the full configuration -*- lexical-binding: t -*-

;;; Code:

;; lisp dir
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; package.el
(require 'init-elpa)

;; 標準の設定

;; guiで起動していたら、メニューなどを表示しない
(when window-system
    (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1))

;; テーマ
(load-theme 'wombat t)

;; 現在行のハイライト
(global-hl-line-mode t)

;; 対応する括弧のハイライト
(show-paren-mode t)

;; サードパーティーの設定

;; 言語設定
(set-language-environment "Japanese")		; 言語環境を"japanese"に
(prefer-coding-system 'utf-8)			; デフォルトの文字コードをUTF-8に
(set-default 'buffer-file-coding-system 'utf-8)

;; mozc
(setq default-input-method "japanese-mozc")	; IMEをjapanese-mozcに
(global-set-key (kbd "C-j") 'toggle-input-method)

;; auto-complete
(package-install 'auto-complete)
(when (require 'auto-complete-config nil t)
  ;; (global-auto-complete-mode t)
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default)
  (setq ac-use-menu-map t)
  (setq ac-ignore-case nil))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (gnu-elpa-keyring-update fullframe seq mozc auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
