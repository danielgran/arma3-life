# this script is used to test sqf scripts with a corresponding test file

# the test is done by calling the test file with the same name in the same folder with the same sqf file

# then the sqfvm environment is loaded and the sqf file is executed

for servermod in $(find ./dist -name "@*" -mindepth 1 -maxdepth 1 -type d); do

  #echo ${servermod#*/$(basename servermod)}

  for test in $(find $servermod/test -name 'test_*.sqf' -type f); do
    test_name=$(basename $test)
    test_name=${test_name%.*}
    test_name=${test_name#test_}
    echo "Testing $test"
    #docker run -v "$(pwd):/a3l" --rm -it danielgran/sqfvm sqfvm --suppress-welcome -v "/a3l/dist/@duck.core/addons|/" --input-config /a3l/dist/\@duck.core/addons/duck.core/config.cpp --input-sqf /a3l${test#.}
  done;

done;