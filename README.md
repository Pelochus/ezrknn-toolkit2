# EZ RKNN Toolkit 2
This repo tries to make RKNN Toolkit 2 install easier and more organised. RKNN Toolkit is the software used for testing and using the NPU inside Rockchip's chips like the RK3588 found in the Orange Pi 5 and Radxa Rock 5

## Quick Install
Run:

```bash
git clone https://github.com/Pelochus/EZRKNN-Toolkit2.git
cd EZRKNN-Toolkit2/
bash quick-install.sh
```

Keep in mind this is focused for:
- ARM64 devices.
- You are running either Debian 11 or Ubuntu 22.04 or later versions. Derivatives should possibly work fine too.
- Possibly will work better on not heavily modified OS installations (i.e. not using an older Python version or too recent)

## References
- Lots of info here, but not very well organised: https://github.com/airockchip/rknn-toolkit2/tree/master
- Example of CV and developing. I extracted some commands for installing: https://github.com/Qengineering/YoloV5-NPU-Rock-5
- This link explains the main capabilities of RKNN Toolkit 2: https://wiki.t-firefly.com/en/ROC-RK3588S-PC/usage_npu.html#rknn-toolkit2
- Some basic but well explained info for Radxa devices: https://docs.radxa.com/en/rock5/rock5b/low-level-dev/rknn-toolkit2  

# Original README starts below

<hr>
<hr>
<hr>

# Description
  RKNN software stack can help users to quickly deploy AI models to Rockchip chips. The overall framework is as follows:
    <center class="half">
        <div style="background-color:#ffffff;">
        <img src="res/framework.png" title="RKNN"/>
    </center>

  In order to use RKNPU, users need to first run the RKNN-Toolkit2 tool on the computer, convert the trained model into an RKNN format model, and then inference on the development board using the RKNN C API or Python API.

- RKNN-Toolkit2 is a software development kit for users to perform model conversion, inference and performance evaluation on PC and Rockchip NPU platforms.

- RKNN-Toolkit-Lite2 provides Python programming interfaces for Rockchip NPU platform to help users deploy RKNN models and accelerate the implementation of AI applications.

- RKNN Runtime provides C/C++ programming interfaces for Rockchip NPU platform to help users deploy RKNN models and accelerate the implementation of AI applications.

- RKNPU kernel driver is responsible for interacting with NPU hardware. It has been open source and can be found in the Rockchip kernel code.

# Support Platform
  - RK3588 Series
  - RK3576 Series
  - RK3566/RK3568 Series
  - RK3562 Series
  - RV1103/RV1106
  - RV1103B/RV1106B
  - RV1126B
  - RK2118

Note:

​      **For RK1808/RV1109/RV1126/RK3399Pro, please refer to :**

​          https://github.com/airockchip/rknn-toolkit

​          https://github.com/airockchip/rknpu

​          https://github.com/airockchip/RK3399Pro_npu


# Download
- You can also download all packages, docker image, examples, docs and platform-tools from [RKNPU2_SDK](https://console.zbox.filez.com/l/I00fc3), fetch code: rknn
- You can get more examples from [rknn mode zoo](https://github.com/airockchip/rknn_model_zoo)

# Notes
- RKNN-Toolkit2 is not compatible with [RKNN-Toolkit](https://github.com/airockchip/rknn-toolkit)
- The supported Python versions are:
  - Python 3.6
  - Python 3.7
  - Python 3.8
  - Python 3.9
  - Python 3.10
  - Python 3.11
  - Python 3.12
- Latest version:v2.3.2

# RKNN LLM

If you want to deploy LLM (Large Language Model), we have introduced a new SDK called RKNN-LLM. For details, please refer to:

https://github.com/airockchip/rknn-llm

# CHANGELOG

## v2.3.2
- Support for RV1126B platform
- Improved einsum and Norm operations support
- Added automatic mixed precision functionality
- Enhanced graph optimization capabilities
      

 for older version, please refer [CHANGELOG](CHANGELOG.md)

# Feedback and Community Support
- [Redmine](https://redmine.rock-chips.com) (**Feedback recommended, Please consult our sales or FAE for the redmine account**)
- QQ Group Chat: 1025468710 (full, please join group 4)
- QQ Group Chat2: 547021958 (full, please join group 4)
- QQ Group Chat3: 469385426 (full, please join group 4)
- QQ Group Chat4: 958083853
<center class="half">
  <img width="200" height="200"  src="res/QQGroupQRCode.png" title="QQ Group Chat"/>
  <img width="200" height="200"  src="res/QQGroup2QRCode.png" title="QQ Group Chat2"/>
  <img width="200" height="200"  src="res/QQGroup3QRCode.png" title="QQ Group Chat3"/>
  <img width="200" height="200"  src="res/QQGroup4QRCode.png" title="QQ Group Chat4"/>
</center>
