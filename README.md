# Lode runner disassembly

Partial disassembly of Lode runner game for ZX Spectrum.

### Compilation

Sources can be compiled with SjASMPlus (at the moment there is 1.20.3 available)
https://github.com/z00m128/sjasmplus

If you need to check integrity of result, please use Python
https://www.python.org/downloads/

- get SjASMPlus

- get Python

- compile with compile_lode.bat

- ready files are put into "recompile" directory.
	**lode.sna** is ready to run in emulator.
	
- fast room redraw can be set in **Lode_runner_loader.asm**
	if you uncomment **DEFINE	LEVELADDR**

best wishes,
Bedazzle 2024.12.16
