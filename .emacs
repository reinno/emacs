(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(setq user-full-name "lain")
 '(setq user-mail-address "reinno@126.com")
 '(column-number-mode t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "Black" :foreground "SteelBlue" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 143 :width normal :foundry "outline" :family "Envy Code R")))))

(set-fontset-font
    (frame-parameter nil 'font)
    'han
    (font-spec :family "WenQuanYi Micro Hei Mono" :size 17))

(set-fontset-font
    (frame-parameter nil 'font)
    'japanese-jisx0208
    (font-spec :family "Meiryo" :size 17))

;(dolist (charset '(kana han symbol cjk-misc bopomofo))
;    (set-fontset-font (frame-parameter nil 'font)
;                      charset
;                      (font-spec :"WenQuanYi Micro Hei Mono" :size 17)))

;;高亮编辑行
(require 'hl-line)
(hl-line-mode 1)
;; or
;; (global-hl-line-mode 1)

;;关闭提示音
(setq visible-bell t)

;;关闭初始页面
(setq inhibit-startup-message t)

;;设置Toolbar不显示
(tool-bar-mode -1)

;;显示列号
(setq column-number-mode t)
(setq line-number-mode t)

(setq default-fill-column 60)

;;设置Tab键为空格
(setq-default indent-tabs-mode nil) ;; 使用space缩进，不使用tab字符
(setq-default tab-width 4) ;; 设置 Tab 宽度
(global-set-key (kbd "RET")'newline-and-indent) ;; 设置按回车后自动对齐 Tab

;; 设置各个模式的缩进参数
(setq c-indent-level 4)
(setq c-basic-offset 4)
(setq standard-indent 4)
(setq LaTeX-indent-level 4)
(setq default-tab-width 4)

(setq tab-stop-list ())
;;(loop for x downfrom 40 to 1 do
;;      (setq tab-stop-list (cons (* x 4) tab-stop-list)))



;;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插 入两个空格。
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;;缺省的 major mode 设置为 text-mode
(setq default-major-mode 'text-mode)

;;括号匹配时显示另外一边的括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;;光标靠近鼠标指针时，让鼠标指针自动让开
(mouse-avoidance-mode 'animate)

;;在标题栏显示buffer的名字
;;(setq frame-title-format "emacs@%b")

;;让 Emacs 可以直接打开和显示图片
(auto-image-file-mode t)

;;语法加亮
(global-font-lock-mode t)

;;设置边距
(global-set-key [C-f10]
     (lambda ()
     (interactive)
     (set-window-margins (car (get-buffer-window-list (current-buffer) nil t)) 25 25)))

;;把这些缺省禁用的功能打开
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)

;;设置一下备份时的版本控制
(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)

;;启动aspell
(setq-default ispell-program-name "aspell")

;;让 dired 可以递归的拷贝和删除目录
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

;最大化
(defun my-fullscreen ()
        (interactive)
        (set-frame-parameter nil 'fullscreen
                             (if (frame-parameter nil 'fullscreen) nil 'fullboth)))

;;(run-with-idle-timer 0.1 nil 'my-fullscreen)

;; 窗体最大化和恢复 
(defun w32-restore-frame () 
  "Restore a minimized frame" 
  (interactive) 
  (w32-send-sys-command 61728)) 

(defun w32-maximize-frame () 
  "Maximize the current frame" 
  (interactive) 
  (w32-send-sys-command 61488)) 

;;设置color theme
(require 'color-theme)
;(color-theme-comidia)

(setq molokai-theme-kit t)

;;历史记录
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;;使用desktop save
(load "desktop") 
(desktop-load-default) 
(desktop-read)

(require 'ido)
(ido-mode t)

(require 'swbuff)
(global-set-key (kbd "M-p") 'swbuff-switch-to-previous-buffer)
(global-set-key (kbd "M-n") 'swbuff-switch-to-next-buffer)



(setq swbuff-exclude-buffer-regexps 
     '("^ " "\\*.*\\*"))

(setq swbuff-status-window-layout 'scroll)
(setq swbuff-clear-delay 1)
(setq swbuff-separator "|")
(setq swbuff-window-min-text-height 1)

(global-set-key (kbd "C-z") 'set-mark-command)

(require 'htmlize)
(setq org-src-fontify-natively t) ;;设置org模式的语法高亮
;; export to HTML 
;(setq org-export-html-style-include-default nil)
  
;(setq org-export-html-style "<link rel=\"css\" type=\"text/css\" href=\"org-html-style.css\">") 
;(setq org-export-html-style "<style type="text/css">
;")

;(setq org-export-html-style "
;<style type="text/css">
;  pre {
;    background-color: #2f4f4f;line-height: 1.6;
;  FONT: 10.5pt Consola, Monaca, Courier New, helvetica;
;  color:wheat;
;  }
;</style>
;")


(eval-after-load 'cc-mode
  '(progn
     (defun c-lineup-arglist-tabs-only (ignored)
       "Line up argument lists by tabs, not spaces"
       (let* ((anchor (c-langelem-pos c-syntactic-element))
              (column (c-langelem-2nd-pos c-syntactic-element))
              (offset (- (1+ column) anchor))
              (steps (floor offset c-basic-offset)))
         (* (max steps 1)
            c-basic-offset)))
;     (add-hook 'c-mode-common-hook
;               (lambda ()
;                 ;; Add kernel style
;                 (c-add-style
;                  "linux-tabs-only"
;                  '("linux" (c-offsets-alist
;                             (arglist-cont-nonempty
;                              c-lineup-gcc-asm-reg
;                              c-lineup-arglist-tabs-only))))))

     (add-hook 'c-mode-common-hook
               (lambda ()
                 ;; Add kernel style
                 (c-add-style
                  "linux-tabs-only"
                  '("linux" (c-offsets-alist
                             (
                              arglist-cont-nonempty
                              c-lineup-gcc-asm-reg
                              c-lineup-arglist-tabs-only
                              ))))))

     
     (add-hook 'c-mode-hook
               (lambda ()
                 (setq c-basic-offset 4
                       tab-width 4
                       indent-tabs-mode nil)
                 (c-set-style "linux-tabs-only")))
     
;     (define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
     (define-key c-mode-base-map (kbd "RET") 'c-context-line-break)
  )
)

;;新闻组
(setq gnus-select-method '(nntp "nntp.aioe.org"))
(setq mm-coding-system-priorities '(iso-8859-1 gbk utf-8))
(setq gnus-default-subscribed-newsgroups
          '("gnu.emacs.help"
                "comp.lang.c++"
                "comp.lang.c"
                "comp.lang.lisp"
                "comp.lang.java.programmer"
                "cn.comp.os.linux"
                "comp.lang.ruby"
                "sci.math"
                "comp.text.tex"
                "alt.usage.english"
                "gnu.emacs.gnus"
                "comp.emacs"
                "gnu.emacs.sources"
                ))


;;Set Windows Margins
(add-hook 'window-configuration-change-hook
          (lambda ()
            (set-window-margins (car (get-buffer-window-list (current-buffer) nil t)) 20 20)))


;;Transparent
(set-frame-parameter (selected-frame) 'alpha '(65 80))
(add-to-list 'default-frame-alist '(alpha 90 10))

;;graphvize
(load "graphviz-dot-mode.el" nil t t)  
(add-hook 'find-file-hook (lambda()  
                            (if (string= "dot" (file-name-extension  
                                                buffer-file-name))  
                                (progn  
                                  (message "Enabling Setings for dot-mode")  
                                  (setq fill-column 1000)  
                                  ;(base-auto-pair)  
                                  (linum-mode)  
                                  )  
                              )))
