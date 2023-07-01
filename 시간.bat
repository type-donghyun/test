@ECHO OFF
CHCP 65001>nul


rem 시작 시간 기억. 날짜는 고려하지 않으므로, 프로그램 실행이 지역 시간 자정을 포함하는 경우 제대로 작동하지 않을 수 있습니다.
set t0=%time: =0%

rem 여기서 어떤 작업을 수행합니다.... 그러나 따옴표에 대한 더 많은 주의가 필요합니다.
rem 특히, 인수에 백분율 기호(%)나 캐럿(^)이 포함된 경우 이상한 동작이 발생할 수 있으며, 이를 방지할 방법이 없을 수도 있습니다.
rem 추가한 코드 부분
SET /a i=0
:loop

SET /a i=i+1
ECHO %i%
IF %i% equ 10000 (
	GOTO end
)

GOTO loop
:end

rem Capture the end time before doing anything else
set t=%time: =0%

rem t0를 100분의 1초 단위의 스칼라 값으로 만듭니다.
set /a h=1%t0:~0,2%-100
set /a m=1%t0:~3,2%-100
set /a s=1%t0:~6,2%-100
set /a c=1%t0:~9,2%-100
set /a starttime = %h% * 360000 + %m% * 6000 + 100 * %s% + %c%

rem t를 100분의 1초 단위의 스칼라 값으로 만듭니다.
set /a h=1%t:~0,2%-100
set /a m=1%t:~3,2%-100
set /a s=1%t:~6,2%-100
set /a c=1%t:~9,2%-100
set /a endtime = %h% * 360000 + %m% * 6000 + 100 * %s% + %c%

rem 실행 시간은 이제 단순히 end - start입니다.
set /a runtime = %endtime% - %starttime%

CLS
echo 시작 시간: %t0%
echo 종료 시간: %t%
echo 실행 시간: %runtime%0 ms
PAUSE>nul

