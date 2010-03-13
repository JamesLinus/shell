#!/bin/sh

# Save shell files from deletion


SUFFIX=config-shell
BACKUPLIST=".bashrc .zshrc"


# Check backup possibility.
CHECK="pass"
for FILENAME in $BACKUPLIST; do

    SRC=~/$FILENAME
    DST=~/$FILENAME.$SUFFIX
    CHECKITEM="pass"

    if [ -f $SRC ] && [ -f $DST ]; then 
        CHECKITEM="fail"
    fi

    echo "BACKUP: $SRC ---> $DST ($CHECKITEM)"
    
    if [ $CHECKITEM = "fail" ]; then 
        CHECK="fail" 
    fi
done

if  [ $CHECK = "fail" ]; then
    echo ""
    echo "INSTALLATION ERROR:" 
    echo "Can't make backup files where necessary."
    echo ""
    exit 1
fi

# Do backup (by copying and not moving)
for FILENAME in $BACKUPLIST; do

    SRC=~/$FILENAME
    DST=~/$FILENAME.$SUFFIX

    mv $SRC $DST
done

# Do install
echo "Installing 'bashrc' in HOME directory."
ln -s $(dirname $0)/bashrc ~/.bashrc
echo "Installing  'zshrc' in HOME directory."
ln -s $(dirname $0)/zshrc ~/.zshrc
echo "Bye, bye!"
