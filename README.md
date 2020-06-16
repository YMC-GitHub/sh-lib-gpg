# sh lib gpg
## desc

some function to curd gpg for ymc shell lib

## deps

### test

- [ ] sh-lib-path-resolve
- [ ] sh-lib-test
- [ ] sh-lib-time-cost
- [ ] sh-lib-project-dir-map

### prod

- [ ] xxx

## apis

- [x] gpg_id_get_by_name_and_mail
- [x] gpg_id_list_by_mail
- [x] gpg_sec_key_list
- [x] gpg_sec_key_gen_v1
- [x] gpg_sec_key_gen_v2
- [x] gpg_cnf_key_tpl_01
- [x] gpg_cnf_key_tpl_02
- [x] gpg_sec_key_gen
- [x] gpg_sec_key_del
- [x] gpg_sec_key_del_by_mail
- [x] gpg_pri_key_list
- [x] gpg_pri_key_del
- [x] gpg_pri_key_export
- [x] gpg_pri_key_import
- [x] gpg_pub_key_export
- [x] gpg_pub_key_upload
- [x] gpg_pub_key_search
- [x] gpg_pub_key_download
- [x] gpg_pub_key_check
- [x] gpg_pub_key_revoke
- [x] gpg_pub_key_import
- [x] gpg_rev_key_export
- [x] gpg_rev_key_import
- [x] gpg_file_encode
- [x] gpg_file_decode
- [x] gpg_file_sign
- [x] gpg_file_checksign
- [x] gpg_passphrase_change
- [x] gpg_var_ini
- [x] gpg_var_cal
- [x] gpg_backup_file_gen
- [x] gpg_backup_file_del
- [x] gpg_sec_id_get_by_name_and_mail
- [x] gpg_sec_key_export
- [x] gpg_sec_key_to_github
- [x] gpg_sec_id_to_git

```sh
cat src/index.sh |  grep "function " | sed "s/function */- [x] /g"  | sed "s/(.*) *{//g"
```

## feats

- [x] basic curd gpg
- [x] git commit with gpg

## usage

### how to use for poduction?

```sh
# get the code

# run the index file
# ./src/index.sh

# or import to your sh file
# source /path/to/the/index file

# simple usage
sample/tom/index.sh "yemiancheng" "ymc.github@gmail.com" "19-06-30" "yemiancheng123" "2y"
# sample/tom/index.sh "$GPG_USER_NAME" "$GPG_USER_EMAIL" "$GPG_USER_NOTE" "$GPG_PASSPHRASE" "$GPG_KEY_EXP"
```

### how to use for developer?

```sh
# get the code

# run test
# ./test/index.sh
#2 get some fail test
# ./test/index.sh | grep "it is false"
```

## author

yemiancheng <ymc.github@gmail.com>

## license

MIT
