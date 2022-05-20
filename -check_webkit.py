#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import sys

def check_dependcy_webkit_library(app_path):
    if len(app_path) <= 0:
        exit("app path 错误")
        return

    if os.path.isdir(app_path) == False:
        exit("app path 不是目录")
        return

    # 文件名 不包含扩展名
    filename = os.path.basename(os.path.splitext(app_path)[0])

    # 需要检测的库
    checks = [MachODependcyDynamicLibrary(app_path + "/" + filename, filename)]

    # Frameworks库
    subpath = app_path + "/" + "Frameworks"
    dirs = os.listdir(subpath)

    for dir in dirs:
        framework_name = os.path.splitext(dir)[0]
        framework_full_path = subpath + "/%s.framework/" % framework_name + framework_name
        dylib_full_path = subpath + "/%s.dylib" % framework_name
        if os.path.exists(framework_full_path):
            checks.append(MachODependcyDynamicLibrary(framework_full_path, framework_name))
        elif os.path.exists(dylib_full_path):
            checks.append(MachODependcyDynamicLibrary(dylib_full_path, framework_name))


    results = []
    for element in checks:
        main_result = element.check_contain_webkit()
        if main_result is not None:
            results.append(main_result)

    if len(results) <= 0:
        print("未检测到有问题的库✅")
        return 0
    else:
        print("--- 检测到有问题的库⚠️ ---️")
        print(results)
        return 1


# machO 依赖的动态库
class MachODependcyDynamicLibrary:

    def __init__(self, path, filename):
        self.path = path
        self.filename = filename

    # 分析依赖的动态库
    def get_dependcy_dynamic_libraries(self):
        with open(self.path, 'rb') as binfile:
            filesize = os.path.getsize(self.path)
            if filesize < 4:
                print("文件有问题: %s" % self.path)
                return

            magic = self.get_magic(binfile)
            if self.is_machO(magic) == False:
                print("不是machO文件: %s" % self.path)
                return

            file = os.popen("otool -L %s" % self.path)  # 返回的是一个文件对象
            content = file.read()
            contents = content.split("\n\t")
            # 这里还可以解析出库的name

            return contents

    # 是否包含webkit
    def check_contain_webkit(self):
        # 匹配的库
        libraries = []
        for element in ["SafariServices.framework", "Webkit.framework"]:
            libraries.append(element.lower())

        dependcy_dynamic_libraries = self.get_dependcy_dynamic_libraries()

        if dependcy_dynamic_libraries is None:
            return None

        result = set()

        for element in dependcy_dynamic_libraries:
            for library in libraries:
                if element.lower().find(library) != -1:
                    result.add(library)

        if len(result) > 0:
            return ResultLibrary(self.filename, list(result))
        else:
            return None

    # 获取magic
    def get_magic(self, binfile):
        return binfile.read(4)

    # 是否是machO文件
    def is_machO(self, magic):
        # FEEDFACF
        # BEBAFECA 胖二进制
        if magic == b'\xcf\xfa\xed\xfe' or magic == b'\xca\xfe\xba\xbe':
            return True
        else:
            return False

# 检测的结果
class ResultLibrary:
    def __init__(self, library_name, depencies):
        self.library_name = library_name
        self.depencies = depencies

    def __str__(self):
        return self.__repr__()

    def __repr__(self):
        return "库名: %s, 依赖: %s" % (self.library_name, str(self.depencies))

def main(argv):
    path = argv[1]
    print("WebKit Checking" + path)
    ret = check_dependcy_webkit_library(path)
    exit(ret)


if __name__ == "__main__":
    main(sys.argv)










