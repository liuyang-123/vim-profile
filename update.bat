@echo off
cd /d "%~dp0"

powershell -NoProfile -Command "copy .vimrc ~\.vimrc -Force"
