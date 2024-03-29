OpenCore引导版 | [Clover引导版](https://github.com/FuckDoctors/ideapad-720s-13IKB)


## OpenCore

### 配置上跟Clover版差别

主要是下面几点：

- 不使用自定义DSDT，尽量使用SSDT

- 原来在DSDT中修改的关于**触控板**以及**亮度调节**的部分改为SSDT

- 尽可能少的使用更名补丁，OC不推荐的那几个不使用

- BIOS设置变更

  - Boot Mode改用`UEFI`方式

    `Legacy Support`方式启动时经常卡死在引导界面。

  - 启用TPM支持Win11

- 其他

### 电脑配置以及BIOS设置

详情信息请参考[Clover引导版](https://github.com/FuckDoctors/ideapad-720s-13IKB)。

### 驱动状况

基本都能正常工作，详情参照[Clover引导版](https://github.com/FuckDoctors/ideapad-720s-13IKB)。

CPU变频，以MacBookPro15,2为例：

使用`CPUFriend`里的工具制作变频数据，可以使用kext也可以使用acpi。

为了更好的性能，我选择了acpi，并且跟`plugin-type`合并在一块了`SSDT-PLUG-_PR.PR00_FREQ.dsl`。

``` shell
./ResourceConverter.sh --acpi /System/Library/Extensions/IOPlatformPluginFamily.kext/Contents/PlugIns/X86PlatformPlugin.kext/Contents/Resources/Mac-827FB448E656EC26.plist

./ResourceConverter.sh --kext /System/Library/Extensions/IOPlatformPluginFamily.kext/Contents/PlugIns/X86PlatformPlugin.kext/Contents/Resources/Mac-827FB448E656EC26.plist
```

### 其他说明

 - 为了简便管理，不再使用rEFInd做引导了

 - rEFInd

   使用rEFInd做引导，ACPI无副作用，还可以引导Windows，Clover，OpenCore，为黑苹果做双重引导，降低翻车几率。

   使用方法，参考`rEFInd`分支。

### 感谢：

 - [OpenCore](https://github.com/acidanthera/OpenCorePkg)

 - [OC-little](https://github.com/daliansky/OC-little)

   
