from pyMedfound.winerror cimport HRESULT
from pyMedfound.windef cimport ULONG,BOOL
from pyMedfound.guiddef cimport REFIID

# https://learn.microsoft.com/zh-cn/windows/win32/api/unknwn/nn-unknwn-iunknown
cdef extern from "unknwn.h":
    cdef cppclass IUnknown:
        # https://learn.microsoft.com/zh-cn/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(refiid_void)
        HRESULT QueryInterface(
            REFIID riid,
            void   **ppvObject
            )

        # https://learn.microsoft.com/zh-cn/windows/win32/api/unknwn/nf-unknwn-iunknown-addref
        ULONG AddRef()

        # https://learn.microsoft.com/zh-cn/windows/win32/api/unknwn/nf-unknwn-iunknown-release
        ULONG Release()

    # https://learn.microsoft.com/zh-cn/windows/win32/api/unknwn/nn-unknwn-iclassfactory
    cdef cppclass IClassFactory(IUnknown):
        # https://learn.microsoft.com/zh-cn/windows/win32/api/unknwn/nf-unknwn-iclassfactory-createinstance
        HRESULT CreateInstance(
            IUnknown *pUnkOuter, # [in]
            REFIID   riid,       # [in]
            void     **ppvObject # [out]
            )

        # https://learn.microsoft.com/zh-cn/windows/win32/api/unknwn/nf-unknwn-iclassfactory-lockserver
        HRESULT LockServer(
            BOOL fLock # [in]
            )