@rem del joe.txt
@echo Compile joe
@del tmp\joe.obj > NUL
@..\SOFT\lzasmx /c /z joe joe
@..\SOFT\tlink /t /x /v  joe.obj 
@rem copy /y tmp\joe.com joe.com

