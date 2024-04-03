#!/bin/bash

# Made by Pelochus
# Check for more info: https://github.com/Pelochus/ezrknn-toolkit2/

echo
echo "#########################################"
echo "Checking root permission..."
echo "#########################################"
echo

if [ "$EUID" -ne 0 ]; then 
  echo "Please run this script as root!"
  exit
fi

echo
echo "#########################################"
echo "Installing apt dependencies..."
echo "#########################################"
echo

sudo apt update
sudo apt install -y git python-is-python3 python3-pip libxslt1-dev zlib1g-dev libglib2.0-dev libsm6 libgl1-mesa-glx libprotobuf-dev build-essential
# sudo apt install -y adb # For running the NPU in Android

echo
echo "#########################################"
echo "Cloning repository..."
echo "#########################################"
echo

git clone https://github.com/Pelochus/ezrknn-toolkit2.git
cd ezrknn-toolkit2/

echo
echo "#########################################"
echo "Installing pip dependencies for ARM64..."
echo "#########################################"
echo

pip install ./rknn-toolkit-lite2/packages/rknn_toolkit_lite2-2.0.0b0-cp311-cp311-linux_aarch64.whl
pip install -r ./rknn-toolkit2/packages/requirements_cp311-2.0.0b0.txt

echo
echo "#########################################"
echo "Installing RKNN NPU API..."
echo "#########################################"
echo

cp ./rknpu2/runtime/Linux/librknn_api/aarch64/librknnrt.so /usr/lib/
# TODO: Check if it should be copied to /usr/include instead
cp ./rknpu2/runtime/Linux/librknn_api/include/* /usr/local/include

echo
echo "#########################################"
echo "Compiling RKNN Benchmark for RK3588..."
echo "#########################################"
echo

bash ./rknpu2/examples/rknn_benchmark/build-linux.sh -a aarch64 -b Release -t rk3588

echo
echo "#########################################"
echo "Done!"
echo "#########################################"
echo