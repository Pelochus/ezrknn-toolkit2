#!/bin/bash

# Made by Pelochus
# Check for more info: https://github.com/Pelochus/ezrknn-toolkit2/

# Repository information
REPO_URL="https://github.com/Pelochus/ezrknn-toolkit2.git"
INSTALL_DIR="ezrknn-toolkit2"

# pip dependencies
PIP_WHL="./rknn-toolkit-lite2/packages/rknn_toolkit_lite2-2.3.2-cp312-cp312-manylinux_2_17_aarch64.manylinux2014_aarch64.whl"
REQS_FILE="./rknn-toolkit2/packages/arm64/arm64_requirements_cp312.txt"

# RKNN API installation paths
LIBRKNN_SRC="./rknpu2/runtime/Linux/librknn_api/aarch64/librknnrt.so"
LIBRKNN_DST="/usr/lib/librknnrt.so"
INCLUDE_SRC="./rknpu2/runtime/Linux/librknn_api/include/"
INCLUDE_DST="/usr/local/include"

# RKNN Benchmark
BENCHMARK_DIR="./rknpu2/examples/rknn_benchmark/"
BENCHMARK_BIN="/usr/bin/rknn_benchmark"

message_print() {
    echo
    echo "#########################################"
    echo "$1"
    echo "#########################################"
    echo
}

file_not_found_exit() {
    echo "Error: $1 not found!"
    exit 1
}

message_print "Checking root permission..."

if [ "$EUID" -ne 0 ]
then
    echo "Please run this script as root!"
    exit 1
fi

message_print "Installing pip dependencies for ARM64..."

if [ -f "$PIP_WHL" ]
then
    pip install "$PIP_WHL" --break-system-packages
else
    file_not_found_exit "$PIP_WHL"
fi

if [ -f "$REQS_FILE" ]
then
    pip install -r "$REQS_FILE" --break-system-packages
else
    file_not_found_exit "$REQS_FILE"
fi

message_print "Installing RKNN NPU API..."

if [ -f "$LIBRKNN_SRC" ]
then
    cp "$LIBRKNN_SRC" "$LIBRKNN_DST"
else
    file_not_found_exit "$LIBRKNN_SRC"
fi

if [ -d "$INCLUDE_SRC" ]
then
    cp -r "$INCLUDE_SRC" "$INCLUDE_DST"
else
    file_not_found_exit "RKNN include files not found."
fi

message_print "Compiling RKNN Benchmark for RK3588..."

if [ -d "$BENCHMARK_DIR" ]
then
    cd "$BENCHMARK_DIR"
    bash build-linux.sh -t rk3588 -a aarch64 -b Release
    if [ -f "install/rknn_benchmark_Linux/rknn_benchmark" ]
    then
        cp install/rknn_benchmark_Linux/rknn_benchmark "$BENCHMARK_BIN"
    else
        file_not_found_exit "Compiled benchmark binary. Compilation failed?"
    fi
else
    file_not_found_exit "$BENCHMARK_DIR"
fi

message_print "Done installing ezrknn-toolkit2!"

