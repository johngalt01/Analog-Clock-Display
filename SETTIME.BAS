10 INPUT"Enter current time (24 hour) Hours,Minutes,Seconds)? ",H,M,S
15 INPUT"Enter current MONTH(1-12),DAY(1-31),YEAR(00-99),DAY OF WEEK(1-7) ?",MONTH,DAY,YEAR,WEEKDAY
20 GOSUB 600
30 END
600 REM ------ SET CURRENT TIME TO H:M:S
610 OUT 97,0:OUT 96,142: REM CLEAR WRITE PROTECT BIT
620 OUT 97,128:OUT 96,128:REM STOP CLOCK
630 R=2:D=H:GOSUB 700 ' SET HOURS
640 R=1:D=M:GOSUB 700 ' SET MINUTES
650 R=0:D=S:GOSUB 700 ' SET SECONDS
651 R=3:D=DAY:GOSUB 700 ' SET THE DAY
652 R=4:D=MONTH:GOSUB 700 ' SET THE MONTH
653 R=5:D=WEEKDAY:GOSUB 700 ' SET THE WEEKDAY
654 R=6:D=YEAR:GOSUB 700 ' SET THE YEAR
660 RETURN
700 REM ------ WRITE TO CLOCK REGISTER R
710 OUT 97,INT(D/10)*16+(D MOD 10)
720 OUT 96,128+(R AND 31)*2
730 RETURN

