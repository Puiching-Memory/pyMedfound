#cython:language_level=3
from libc.stdint cimport uint32_t,int64_t,uint8_t

cdef extern from "Windows.h":
    pass

cdef extern from "WinDef.h":
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