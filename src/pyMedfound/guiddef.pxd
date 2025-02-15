cdef extern from "guiddef.h":

    # https://learn.microsoft.com/zh-cn/windows/win32/api/guiddef/ns-guiddef-guid
    # https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-dtyp/24637f2d-238b-4d22-b44d-fe54b024280c
    ctypedef struct GUID:
        unsigned long  Data1
        unsigned short Data2
        unsigned short Data3
        unsigned char  Data4[8]
        
    ctypedef GUID IID
    ctypedef GUID UUID
    ctypedef GUID* PGUID

    ctypedef const IID* REFIID
    
    ctypedef GUID* REFGUID