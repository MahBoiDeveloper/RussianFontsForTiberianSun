@echo off
chcp 65001 > nul
echo Russian Fonts For Tiberian Sun
echo Автор: mah_boi
echo.

: Предполагается, что скрипт будет запускать ручками, поэтому 
: нужно подняться на папку выше, чтобы всё работало
cd ..

set MIX=Tools\ccmix.exe

: Удаление ранее скомпилированной папки
rmdir /s /q Build >nul 2> nul
mkdir Build

for /f "tokens=*" %%f in ('dir "Source\" /a:d /b') do (
	echo Сборка шрифта %%f...
	mkdir "Build\%%f"
	for /f "tokens=*" %%m in ('dir "Source\%%f" /a:d /b') do (
		%MIX% --create --lmd --game=ts --dir "Source\%%f\%%m" --mix "Build\%%f\%%m.mix"
	)
	echo.
	)

echo Все шрифты были собраны.
echo Сборка проекта окончена. Пожалуйста, проверьте папку Build.

: Приятная задержка
timeout /t 30 > nul
