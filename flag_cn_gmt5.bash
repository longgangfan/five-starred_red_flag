# !/bin/bash
#This is a gmt5 script
gmtset  MAP_ORIGIN_X=0
gmtset  MAP_ORIGIN_Y=0
gmtset PS_PAGE_COLOR=244/0/2
#Prepare a custom star which can be rotated
cat >star_rotated.def<<EOF
N: 1 r
#Because it is in a bash script, so the "$1" in the next line shoud be in the form of  "\$1" insted of  "$1".
#roate the coordinate
\$1	R
#set the anchor point and connect the 10 points
0		0.5		M
0.112256994	0.154508497	D
0.475528258	0.154508497	D
0.181635632	-0.0590169944	D
0.293892626	-0.404508497	D
0		-0.190983006	D
-0.293892626	-0.404508497	D
-0.181635632	-0.0590169944	D
-0.475528258	0.154508497	D
-0.112256994	0.154508497	D
EOF
#draw the flag according to the input size number 
case $1 in 
	1)
#set the paper size
gmtset  PS_MEDIA=192cx288c
#make a data sheet of the five stars
cat  >tmp.dat <<EOF
48.00960	 144.0  	57.6	0
95.99040	172.8	19.2	-23.0362
115.2	153.6	19.2	-45.8699
115.2	124.8	19.2	74.0546
95.99040	105.6	19.2	51.3402
EOF
gmt  psxy tmp.dat  -R0/288/0/192  -JX288c/192c  -Skstar_rotated    -G250/244/8  >flag_cn_1.ps
psconvert flag_cn_1.ps -Tj -E72
rm *.conf *.history *.dat *def
	;;
	2)
gmtset  PS_MEDIA=160cx240c
cat  >tmp.dat <<EOF
40.0064 119.995 47.9981 0
79.9888 143.994 15.9994 -23.0362
95.9962 127.995 15.9994 -45.8699
95.9962 103.996 15.9994 74.0546
79.9888 87.9965 15.9994 51.3402
EOF
gmt  psxy tmp.dat  -R0/240/0/160  -JX240c/160c  -Skstar_rotated    -G250/244/8  >flag_cn_2.ps
psconvert flag_cn_2.ps -Tj -E72
rm *.conf *.history *.dat *.def
	;;
	3)
gmtset  PS_MEDIA=128cx192c
cat  >tmp.dat <<EOF
32.008 96.0048 38.4019 0
63.9968 115.206 12.8006 -23.0362
76.8038 102.405 12.8006 -45.8699
76.8038 83.2042 12.8006 74.0546
63.9968 70.4035 12.8006 51.3402
EOF
gmt  psxy tmp.dat  -R0/192/0/128 -JX192c/128c  -Skstar_rotated    -G250/244/8  >flag_cn_3.ps
psconvert flag_cn_3.ps -Tj -E72
rm *.conf *.history *.dat *.def
	;;
	4)
gmtset  PS_MEDIA=96cx144c
cat  >tmp.dat <<EOF
24.0048 72 28.8 0
47.9952 86.4 9.6 -23.0362
57.6 76.8 9.6 -45.8699
57.6 62.4 9.6 74.0546
47.9952 52.8 9.6 51.3402
EOF
gmt  psxy tmp.dat  -R0/144/0/96 -JX144c/96c  -Skstar_rotated    -G250/244/8  >flag_cn_4.ps
psconvert flag_cn_4.ps -Tj -E72
rm *.conf *.history *.dat *.def
	;;
	5)
gmtset  PS_MEDIA=64cx96c
cat  >tmp.dat <<EOF
16.0016 47.9952 19.1981 0
31.9936 57.5942 6.39936 -23.0362
38.3962 51.1949 6.39936 -45.8699
38.3962 41.5958 6.39936 74.0546
31.9936 35.1965 6.39936 51.3402
EOF
gmt  psxy tmp.dat  -R0/96/0/64 -JX96c/64c  -Skstar_rotated    -G250/244/8  >flag_cn_5.ps
psconvert flag_cn_5.ps -Tj -E72
rm *.conf *.history *.dat *.def
	;;
	*)
echo -e "\033[31m\nusage: ./flag_cn.bash [Size_number] \n\nNote: the size_number should range from 1 to 5 according to  the standards. \n\nSize_Number		Size\n\n   [1]		     192cm*288cm\n   [2]		     160cm*240cm\n   [3]		     128cm*192cm\n   [4]	     	     96cm*144cm\n   [5]	     	     64cm*96cm\033[0m"
rm *.conf  *.def
esac
