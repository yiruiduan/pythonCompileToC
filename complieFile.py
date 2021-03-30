import os
class complieFiles():
    def __init__(self):
        self.excludeName= ["venv","main.py","setup.py","build",".idea","__pycache__","complieFile.py"]

    def isEndOf(self,fileName,extName):
        if fileName.endswith(extName):
            return True
        else:
            return False
    def getFileList(self,filePath,extName):
        fileList=[]
        for comPath in os.listdir(filePath):
            if comPath not in self.excludeName:
                if os.path.isdir(comPath):
                    for cur_dir, dirs, files in os.walk(comPath):
                        if len(files) != 0:
                            for file in files:
                                if self.isEndOf(file,extName):
                                    if file in self.excludeName:
                                        continue
                                    fileList.append("%s/%s"%(cur_dir,file))
                else:
                    if self.isEndOf(comPath, extName):
                        fileList.append(comPath)
        # print(len(fileList))
        return fileList