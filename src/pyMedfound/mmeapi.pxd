
from pyMedfound.windef cimport WORD,DWORD

# https://learn.microsoft.com/zh-cn/windows/win32/api/mmeapi/
cdef extern from "mmeapi.h":
    # https://learn.microsoft.com/zh-cn/windows/win32/api/mmeapi/ns-mmeapi-waveformatex
    ctypedef struct WAVEFORMATEX:
        WORD  wFormatTag
        WORD  nChannels
        DWORD nSamplesPerSec
        DWORD nAvgBytesPerSec
        WORD  nBlockAlign
        WORD  wBitsPerSample
        WORD  cbSize

    ctypedef WAVEFORMATEX* PWAVEFORMATEX
    ctypedef WAVEFORMATEX* NPWAVEFORMATEX
    ctypedef WAVEFORMATEX* LPWAVEFORMATEX
