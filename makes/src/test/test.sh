#! /bin/sh

echo "Target: $FRCTARGET"
echo "Triple: $FRCHOSTTARGET"
echo "Prefix: $FRCPREFIX"

echo "Begining Simple C compiler test"
$FRCHOSTTARGET-gcc $1 -o $2 || exit $?
rm $2 || exit $?
echo "Simple C compiler test passed"