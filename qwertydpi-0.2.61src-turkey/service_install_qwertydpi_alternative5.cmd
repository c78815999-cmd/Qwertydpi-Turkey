@ECHO OFF
PUSHD "%~dp0"
set _arch=x86
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
IF DEFINED PROCESSOR_ARCHITEW6432 (set _arch=x86_64)

echo qwertydpi - Alternatif Metod 5 (Mod -6 + DNS, wrong-seq yontemi)
echo Bu dosyayi yonetici olarak calistirmaniz gerekmektedir.
echo Sag Tik - Yonetici Olarak Calistir.
echo Eger yonetici olarak calistirdiysaniz herhangi bir tusa basin.
pause

schtasks /delete /tn "qwertydpi" /f >nul 2>&1
taskkill /f /im goodbyedpi.exe >nul 2>&1

schtasks /create /tn "qwertydpi" /tr "\"%CD%\%_arch%\goodbyedpi.exe\" -6 --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253" /sc ONLOGON /rl HIGHEST /f

schtasks /run /tn "qwertydpi"

POPD
