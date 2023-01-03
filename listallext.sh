#linux
# echo find . -type f -printf '%TY-%Tm-%Td_%TH%TM_%f ! %p \n'
# for mac: brew install findutils, then use: gfind ....
# gfind ./test\ data -not -path '*/\.*'  -type f -printf 'ln "%p" ./%TY/%Tm/%Td_%TH%TM_%f \n' 

c_home=".../test_data/1_source/"
c_target=".../test_data/2_output/"

# a_exclude=("*/\.*" "*/*\.aae" "*/*\.jpeg")

c_exts="all_exts.txt"
c_exts_temp="all_exts_temp.txt"

#build full list "-not -path" condition
v_excludes=" "
# for i in ${a_exclude[*]}
# do
#     v_excludes=${v_excludes}" -not -ipath "${i}" "
# done
#echo ${v_excludes}

v_find_cond=${v_excludes}" -type f "
#echo ${v_find_cond}

cd "${c_target}"

pwd

echo "===== building ${c_exts} ..."
gfind "${c_home}" ${v_find_cond} -printf '%f\n' >> ${c_exts_temp}
cut -f 2 -d '.' ${c_exts_temp} | sort | uniq > ${c_exts}
rm ${c_exts_temp}

echo "----- done, all exts are:"
cat ${c_exts}



