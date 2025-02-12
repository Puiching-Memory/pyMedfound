#cython:language_level=3
from libc.stdint cimport uint32_t,int64_t,uint8_t

cdef extern from "Windows.h":
    # must be included before other Windows headers
    pass

cdef extern from "WinDef.h":
    int MAX_PATH

    ctypedef unsigned char BYTE
    ctypedef unsigned int DWORD
    ctypedef signed int INT32
    ctypedef signed long long INT64
    ctypedef signed long LONG
    ctypedef signed long long LONGLONG
    ctypedef unsigned int UINT32
    ctypedef unsigned long long UINT64
    ctypedef unsigned long ULONG
    ctypedef unsigned long long ULONGLONG
    ctypedef unsigned short WORD
    ctypedef short int INT16
