#!/bin/bash
# Update dotfiles from git@github.com:aggresss/dotfiles.git master branch
# wget https://raw.githubusercontent.com/aggresss/dotfiles/master/update_dotfiles.sh

BASE_URL="https://raw.githubusercontent.com/aggresss/dotfiles/master"

# $1 download url
# $2 local filepath
function update_file()
{
    TMP_PATH="/tmp"
    # can replace by dirname and basename command
    DOWN_FILE=`echo "$1" | awk -F "/" '{print $NF}'`
    DOWN_PATH=`echo "$2" | awk 'BEGIN{res=""; FS="/";}{ for(i=2;i<=NF-1;i++) res=(res"/"$i);} END{print res}'`
    if [ -d ${DOWN_PATH} ]; then
        mkdir -p ${DOWN_PATH}
    fi
    rm -rf ${TMP_PATH}/${DOWN_FILE}
    wget -P ${TMP_PATH} $1
    cp -f ${TMP_PATH}/${DOWN_FILE} $2
    rm -f ${TMP_PATH}/${DOWN_FILE}
}

echo "=== Update dotfiles from git@github.com:aggresss/dotfiles.git master branch  ==="

# Update self
if [ -z "$HAS_UPDATED" ]; then
    FILE_PATH=${HOME}/bin
    FILE_NAME=update_dotfiles.sh
    mkdir -p ${FILE_PATH}
    update_file ${BASE_URL}/${FILE_NAME} ${FILE_PATH}/${FILE_NAME}
    chmod +x ${FILE_PATH}/${FILE_NAME}
    echo "--- Use updated update_dotfiles.sh to update dotfiles  ---"
    export HAS_UPDATED=1
    eval ${FILE_PATH}/${FILE_NAME}
    unset HAS_UPDATED
    exit 0
fi

# Update commom dotfiles
update_file ${BASE_URL}/home/.bashrc ${HOME}/.bashrc
update_file ${BASE_URL}/home/.bash_aliases ${HOME}/.bash_aliases
update_file ${BASE_URL}/home/.inputrc ${HOME}/.inputrc
update_file ${BASE_URL}/vim/.vimrc ${HOME}/.vimrc
update_file ${BASE_URL}/pip/pip.conf ${HOME}/pip/pip.conf

SYS_TYPE=`uname`
case ${SYS_TYPE} in
    Linux)
        update_file ${BASE_URL}/home/.Xresources ${HOME}/.Xresources

    ;;
    Darwin)
        update_file ${BASE_URL}/home/.bash_profile ${HOME}/.bash_profile

    ;;
    *)

    ;;
esac

