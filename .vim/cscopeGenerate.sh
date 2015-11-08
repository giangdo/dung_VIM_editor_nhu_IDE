#!/bin/bash

srcDir="/home/giang/o"
dirName="${srcDir##*/}"
cscopeDir="/home/giang/.cscopeDatabase/$dirName"

find $srcDir -regex ".*\.[ch]\(h\)?\(c\)?\(pp\)?\(xx\)?" > "$cscopeDir""/tempCscope.files"
cd $cscopeDir

# Remove all file in uml folder (User mode folder)
cat tempCscope.files |sed '/\/uml\//d' > cscope.files

# redirect all output to /dev/null and run in background
# note: because in apz source Code, there are many softlink, sothat cscope generate database will cause many message to indicate that "file are not found" -> we put these output to null.
2>/dev/null 1>&2 cscope -q -R -b -i cscope.files

#Remove temp files
rm -f tempCscope.files cscope.files

echo "Done"
exit 0
