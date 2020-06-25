#!/bin/sh

THIS_FILE_PATH=$(cd $(dirname $0);pwd)
THIS_FILE_NAME=$(basename $0)
[ -z "$RUN_SCRIPT_PATH" ] && RUN_SCRIPT_PATH=$(pwd)

PROJECT_PATH=$(cd "$THIS_FILE_PATH";cd "../../" ;pwd)

# import some lib
source "${PROJECT_PATH}/sh_modules/sh-lib-project-dir-map.sh"
# project_dir_map_gen2 "../"
[ -z "$THIS_FILE_PATH" ] && THIS_FILE_PATH=$(this_file_path_get) ; project_dir_map_gen2 "../"

# import src entry
source "${SRC_PATH}/index.sh"

function gpg_sample_01(){
  local f=
  [ "${1}" ] && f="${1}"
  [ -z "$f" ] && f="$FILE_TO_SIGN"
  [ -z "$f" ] && f=test.txt

  local reciver=
  [ "${2}" ] && reciver="${2}"
  [ -z "$reciver" ] && reciver="$FILE_TO_SIGN"
  [ -z "$reciver" ] && reciver=reciver_xx

  local sender=
  [ "${3}" ] && sender="${3}"
  [ -z "$sender" ] && sender="$FILE_TO_SIGN"
  [ -z "$sender" ] && sender=sender_xx

  local key2=
  [ "${4}" ] && key2="${4}"
  [ -z "$key2" ] && key2="$FILE_TO_SIGN"
  [ -z "$key2" ] && key2=reciver_pub_key_xx

  local key1=
  [ "${5}" ] && key1="${5}"
  [ -z "$key1" ] && key1="$FILE_TO_SIGN"
  [ -z "$key1" ] && key2=sender_pub_key_xx

  # 创建文件
  mkdir -p ./secret
  touch ./secret/$f
  # 加密文件
  gpg -e -r "$reciver" ./secret/$f
  # 发送文件
  gpg --import "$key2" # 导入接收者公钥
  gpg --export -a "$sender" > "$sender_pub_key_xx" #导出发送者公钥
  gpg -e -u "$sender" -r "$reciver" ./secret/$f
}


function gpg_sample_export(){
  echo "示例-导出文件"
  gpg_pri_key_export
  gpg_pub_key_export
  gpg_rev_key_export
  gpg_sec_key_export
}
# gpg_sample_export

# backup
function gpg_sample_backup(){
  echo "示例-备份文件"
  gpg_backup_file_gen "secret" ~/.gnupg
  #gpg_backup_file_gen "$DES_P" "$SRC_P"
}
#gpg_sample_backup

# import
function gpg_sample_import(){
  echo "示例-导入文件"
  #gpg_rev_key_import
  #gpg_pub_key_import
  #gpg_pri_key_import
}
function gpg_sapmpe_encode_and_decode(){
  echo "示例-加密/解密"
  echo "1.1文件加密"
  #gpg_file_encode
  echo "1.2文件解密"
  #gpg_file_decode
}
function gpg_sapmpe_sign_and_check(){
  echo "示例-签名/验签"
  echo "1.1文件签名"
  #gpg_file_sign
  echo "1.2-验证签名"
  #gpg_file_checksign
  # 文本签名+合并式的
  #gpg_file_sign "secret/password" "txt" "txt" #no
  #gpg_file_checksign "secret/password" "txt" "txt" #no
  # 文本签名+分离式的
  gpg_file_sign "secret/password" "txt" "txt+sign" #ok
  gpg_file_checksign "secret/password" "txt" "txt+sign" #ok
  # 数字签名+合并式的
  gpg_file_sign "secret/password" "txt" "bin" #ok
  gpg_file_checksign "secret/password" "txt" "bin" #ok
  # 数字签名+分离式的
  gpg_file_sign "secret/password" "txt" "bin+sign" #ok
  gpg_file_checksign "secret/password" "txt" "bin+sign" #ok
}
#gpg_sapmpe_sign_and_check

function gpg_sapmpe_sign_and_check_sh_lib(){
  local lib=
  local ver=

  [ "${1}" ] && lib="${1}"
  [ -z "$lib" ] && lib="$LIB"
  [ -z "$lib" ] && lib=lang

  [ "${2}" ] && ver="${2}"
  [ -z "$ver" ] && ver="$VER"
  [ -z "$ver" ] && ver=v1.0.0
  # all
  gpg_file_sign "$lib-$ver.all" "tar.gz" "txt+sign"
  gpg_file_checksign "$lib-$ver.all" "tar.gz" "txt+sign"
  # dist
  gpg_file_sign "$lib-$ver.lib" "tar.gz" "txt+sign"
  gpg_file_checksign "$lib-$ver.lib" "tar.gz" "txt+sign"
  # src
  gpg_file_sign "$lib-$ver.src" "tar.gz" "txt+sign"
  gpg_file_checksign "$lib-$ver.src" "tar.gz" "txt+sign"
  # test
  #gpg_file_sign "$lib-$ver.test" "tar.gz" "txt+sign"
  #gpg_file_checksign "$lib-$ver.test" "tar.gz" "txt+sign"
}
#gpg_sapmpe_sign_and_check_sh_lib
#gpg_sapmpe_sign_and_check_sh_lib "lang" "v1.1.0"
#gpg_sapmpe_sign_and_check_sh_lib "$SIGN_FILE_NAME" "$SIGN_FILE_SUFFIX" "$SIGN_FILE_TYPE"


for key in $(echo ${!db1e4d[*]}) ;do val=${db1e4d[$key]}; if [ -e $key ] ; then . $key ; else echo "${key} does not exsits." ; fi ; done

# file usage
# sample/sam/index.sh