# rm result.gal
# gcc -o galsim galsim.c -lm -O3
# ./galsim 100 ellipse_N_00100.gal 200 0.00001 0
# ./compare 100 result.gal ellipse_N_00100_after200steps.gal
# time ./galsim 100 ellipse_N_00100.gal 200 0.00001 0

#!bin/bash
make
folder_ref="./ref_output_data/"
folder_input="./input_data/"
tail=".gal"
echo =================================================================================== >> report.log
for file in $(ls ${folder_ref})
do
    echo ${file:10:5} ${folder_input}${file:0:15}${tail} ${file:21:3} >> report.log
    ./test ${file:10:5} ${folder_input}${file:0:15}${tail} ${file:21:3} 0.00001 0 0
    ./galsim  ${file:10:5} ${folder_input}${file:0:15}${tail} ${file:21:3} 0.00001 0
    ./compare ${file:10:5} result.gal refresult.gal >> report.log
    for i in {1..10}
    do
	echo ${i}
	echo ${i} >> report.log
	{ time ./test ${file:10:5} ${folder_input}${file:0:15}${tail} ${file:21:3} 0.00001 0.25 0; } 2>> report.log
    done

done
