#!/bin/bash 

source $stdenv/setup 

PATH="$nativeBuildDepends"/bin:$PATH

echo $PATH

#tar xvzf ${src} 

#cd HepMC-2.06.08

OS=`uname`
if [ $OS = "Darwin" ]; then
  libtoolize --copy
  OSname=`uname -s`
else
  libtoolize --copy
  OSname=`uname -o`
fi
aclocal 
m4dir=`aclocal --print-ac-dir`
if [ -f $m4dir/libtool.m4 ]; then
   cat $m4dir/libtool.m4 >> aclocal.m4
fi
autoheader
automake --add-missing --copy
autoconf


