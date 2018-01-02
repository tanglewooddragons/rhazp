#!/bin/sh

theme=$1

echo 'Compiling theme ' $theme

if cp -a src src_compile
then
	echo "Source directory copied"
else
	echo "Couldn't copy source directory"
	exit 1
fi

if cp $1/* src_compile
then
	echo "Theme copied"
else
	echo "Couldn't copy theme"
	exit 1
fi

if stylus src_compile/rhazp.styl -o rhazp.css
then
	echo "Theme compiled"
else
	echo "Couldn't compile css"
	exit 1
fi

if rm -rf src_compile
then
	echo "Cleaned up, output in rhazp.css"
else
	echo "Couldn't clean up, leftover stuff in src_compile"
	exit 1
fi
