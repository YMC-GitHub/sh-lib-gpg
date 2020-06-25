#!/bin/sh

THIS_FILE_PATH=$(cd $(dirname $0);pwd)
THIS_FILE_NAME=$(basename $0)
[ -z "$RUN_SCRIPT_PATH" ] && RUN_SCRIPT_PATH=$(pwd)

#echo "$THIS_FILE_PATH"
#echo "$RUN_SCRIPT_PATH"

PROJECT_PATH=$(cd "$THIS_FILE_PATH";cd "../../" ;pwd)

# import some lib
source "${PROJECT_PATH}/sh_modules/sh-lib-project-dir-map.sh"
# project_dir_map_gen2 "../"
[ -z "$THIS_FILE_PATH" ] && THIS_FILE_PATH=$(this_file_path_get) ; project_dir_map_gen2 "../"

# import test entry
source "${SRC_PATH}/index.sh"

# import some test lib

# case-x: mod_require_once and mod_load together --> ok

gpd_help_note=$(cat <<EOF
gpg (GnuPG) 2.2.20-unknown
libgcrypt 1.8.5
Copyright (C) 2020 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>

Supported algorithms:
Pubkey: RSA, ELG, DSA, ECDH, ECDSA, EDDSA
Cipher: IDEA, 3DES, CAST5, BLOWFISH, AES, AES192, AES256, TWOFISH,
        CAMELLIA128, CAMELLIA192, CAMELLIA256
Hash: SHA1, RIPEMD160, SHA256, SHA384, SHA512, SHA224
Compression: Uncompressed, ZIP, ZLIB, BZIP2
EOF
)

# ini var
gpg_var_ini

# set cnf
GPG_KEY_LENGTH=2048
GPG_KEY_TYPE=RSA
GPG_KEY_EXP=1y # eg:365|12m|1y|2y|0
GPG_USER_NAME=yemiancheng
GPG_USER_NOTE=20-09-20
#GPG_USER_EMAIL=ymc.github@gmail.com
GPG_USER_EMAIL=hualei03042013@163.com
GPG_KEY_PATH=~/.gnupg
PUB_KEY_SERVER=hkp://ipv4.pool.sks-keyservers.net
GPG_PASSPHRASE=

# cnf from arg
[ "$1" ] && GPG_USER_NAME="$1" ; [ -z "$GPG_USER_NAME" ] && GPG_USER_NAME=yemiancheng
[ "$2" ] && GPG_USER_EMAIL="$2" ; [ -z "$GPG_USER_EMAIL" ] && GPG_USER_EMAIL=hualei03042013@163.com
[ "$3" ] && GPG_USER_NOTE="$3" ; [ -z "$GPG_USER_NOTE" ] && GPG_USER_NOTE=$(date "+%Y-%m-%d")
[ "$4" ] && GPG_PASSPHRASE="$4" ; [ -z "$GPG_PASSPHRASE" ] && GPG_PASSPHRASE=yemiancheng123
[ "$5" ] && GPG_KEY_EXP="$5" ; [ -z "$GPG_KEY_EXP" ] && GPG_KEY_EXP=1y

# cal var
gpg_var_cal

# case: gpg get id by name and mail
# gpg_id_get_by_name_and_mail
# gpg_id_get_by_name_and_mail "yemiancheng" "hualei03042013@163.com"
# gpg_id_get_by_name_and_mail "yemiancheng" "ymc.github@gmail.com"
gpg_id_get_by_name_and_mail "$GPG_USER_NAME" "$GPG_USER_EMAIL"

# case: gpg secret id get by name and mail
# gpg_sec_id_get_by_name_and_mail
# gpg_sec_id_get_by_name_and_mail "yemiancheng" "hualei03042013@163.com"
# gpg_sec_id_get_by_name_and_mail "yemiancheng" "ymc.github@gmail.com"
gpg_sec_id_get_by_name_and_mail "$GPG_USER_NAME" "$GPG_USER_EMAIL"


# case: gpg secret id list by mail
gpg_id_list_by_mail "$GPG_USER_EMAIL"

for key in $(echo ${!db1e4d[*]}) ;do val=${db1e4d[$key]}; if [ -e $key ] ; then . $key ; else echo "${key} does not exsits." ; fi ; done

# file usage
# sample/tom/app.get.sh
# sample/tom/app.get.sh "yemiancheng" "hualei03042013@163.com" "20-09-20" "$GPG_PASSPHRASE" "1y"
# sample/tom/app.get.sh "yemiancheng" "ymc.github@gmail.com" "19-06-30" "yemiancheng521" "2y"
# sample/tom/app.get.sh "$GPG_USER_NAME" "$GPG_USER_EMAIL" "$GPG_USER_NOTE" "$GPG_PASSPHRASE" "$GPG_KEY_EXP"