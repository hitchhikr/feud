@echo off
tools\vasm -quiet -devpac -DAMIGA -DVASM -Fhunk -o feud.o src\feud.asm
tools\vlink -S -s -o game\feud feud.o
del feud.o
tools\vasm -quiet -devpac -DAMIGA -DSPEED=6 -DVASM -Fhunk -o mzfeud.o src\mzfeud.asm
tools\vlink -S -s -o game\mzfeud mzfeud.o
del mzfeud.o
tools\vasm -quiet -devpac -DAMIGA -DSPEED=7 -DVASM -Fhunk -o mzfeud.o src\mzfeud.asm
tools\vlink -S -s -o game\mzfeud60 mzfeud.o
del mzfeud.o
