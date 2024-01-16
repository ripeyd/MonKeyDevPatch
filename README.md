### 测试环境
Intel Core i7  /  macOS Version 14.0 (Build 23A344)  /  Xcode 15.0.1 (22266) (Build 15A507)

# MonKeyDev Patch

先安装官方MonkeyDev，然后替换仓库模版到/opt/MonkeyDev/templates

官方安装地址：[https://github.com/AloneMonkey/MonkeyDev ](https://github.com/AloneMonkey/MonkeyDev/wiki)https://github.com/AloneMonkey/MonkeyDev/wiki

补丁说明：
- 解决Signing for "xxxxx" requires a development team. Select a development team in the Signing & Capabilities editor.
- 解决Build input files cannot be found: '/usr/lib/libstdc++.dylib', '/usr/lib/libc++.dylib'. Did you forget to declare these files as outputs of any script phases or custom build rules which produce them?
- 解决Executable Path is a Directory
- 解决Unable to install "xxxxx"
- 解决Logos 没自动生成mm Hook代码
- 解决FishHook异常
