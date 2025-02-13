
cdef extern from "Winerror.h":
    ctypedef long HRESULT

    # https://learn.microsoft.com/zh-cn/windows/win32/seccrypto/common-hresult-values
    ctypedef int S_OK
    ctypedef int E_ABORT
    ctypedef int E_ACCESSDENIED
    ctypedef int E_FAIL
    ctypedef int E_HANDLE
    ctypedef int E_INVALIDARG
    ctypedef int E_NOINTERFACE
    ctypedef int E_NOTIMPL
    ctypedef int E_OUTOFMEMORY
    ctypedef int E_POINTER
    ctypedef int E_UNEXPECTED