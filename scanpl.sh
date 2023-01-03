#linux
# echo find . -type f -printf '%TY-%Tm-%Td_%TH%TM_%f ! %p \n'
# for mac: brew install findutils, then use: gfind ....
# gfind ./test\ data -not -path '*/\.*'  -type f -printf 'ln "%p" ./%TY/%Tm/%Td_%TH%TM_%f \n' 

c_home=".../test_data/1_source/"
c_target=".../test_data/2_output/"

a_exclude=("*/\.*" "*/*\.aae" "*/*\.jpeg")

c_exln="xln.sh"
c_exmkdir_temp="xmkdir_temp.txt"
c_exmkdir="xmkdir.sh"
c_exec="execute.sh"

cd "${c_target}"
pwd

#build full list "-not -path" condition
v_excludes=" "
for i in ${a_exclude[*]}
do
    v_excludes=${v_excludes}" -not -ipath "${i}" "
done
#echo ${v_excludes}

v_find_cond=${v_excludes}" -type f "
#echo ${v_find_cond}


echo "===== building ${c_exln} ..."
echo "cd \"${c_target}\"" > ${c_exln}
# gfind "${c_home}" -not -path '*/\.*' -not -path '*/*\.AAE' -not -path '*/*\.aae' -type f -printf 'ln "%p" "./%TY/%Tm/%Td_%TH%TM_%f" \n' >> ${c_exln}
gfind "${c_home}" ${v_find_cond} -printf 'ln "%p" "./%TY/%Tm/%Td_%TH%TM_%f" \n' >> ${c_exln}
# echo gfind "${c_home}" ${v_find_cond} -printf 'ln "%p" "./%TY/%Tm/%Td_%TH%TM_%f" \n' 

echo "----- ${c_exln} generated"
#cat ${c_exln}

echo "===== building ${c_exmkdir_temp} ..."
# gfind "${c_home}" -type f -printf 'mkdir -p ./%TY/%Tm/ \n' > ${c_exmkdir_temp}
gfind "${c_home}" ${v_find_cond} -printf 'mkdir -p ./%TY/%Tm/ \n' > ${c_exmkdir_temp}

echo "----- removing duiplicated lines of ${c_exmkdir_temp} ..."
echo "cd \"${c_target}\"" > ${c_exmkdir}
sort ${c_exmkdir_temp} | uniq >> ${c_exmkdir}

echo "----- ${c_exmkdir} generated"
rm ${c_exmkdir_temp}
#cat ${c_exmkdir}

echo "===== building ${c_exec} ..."
echo "cd \"${c_target}\"" > ${c_exec}
echo "./${c_exmkdir}" >> ${c_exec}
echo "./${c_exln}" >> ${c_exec}

chmod +x ${c_exln}
chmod +x ${c_exmkdir}
chmod +x ${c_exec}

echo "----- done, all set"



