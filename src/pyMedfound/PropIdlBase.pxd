
# https://learn.microsoft.com/zh-cn/windows/win32/api/propidlbase/
cdef extern from "PropIdlBase.h":
    # https://learn.microsoft.com/zh-cn/windows/win32/api/propidlbase/ns-propidlbase-propvariant
    ctypedef struct PROPVARIANT:
        pass
    
    ctypedef PROPVARIANT* LPPROPVARIANT
    ctypedef PROPVARIANT* REFPROPVARIANT