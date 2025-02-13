from setuptools import setup, Extension, find_packages
import os
import shutil
import numpy as np

from Cython.Build import cythonize
from Cython.Distutils import build_ext

ext_modules = [
    Extension(
        "pyMedfound.mfapi",
        sources=["./src/pyMedfound/mfapi.pyx"],
        include_dirs=[np.get_include()], 
        #library_dirs=["./libde265/build/libde265/Release/"], 
        libraries=["dxva2","evr","mf","mfplat","mfplay","mfreadwrite","mfuuid"], # https://learn.microsoft.com/en-us/windows/win32/medfound/media-foundation-headers-and-libraries
        #extra_compile_args=["/openmp"],  # only for Windows 
        #extra_compile_args=["/D_M_AMD64","/D_WIN64"], # https://learn.microsoft.com/zh-cn/cpp/preprocessor/predefined-macros?view=msvc-170
    ),
]

setup(
    name="pyMedfound",
    ext_modules=cythonize(ext_modules, nthreads=os.cpu_count(), annotate=True),
)
