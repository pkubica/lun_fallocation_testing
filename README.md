# lun_fallocation_testing
Testing NetApp luns for fallocate error
Just run this script on GE host

WARNING: this operation will destroy that GE !!!

Output example:
```
# ./test_fallocate.sh
Testing fallocate on volumes
3600a098038304479363f4c487045512d
3600a098038304479363f4c4870455136
3600a098038304479363f4c4870455137
3600a098038304479363f4c4870455138
3600a098038304479363f4c4870455139
3600a098038304479363f4c4870455141
3600a098038304479363f4c4870455143
3600a098038304479363f4c4870455144
3600a098038304479363f4c4870455145
3600a098038304479363f4c4870455146
3600a098038304479363f4c4870455147
3600a098038304479363f4c4870455148
3600a098038304479363f4c4870455149
3600a098038304479363f4c487045514a
3600a098038304479363f4c487045516f
3600a098038304479363f4c4870455171
3600a098038304479363f4c4870455172
3600a09803830447a4f244c4657616f6c
3600a09803830447a4f244c4657616f6d

Processing lun 3600a098038304479363f4c487045512d
Testing fallocation
fallocate: fallocate failed: No space left on device
Discovered fallocation error on offset 4

Processing lun 3600a098038304479363f4c4870455136
Testing fallocation
fallocate: fallocate failed: No space left on device
Discovered fallocation error on offset 1

Processing lun 3600a098038304479363f4c4870455137
Testing fallocation
fallocate: fallocate failed: No space left on device
Discovered fallocation error on offset 25

Processing lun 3600a098038304479363f4c4870455138
Testing fallocation
fallocate: fallocate failed: No space left on device
Discovered fallocation error on offset 27

Processing lun 3600a098038304479363f4c4870455139
Testing fallocation
fallocate: fallocate failed: No space left on device
Discovered fallocation error on offset 3

Processing lun 3600a098038304479363f4c4870455141
Testing fallocation
fallocate: fallocate failed: No space left on device
Discovered fallocation error on offset 3

Processing lun 3600a098038304479363f4c4870455143
Testing fallocation
fallocate: fallocate failed: No space left on device
Discovered fallocation error on offset 8

Processing lun 3600a098038304479363f4c4870455144
Testing fallocation
fallocate: fallocate failed: No space left on device
Discovered fallocation error on offset 9

Processing lun 3600a098038304479363f4c4870455145
Testing fallocation
fallocate: fallocate failed: No space left on device
Discovered fallocation error on offset 29

Processing lun 3600a098038304479363f4c4870455146
Testing fallocation
fallocate: fallocate failed: No space left on device
Discovered fallocation error on offset 26

Processing lun 3600a098038304479363f4c4870455147
Testing fallocation
fallocate: fallocate failed: No space left on device
Discovered fallocation error on offset 20

Processing lun 3600a098038304479363f4c4870455148
Testing fallocation
fallocate: fallocate failed: No space left on device
Discovered fallocation error on offset 8

Processing lun 3600a098038304479363f4c4870455149
Testing fallocation
fallocate: fallocate failed: No space left on device
Discovered fallocation error on offset 3

Processing lun 3600a098038304479363f4c487045514a
Testing fallocation
fallocate: fallocate failed: No space left on device
Discovered fallocation error on offset 9

Processing lun 3600a098038304479363f4c487045516f
Testing fallocation
Zeroing first 20G with dd
2000+0 records in
2000+0 records out
20971520000 bytes (21 GB, 20 GiB) copied, 32.4236 s, 647 MB/s
Testing fallocation
Fallocation error was not discovered

Processing lun 3600a098038304479363f4c4870455171
Testing fallocation
Zeroing first 20G with dd
2000+0 records in
2000+0 records out
20971520000 bytes (21 GB, 20 GiB) copied, 32.7367 s, 641 MB/s
Testing fallocation
Fallocation error was not discovered

Processing lun 3600a098038304479363f4c4870455172
Testing fallocation
fallocate: fallocate failed: Invalid argument
Discovered fallocation error on offset 48

Processing lun 3600a09803830447a4f244c4657616f6c
Testing fallocation
fallocate: fallocate failed: No space left on device
Discovered fallocation error on offset 3

Processing lun 3600a09803830447a4f244c4657616f6d
Testing fallocation
fallocate: fallocate failed: No space left on device
Discovered fallocation error on offset 8

Working luns:
3600a098038304479363f4c487045516f
3600a098038304479363f4c4870455171

Broken luns:
3600a098038304479363f4c487045512d
3600a098038304479363f4c4870455136
3600a098038304479363f4c4870455137
3600a098038304479363f4c4870455138
3600a098038304479363f4c4870455139
3600a098038304479363f4c4870455141
3600a098038304479363f4c4870455143
3600a098038304479363f4c4870455144
3600a098038304479363f4c4870455145
3600a098038304479363f4c4870455146
3600a098038304479363f4c4870455147
3600a098038304479363f4c4870455148
3600a098038304479363f4c4870455149
3600a098038304479363f4c487045514a
3600a098038304479363f4c4870455172
3600a09803830447a4f244c4657616f6c
3600a09803830447a4f244c4657616f6d
```
