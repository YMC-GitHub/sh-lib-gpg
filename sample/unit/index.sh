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
GPG_KEY_EXP=0 # eg:365|12m|1y|2y
GPG_KEY_EXP=1y # eg:365|12m|1y|2y
GPG_USER_NAME=yemiancheng
GPG_USER_NOTE=20-09-20
#GPG_USER_EMAIL=ymc.github@gmail.com
GPG_USER_EMAIL=hualei03042013@163.com
GPG_KEY_PATH=~/.gnupg
PUB_KEY_SERVER=hkp://ipv4.pool.sks-keyservers.net

# cal var
gpg_var_cal

# case: gen key by communication
#gpg_sec_key_gen_v1

# case: gpg key add by file without force
# set tpl
# run gen
#gpg_sec_key_gen "$GPG_CNF_KEY_FILE"

# case: gpg key add by file with force
#rm -rf $GPG_PRI_KEY_FILE ; gpg_sec_key_gen

###=================
# xxx id
###=================

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
#gpg_pub_key_upload "$GPG_USER_ID" "$PUB_KEY_SERVER"
# case: gpg pub key search in $PUB_KEY_SERVER
#gpg_pub_key_search "$GPG_USER_ID" "$PUB_KEY_SERVER"
# case: gpg pub key download from $PUB_KEY_SERVER
#gpg_pub_key_download "$GPG_USER_ID" "$PUB_KEY_SERVER"
# case: gpg pub key check for pepole download
#gpg_pub_key_check "$GPG_USER_ID"
# case: gpg pub key unuse again
#gpg_pub_key_revoke "$GPG_USER_ID" "$PUB_KEY_SERVER" "$GPG_REV_KEY_FILE"

###=================
# rec key
###=================
# case: gpg rev key export
# gpg_rev_key_export "$GPG_USER_ID" "$GPG_REV_KEY_FILE"
# case: gpg rev key import
# gpg_rev_key_import "$GPG_REV_KEY_FILE"

###=================
# sec key ?
###=================
# case: gpg secret key list
gpg_sec_key_list
# case: gpg secret key delete
#gpg_sec_key_del "$GPG_USER_ID"
# case: gpg secret key export with secret id to some file
#gpg_sec_key_export "$GPG_SEC_ID"
# gpg_sec_key_export "$GPG_SEC_ID" "$GPG_SEC_KEY_FILE"

###=================
# all key ?
###=================
# case: gpg key back up files gen
# gpg_backup_file_gen "secret" ~/.gnupg
# mkdir -p "secret/gpg" ; gpg_backup_file_gen "secret/gpg" ~/.gnupg
# case: gpg key back up files del

###=================
# pass phrase?
###=================
# case: gpg passphrase change with
# gpg_passphrase_change "$GPG_USER_ID"


###=================
# file encode and decode
###=================
# case: file encode with gpg
#gpg_file_encode "$GPG_USER_ID" "lang-$ver.all" "tar.gz"
#gpg_file_encode "$GPG_USER_ID" "$ENCODE_FILE_NAME" "$ENCODE_FILE_SUFFIX"

# case: file decode with gpg
#gpg_file_decode "$GPG_USER_ID" "lang-$ver.all" "tar.gz"
#gpg_file_decode "$GPG_USER_ID" "$DECODE_FILE_NAME" "$DECODE_FILE_SUFFIX"

###=================
# file sign and check
###=================

# case: file sign with gpg
#gpg_file_sign "lang-$ver.all" "tar.gz" "txt+sign"
#gpg_file_sign "$SIGN_FILE_NAME" "$SIGN_FILE_SUFFIX" "$SIGN_FILE_TYPE"

# case: file sign check
#gpg_file_checksign "lang-$ver.all" "tar.gz" "txt+sign"
#gpg_file_checksign "$SIGN_FILE_NAME" "$SIGN_FILE_SUFFIX" "$SIGN_FILE_TYPE"

###=================
# git use ?
###=================
# case: gpg secret key upload to github
#gpg_sec_key_to_github
gpg_sec_key_to_github "$GPG_SEC_KEY_FILE"

# case: gpg secret id to git and tell git to commit with gpg
# gpg_sec_id_to_git "$GPG_SEC_ID" "local"
# gpg_sec_id_to_git "$GPG_SEC_ID" "global"
gpg_sec_id_to_git "$GPG_SEC_ID" "$GPG_GIT_SCOPE"

# case: geg key del
#gpg_sec_key_del "$GPG_USER_ID"
#gpg_sec_key_del_by_mail "$GPG_USER_EMAIL"

for key in $(echo ${!db1e4d[*]}) ;do val=${db1e4d[$key]}; if [ -e $key ] ; then . $key ; else echo "${key} does not exsits." ; fi ; done

# file usage
# sample/unit/index.sh