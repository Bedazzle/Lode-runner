@ECHO OFF

del recompile\lode.bin
del recompile\lode.sna
del recompile\lode.tap
del Lode_runner.sym
del Lode_runner.labels
del Lode_runner.labels2

set TOOLS=..\..\..\_zx_tools
set BASE=.

cls

%TOOLS%\sjasmplus.exe --syntax=abF --nologo --msg=err --sym=Lode_runner.sym Lode_runner_loader.asm

echo _

pause 
tools\py_diff_bin.py "%BASE%/orig/Lode Runner.SNA_tail.bin" "%BASE%/recompile/lode.bin"

pause
