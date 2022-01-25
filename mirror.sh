#!/bin/sh

: "${FORCE:=0}"

dir="$(dirname $0)"

wget_file() {
    set "$(basename ${1%%|*})" "${1##*|}"
    if [ -e "$1" -a "${FORCE}" = "0" ]; then
        echo "skipping $1"
        return
    fi
    wget -O "$1" "$2"
}

# xactstep-6 manuals (slightly newer, but extremely useful)
# found on http://ebook.pldworld.com/_semiconductors/Xilinx/AppLINX%20CD-ROM/Rev.7%20(Q3-1998)/docs/wcd00011/wcd0118b.htm

prefix="http://ebook.pldworld.com/_semiconductors/Xilinx/AppLINX%20CD-ROM/Rev.7%20(Q3-1998)/docs"

xact6_files="
    dsref1.pdf|${prefix}/wcd0002f/wcd02f05.pdf
    dsref2.pdf|${prefix}/wcd0002f/wcd02f06.pdf
    dsref3.pdf|${prefix}/wcd0002f/wcd02f07.pdf
    dsuser.pdf|${prefix}/wcd0002f/wcd02f08.pdf
    hardware.pdf|${prefix}/wcd00018/wcd0189c.pdf
    timing.pdf|${prefix}/wcd0002f/wcd02f0d.pdf
    xnfspec.pdf|${prefix}/wcd00016/wcd01660.pdf
"

for i in ${xact6_files}; do
    wget_file "$i"
done

# hard to file Xilinx ABEL User Guide
wget_file "https://www.ee.nthu.edu.tw/jcliao/Lab2000/lab03/xabel.pdf"

# lots of other databooks from older (1986!) and newer
# this one is nice because it has XC2000,XC3000,XC3100, and XC4000 (and L)
wget_file "http://www.bitsavers.org/components/xilinx/_dataBooks/1993_Xilinx_Programmable_Logic_Data_Book.pdf"

# used to debug/service phar-lap 386/dos extender apps in XACT 5.x
#wget_file "https://vetusware.com/output/vpddqgof/Phar%20Lap%20386%20dos-extender%204.1.7z"
#https://vetusware.com/download/386%7CDos%20Extender%20SDK%204.1/?id=7760

# the main attraction
wget_file "https://archive.org/download/1994-xilinx-xact-500-rebuilt/1994_xilinx_xact_500_rebuilt.7z"
