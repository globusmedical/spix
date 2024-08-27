#!/bin/bash
# Before executing this script, execute the following 2 commands:
# git clone https://github.com/globusmedical/spix.git spix_bld && cd spix_bld
# git checkout setup-tweaks
working_dir=$(pwd)
anyrpc_7z="$working_dir/anyrpc-rel.7z"
Qt6_DIR="C:\Development\gm-venv\sdk-cpp\qt-v6-x64_6.7.1-rev_41f6121\lib\cmake\Qt6" # Change this to your Qt6_DIR
Qt6QmlTools_DIR="C:\Development\gm-venv\sdk-cpp\qt-v6-x64_6.7.1-rev_41f6121\lib\cmake\Qt6QmlTools" # Change this to your Qt6QmlTools_DIR
rm Spix*.lib
cp CMakeLists.qt6 CMakeLists.txt
[ -d $working_dir/anyrpc ] && rm -r $working_dir/anyrpc
"/c/Program Files/7-Zip/7z.exe" x $anyrpc_7z -o$working_dir
[ -d build ] && rm -r build
mkdir build && cd build
build_type="Debug"
cmake .. -G Ninja -DAnyRPC_INCLUDE_DIRS="$working_dir/anyrpc/include" -DAnyRPC_LIBRARIES="$working_dir/anyrpc/lib" -DQt6_DIR=$Qt6_DIR -DQt6QmlTools_DIR=$Qt6QmlTools_DIR -DCMAKE_BUILD_TYPE=$build_type
cmake --build . --config $build_type
cp ./lib/Spix.lib ../Spixd.lib
cd $working_dir
[ -d build ] && rm -r build
mkdir build && cd build
build_type="Release"
cmake .. -G Ninja -DAnyRPC_INCLUDE_DIRS="$working_dir/anyrpc/include" -DAnyRPC_LIBRARIES="$working_dir/anyrpc/lib" -DQt6_DIR=$Qt6_DIR -DQt6QmlTools_DIR=$Qt6QmlTools_DIR -DCMAKE_BUILD_TYPE=$build_type
cmake --build . --config $build_type
cp ./lib/Spix.lib ../Spix.lib
