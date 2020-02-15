list=( O0 O1 O1native O2 O2native Os Osnative O3 O3native O3nativefastmath )
for each in "${list[@]}"
do
    echo This is the result of $each
    time ./$each
done

