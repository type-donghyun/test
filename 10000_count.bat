@ECHO OFF
CHCP 65001>nul

set t0=%time: =0%

SET /a i=0
:loop

SET /a i=i+1
ECHO %i%
IF %i% equ 10000 (
	GOTO end
)

GOTO loop
:end

SET t=%time: =0%

SET /a h=1%t0:~0,2%-100
SET /a m=1%t0:~3,2%-100
SET /a s=1%t0:~6,2%-100
SET /a c=1%t0:~9,2%-100
SET /a starttime = %h% * 360000 + %m% * 6000 + 100 * %s% + %c%

SET /a h=1%t:~0,2%-100
SET /a m=1%t:~3,2%-100
SET /a s=1%t:~6,2%-100
SET /a c=1%t:~9,2%-100
SET /a endtime = %h% * 360000 + %m% * 6000 + 100 * %s% + %c%

SET /a runtime = %endtime% - %starttime%

CLS
ECHO 시작 시간: %t0%
ECHO 종료 시간: %t%
ECHO 실행 시간: %runtime%0 ms
PAUSE>nul

