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


###=================
# pri key
###=================
# case: gpg pri key list
#gpg_pri_key_list
# case: gpg pri key delete
#gpg_pri_key_del "$GPG_USER_ID"
# case: gpg pri key export
#gpg_pri_key_export "$GPG_USER_ID" "$GPG_PRI_KEY_FILE"
# case: gpg pri key import
#gpg_pri_key_import "$GPG_PRI_KEY_FILE"

###=================
# pub key
###=================
# case: gpg pub key export
#gpg_pub_key_export "$GPG_USER_ID" "$GPG_PUB_KEY_FILE"
# case: gpg pub key import
#gpg_pub_key_import "$GPG_PUB_KEY_FILE"
# case: gpg pub key upload
gpg_id_get_by_name_and_mail "$GPG_USER_NAME" "$GPG_USER_EMAIL" > /dev/null 2>&1 ; [ -z "$GPG_USER_ID" ] && gpg_pub_key_upload "$GPG_USER_ID" "$PUB_KEY_SERVER"
# case: gpg pub key search in $PUB_KEY_SERVER
#gpg_pub_key_search "$GPG_USER_ID" "$PUB_KEY_SERVER"
# case: gpg pub key download from $PUB_KEY_SERVER
#gpg_pub_key_download "$GPG_USER_ID" "$PUB_KEY_SERVER"
# case: gpg pub key check for pepole download
#gpg_pub_key_check "$GPG_USER_ID"
# case: gpg pub key unuse again
#gpg_pub_key_revoke "$GPG_USER_ID" "$PUB_KEY_SERVER" "$GPG_REV_KEY_FILE"

for key in $(echo ${!db1e4d[*]}) ;do val=${db1e4d[$key]}; if [ -e $key ] ; then . $key ; else echo "${key} does not exsits." ; fi ; done

# file usage
# sample/tom/app.share.revoke.sh
# sample/tom/app.share.revoke.sh "yemiancheng" "hualei03042013@163.com" "20-09-20" "$GPG_PASSPHRASE" "1y"
# sample/tom/app.share.revoke.sh "yemiancheng" "ymc.github@gmail.com" "19-06-30" "yemiancheng521" "2y"
# sample/tom/app.share.revoke.sh "$GPG_USER_NAME" "$GPG_USER_EMAIL" "$GPG_USER_NOTE" "$GPG_PASSPHRASE" "$GPG_KEY_EXP"