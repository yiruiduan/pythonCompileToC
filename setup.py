from distutils.core import setup
from Cython.Build import cythonize
from complieFile import complieFiles

files = complieFiles()
filesList = files.getFileList(".",".py")



setup(
    # ext_modules = cythonize(["aaa/__init__.py","aaa/a.py","aaa/b.py","aaa/c.py"]))
    ext_modules = cythonize(filesList)
)