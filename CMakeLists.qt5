cmake_minimum_required(VERSION 3.18)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_LIST_DIR}/cmake/modules")
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_AR "D:/Development/gm-venv/sdk-cpp/llvm-v18-x64_18.1.8-gm002-rev_94b40a4/bin/llvm-lib.exe")
set(CMAKE_CXX_COMPILER "D:/Development/gm-venv/sdk-cpp/llvm-v18-x64_18.1.8-gm002-rev_94b40a4/bin/clang-cl.exe")
set(CMAKE_NM "D:/Development/gm-venv/sdk-cpp/llvm-v18-x64_18.1.8-gm002-rev_94b40a4/bin/llvm-nm.exe")
set(CMAKE_RC_COMPILER "D:/Development/gm-venv/sdk-cpp/win-sdk-v143-x64_10.0.20348.0-gm002-rev_ca03b54/Windows Kits/10/bin/10.0.20348.0/x64/rc.exe")
set(CMAKE_MT "D:/Development/gm-venv/sdk-cpp/win-sdk-v143-x64_10.0.20348.0-gm002-rev_ca03b54/Windows Kits/10/bin/10.0.20348.0/x64/mt.exe")
set(UCRTVersion "10.0.20348.0")
set(VCINSTALLDIR "D:/Development/gm-venv/sdk-cpp/msvc-v143-x64_14.36.32532-gm002-rev_a609521/BuildTools/VC")
set(WindowsSdkDir "D:/Development/gm-venv/sdk-cpp/win-sdk-v143-x64_10.0.20348.0-gm002-rev_ca03b54/Windows Kits/10")

project(Spix LANGUAGES CXX)

option(SPIX_BUILD_EXAMPLES "Build Spix examples." OFF)
option(SPIX_BUILD_TESTS "Build Spix unit tests." OFF)
set(SPIX_QT_MAJOR "5" CACHE STRING "Major Qt version to build Spix against")

# Hide symbols unless explicitly flagged with SPIX_EXPORT
set(CMAKE_CXX_VISIBILITY_PRESET hidden)
set(CMAKE_VISIBILITY_INLINES_HIDDEN 1)

add_subdirectory(lib)

if(SPIX_BUILD_EXAMPLES)
    add_subdirectory(examples)
endif()

if(SPIX_BUILD_TESTS)
    enable_testing()
    add_subdirectory(lib/tests)
endif()
