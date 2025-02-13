from pyMedfound.Winerror cimport HRESULT
from pyMedfound.WinDef cimport ULONG
from pyMedfound.guiddef cimport REFIID

# https://learn.microsoft.com/zh-cn/windows/win32/api/unknwn/nn-unknwn-iunknown
cdef extern from "unknwn.h":
    ctypedef struct IUnknown:
        HRESULT (*QueryInterface)(IUnknown *, REFIID, void **)
        ULONG AddRef()
        ULONG Release()