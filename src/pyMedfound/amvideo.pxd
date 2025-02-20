
from pyMedfound.windef cimport RECT, DWORD

cdef extern from "amvideo.h":
    # https://learn.microsoft.com/zh-cn/previous-versions/windows/desktop/api/amvideo/ns-amvideo-videoinfoheader
    ctypedef struct VIDEOINFOHEADER:
        RECT             rcSource
        RECT             rcTarget
        DWORD            dwBitRate
        DWORD            dwBitErrorRate
        REFERENCE_TIME   AvgTimePerFrame
        BITMAPINFOHEADER bmiHeader