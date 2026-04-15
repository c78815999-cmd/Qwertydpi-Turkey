@ECHO OFF
PUSHD "%~dp0"
set _arch=x86
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
IF DEFINED PROCESSOR_ARCHITEW6432 (set _arch=x86_64)

echo qwertydpi - Alternatif Metod 2 (DNS olmadan, sadece DPI bypass)
echo Bu dosyayi yonetici olarak calistirmaniz gerekmektedir.
echo Sag Tik - Yonetici Olarak Calistir.
echo Eger yonetici olarak calistirdiysaniz herhangi bir tusa basin.
echo Bu pencere kapandiktan sonra Windows ayarlarindan DNS degistirmeyi unutmayin.
echo Onerilen DNS: 8.8.8.8 (Google) veya 1.1.1.1 (Cloudflare)
pause

schtasks /delete /tn "qwertydpi" /f >nul 2>&1
taskkill /f /im goodbyedpi.exe >nul 2>&1

schtasks /create /tn "qwertydpi" /tr "\"%CD%\%_arch%\goodbyedpi.exe\" -5" /sc ONLOGON /rl HIGHEST /f

schtasks /run /tn "qwertydpi"

POPD
