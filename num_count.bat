@ECHO OFF
CHCP 65001>nul

SET /a i=0
:enter_num
ECHO 0부터 1씩 더해 목표 숫자까지 걸리는 시간을 측정합니다.
ECHO 이는 CPU의 성능에 따라 다른 결과를 도출하며, CPU 성능을 보증하지는 않습니다.
SET /p a=목표 숫자를 입력하세요: 
SET /a b=%a%
CLS
IF NOT %b% geq 1 (
	GOTO enter_num
)

SET t0=%time: =0%

:loop
SET /a i=i+1
ECHO %i%
IF %i% equ %a% (
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

