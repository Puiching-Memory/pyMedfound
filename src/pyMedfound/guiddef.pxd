from pyMedfound.WinDef cimport BYTE

cdef extern from "guiddef.h":
    ctypedef struct GUID:
        # unsigned long  Data1
        # unsigned short Data2
        # unsigned short Data3
        # BYTE          Data4[8]
        pass
        
    ctypedef GUID IID

    ctypedef const IID* REFIID