#!/bin/bash
# Before executing this script, execute the following 2 commands:
# git clone https://github.com/globusmedical/spix.git spix_bld && cd spix_bld
# git checkout setup-tweaks
working_dir=$(pwd)
echo "pwd: $working_dir"
anyrpc_7z="./anyrpc-rel.7z"
Qt5_DIR="D:/Development/gm-venv/sdk-cpp/qt-v5-x64_5.15.18-gm001-rev_42f2de5/lib/cmake/Qt5" # Change this to your Qt5_DIR
PATH=$PATH:"D:\Development\gm-venv\sdk-cpp\ninja-x64_1.12.1-rev_81ba1f1\bin"
rm Spix*.lib
cp CMakeLists.qt5 CMakeLists.txt
[ -d $working_dir/anyrpc ] && rm -r $working_dir/anyrpc
"/c/Program Files (x86)/7-Zip/7z.exe" x $anyrpc_7z -o$working_dir
[ -d build ] && rm -r build
mkdir build && cd build
build_type="Debug"
cmake .. -G Ninja -DAnyRPC_INCLUDE_DIRS="$working_dir/anyrpc/include" -DAnyRPC_LIBRARIES="$working_dir/anyrpc/lib" -DQt5_DIR=$Qt5_DIR -DCMAKE_BUILD_TYPE=$build_type
cmake --build . --config $build_type
cp ./lib/Spix.lib ../Spixd.lib
cd $working_dir
[ -d build ] && rm -r build
mkdir build && cd build
build_type="Release"
cmake .. -G Ninja -DAnyRPC_INCLUDE_DIRS="$working_dir/anyrpc/include" -DAnyRPC_LIBRARIES="$working_dir/anyrpc/lib" -DQt5_DIR=$Qt5_DIR -DCMAKE_BUILD_TYPE=$build_type
cmake --build . --config $build_type
cp ./lib/Spix.lib ../Spix.lib
