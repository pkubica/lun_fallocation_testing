#!/bin/bash
# NetApp lun test for fallocate errors which could cause qemu-img out of space issues
# WARNING: This will destroy all attached iSCSI LUNs!!! USE WITH CAUTION !!!
# Usage:
#    ./test_fallocate.sh


_V=1
LUNS=`ls /dev/mapper/ | grep 3600`
LUNS_WORKING=""
LUNS_BROKEN=""

fallocate_test () {
        offset="-1"
        log Testing fallocation with offsets 1G
        for n in $(seq 0 49); do
                # log Discard offset=${n}g
                fallocate --verbose --punch-hole --offset=${n}g --length=1g /dev/mapper/$1 > /dev/null
                if [ $? -ne 0 ]; then
                        offset=$n
                        return 1
                fi
        done
        return 0
}

function log () {
    if [[ $_V -eq 1 ]]; then
        echo "$@"
    fi
}

print_luns () {
        for lun in $@; do
                echo $lun
        done
}


if [[ "$1" == "-s" ]]; then
        _V=0
fi

log Testing fallocate on volumes
if [[ $_V -eq 1 ]]; then
        print_luns $LUNS
fi

for lun in $LUNS; do
        log ""
        log Processing lun $lun


        fallocate_test $lun
        if [ $? -eq 0 ]; then
                log "Zeroing first 20G with dd"
                dd if=/dev/zero of=/dev/mapper/${lun} oflag=direct bs=10M count=2000 > /dev/null
                sync
        else
                log Discovered fallocation error on offset $offset
                LUNS_BROKEN="$LUNS_BROKEN $lun"
                continue
        fi

        fallocate_test $lun
        if [ $? -ne 0 ]; then
                LUNS_BROKEN="$LUNS_BROKEN $lun"
                log Discovered fallocation error on offset $offset
        else
                LUNS_WORKING="$LUNS_WORKING $lun"
                log Fallocation error was not discovered
        fi
done
log ""
echo "Working luns:"
print_luns $LUNS_WORKING
echo ""
echo "Broken luns:"
print_luns $LUNS_BROKEN

