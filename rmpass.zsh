#!/bin/zsh
qpdf --version > /dev/null 2>&1
if [[ $? != 0 ]] ; then
    which -s brew >/dev/null 2>&1
    if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install qpdf
    else
        brew update
        brew install qpdf
    fi
fi


if [ ! -f "password.txt" ]; then
    echo "password.txt does not exist!"
    exit 1
fi

pass=$(head -n1 password.txt)
encrypted_dir="encrypted"
decrypted_dir="decrypted"
mkdir $decrypted_dir 2>/dev/null

OIFS="$IFS"
IFS=$'\n'

for file in $(find $encrypted_dir -type f -name "*.pdf" -exec basename {} \;) 
do

qpdf --no-warn --warning-exit-0 --password=$pass --decrypt "$encrypted_dir/$file" "$decrypted_dir/$file"
if [[ $? == 0 ]] ; then
echo "Decrypted $file"
fi
done
IFS="$OIFS"