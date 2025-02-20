from pyMedfound.Winerror cimport HRESULT
from pyMedfound.windef cimport ULONG
from pyMedfound.guiddef cimport GUID,REFIID

# https://learn.microsoft.com/zh-cn/windows/win32/api/unknwn/nn-unknwn-iunknown
cdef extern from "unknwn.h":
    cdef cppclass IUnknown:
        HRESULT QueryInterface(REFIID riid, void** ppvObject)
        ULONG AddRef()
        ULONG Release()