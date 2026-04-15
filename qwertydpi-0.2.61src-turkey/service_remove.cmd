@ECHO OFF
PUSHD "%~dp0"

echo qwertydpi hizmetini durdurmak ve kaldirmak icin:
echo Bu dosyayi yonetici olarak calistirmaniz gerekmektedir.
echo Sag Tik - Yonetici Olarak Calistir.
echo Eger yonetici olarak calistirdiysaniz herhangi bir tusa basin.
pause

schtasks /delete /tn "qwertydpi" /f >nul 2>&1
taskkill /f /im goodbyedpi.exe >nul 2>&1

echo.
echo qwertydpi kaldirildi. Internet baglantiniz normale dondu.
pause

POPD
