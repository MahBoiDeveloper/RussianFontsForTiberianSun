@echo off
chcp 65001 > nul
echo Russian Fonts For Tiberian Sun by mah_boi
echo.

set MIX=Tools\ccmix.exe

: Удаление ранее готовой папки
rmdir /s /q Build >nul 2> nul
mkdir Build

: Сборка шрифта
echo Сборка шрифта %1...
mkdir "Build\%1"
for /f "tokens=*" %%m in ('dir "Source\%1" /a:d /b') do (
	%MIX% --create --lmd --game=ts --dir "Source\%1\%%m" --mix "Build\%1\%%m.mix"
)
echo.

echo Шрифт %1 был собран.
