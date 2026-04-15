@ECHO OFF
PUSHD "%~dp0"
set _arch=x86
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
IF DEFINED PROCESSOR_ARCHITEW6432 (set _arch=x86_64)

echo qwertydpi - Ana Mod (Web + Oyun)
echo Bu dosyayi yonetici olarak calistirmaniz gerekmektedir.
echo Sag Tik - Yonetici Olarak Calistir.
echo Eger yonetici olarak calistirdiysaniz herhangi bir tusa basin.
echo DNS icin ek ayar gerekmez, otomatik yapilir.
pause

:: Eski gorevi ve sureci kaldir
schtasks /delete /tn "qwertydpi" /f >nul 2>&1
taskkill /f /im goodbyedpi.exe >nul 2>&1

:: Gorevi olustur - Windows baslangicinada arkaplanda otomatik baslar
schtasks /create /tn "qwertydpi" /tr "\"%CD%\%_arch%\goodbyedpi.exe\" -5 --set-ttl 5 --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253" /sc ONLOGON /rl HIGHEST /f

:: Hemen baslat (arkaplanda, pencere olmadan)
schtasks /run /tn "qwertydpi"

POPD
