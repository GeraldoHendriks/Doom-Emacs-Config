(setq user-full-name "Geraldo Hendriks"
      user-mail-address "geraldohendriks@gmail.com")

(setq fancy-splash-image "~/.doom.d/Emacs-logo.svg")

(setq doom-theme 'doom-one)

(map! :leader
      :desc "Load new theme" "h t" #'counsel-load-theme)

(setq display-line-numbers-type t)

(use-package emojify
  :hook (after-init . global-emojify-mode))

(setq ivy-posframe-display-functions-alist
      '((swiper                     . ivy-posframe-display-at-point)
        (complete-symbol            . ivy-posframe-display-at-point)
        (counsel-M-x                . ivy-posframe-display-at-frame-center)
        (counsel-esh-history        . ivy-posframe-display-at-frame-center)
        (counsel-describe-function  . ivy-display-function-fallback)
        (counsel-describe-variable  . ivy-display-function-fallback)
        (counsel-find-file          . ivy-posframe-display-at-frame-center)
        (counsel-recentf            . ivy-posframe-display-at-frame-center)
        (counsel-register           . ivy-posframe-display-at-frame-bottom-window-center)
        (t                          . ivy-posframe-display-at-frame-center)
        (nil                        . ivy-posframe-display))
      ivy-posframe-height-alist
      '((swiper . 20)
        (t . 18)))
(ivy-posframe-mode 1) ; 1 enables posframe-mode, 0 disables it.

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :size 14)
      doom-big-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 24))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(after! org
  (setq org-directory "~/Org/"
        org-agenda-files '("~/Org/agenda.org")
        org-ellipsis " ▼ "
        org-log-done 'time
        org-superstar-headline-bullets-list '("◉" "●" "○" "◆" "●" "○" "◆")
        org-hide-emphasis-markers t
        ;; ex. of org-link-abbrev-alist in action
        ;; [[arch-wiki:Name_of_Page][Description]]
        org-link-abbrev-alist    ; This overwrites the default Doom org-link-abbrev-list
        '(("google" . "http://www.google.com/search?q=")
          ("arch-wiki" . "https://wiki.archlinux.org/index.php/")
          ("ddg" . "https://duckduckgo.com/?q=")
          ("wiki" . "https://en.wikipedia.org/wiki/"))
        org-table-convert-region-max-lines 20000))

(evil-define-key 'normal dired-mode-map
  (kbd "h") 'dired-up-directory
  (kbd "l") 'dired-find-file
  )

(map! :leader
      (:prefix ("e". "ERC")
       :desc "Launch ERC with TLS connection" "E" #'erc-tls))

(setq erc-server "irc.libera.chat"
      erc-nick "ghendriks"
      erc-user-full-name "Geraldo Hendriks"
      erc-email-userid "geraldohendriks@gmail.com")

(setq erc-fill-column 100
      erc-fill-function 'erc-fill-static
      erc-fill-static-center 20
      erc-prompt (lambda () (concat "[" (buffer-name) "]")))

(map! :leader
      :desc "Comment or uncomment lines" "TAB TAB" #'comment-line
      (:prefix ("t" . "toggle")
       :desc "Toggle line numbers" "l" #'doom/toggle-line-numbers)
      )

(elcord-mode)

(custom-set-variables
 '(elcord-editor-icon "emacs_material_icon")
 '(elcord-mode t nil (elcord)))
