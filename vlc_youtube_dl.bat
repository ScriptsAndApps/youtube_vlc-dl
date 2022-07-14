@echo off

set "URL=https://www.youtube.com/watch?v=_vrSXAPzLQY&ab_channel=Kontor.TV"

    rem set "File=out.mp3"

 	set "str=%URL%"
 	set "result=%str:?=" & set "result=%"
 	set "File=out_%result:~2,11%_.mp3"
 	
echo "%URL%"
echo %File%

Title Download youtube
mode con:cols=65 lines=3 & COLOR 0E
rem Taskkill /IM "vlc.exe" /F >nul 2>&1
echo.
echo     Please wait a while ... The download is in progress ...
set Title=Download


IF /I "%PROCESSOR_ARCHITECTURE%"=="x86" (
        Set "vlc=%ProgramFiles(x86)%\VideoLAN\VLC\vlc.exe"
    ) else (
        Set "vlc=%ProgramFiles%\VideoLAN\VLC\vlc.exe"
)

If Not Exist "%vlc%" (
    Cls & COLOR 0C
    echo.
    Echo       "The VLC program is not installed on your system or can not be found at the right location" 
    TimeOut /T 5 /NoBreak>nul
)
rem --qt-start-minimized

"%vlc%" -vvv "%URL%" --qt-notification=0 --no-sout-video --sout-audio --no-sout-all  --sout=#transcode{acodec=mp3,ab=128,vcodec=dummy}:standard{access="file",mux="raw",dst=%File%} vlc://quit"

rem mp4 >>> "%vlc%" -vvv "%URL%" --qt-notification=0 --sout-audio --no-sout-all  --sout=#transcode{vcodec="h264",vb="512",fps="23.97",scale="1",acodec="mp3",ab="128","channels=2",samplerate="44100"}:standard{access="file",mux=mp4,dst=%File%}  vlc://quit"
