
scrot --select --line style=dash --freeze \
"$HOME/pictures/screenshots/.temporary.png"

if [ -f $HOME/pictures/screenshots/.temporary.png ] ; then

    fileName=$(zenity --file-selection --filename=$HOME/notes/ --save \
        --confirm-overwrite )
    mv $HOME/pictures/screenshots/.temporary.png "$fileName"

fi

rm -rf $HOME/pictures/screenshots/.temporary.png
