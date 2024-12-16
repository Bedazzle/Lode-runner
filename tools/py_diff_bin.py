from glob import glob
import os.path
import os
import sys


ORGADR = 16384
CHECKFROM = 23296
CHECKTO   = 65535


files = [sys.argv[1], sys.argv[2]]

#-------------------------------------------------------------------------------

dump = [open(f, "rb").read() for f in files]

fsize = len(dump[0])
fcount = len(files)

found = 0

for i in range(fsize):
    addr = ORGADR + i

    if (addr >= CHECKFROM) and (addr <= CHECKTO):
        for f in range(1, fcount):
            s10 = f"{addr:5d}"
            s16 = f"{addr:4X}"

            for x in range(len(files)):
                s10 = f"{s10}\t{dump[x][i]:3d}"
                s16 = f"{s16}\t{dump[x][i]:02X}"

            if dump[f-1][i] != dump[f][i]:
                print(s16)

                found += 1
                break

if found == 0:
    print("NO vital diffs found")
else:
    print("Found %d diffs" % found)
