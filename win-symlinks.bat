@echo off

rem NeoVim
mklink /d %AppData%\..\Local\nvim %CD%\nvim

rem Emacs
mklink %AppData%\.emacs %CD%\.emacs
mklink %AppData%\.emacs.custom.el %CD%\.emacs.custom.el
mklink /d %AppData%\.emacs.local %CD%\.emacs.local
