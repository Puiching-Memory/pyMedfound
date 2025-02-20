from pyMedfound.windef cimport BOOL,BYTE,ULONG
from pyMedfound.guiddef cimport GUID
from pyMedfound.Unknwn cimport IUnknown

# https://learn.microsoft.com/zh-cn/windows/win32/api/strmif/
cdef extern from "strmif.h":
    # https://learn.microsoft.com/zh-cn/windows/win32/api/strmif/ns-strmif-am_media_type
    ctypedef struct AM_MEDIA_TYPE:
        GUID     majortype
        GUID     subtype
        BOOL     bFixedSizeSamples
        BOOL     bTemporalCompression
        ULONG    lSampleSize
        GUID     formattype
        IUnknown *pUnk
        ULONG    cbFormat
        BYTE     *pbFormat