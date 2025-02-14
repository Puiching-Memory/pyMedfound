#cython:language_level=3

cdef extern from "windows.h":
    # must be included before other Windows headers
    pass

cdef extern from "windef.h": # --> "miniwindef.h"
    int MAX_PATH

    int FALSE
    int TRUE

    # https://learn.microsoft.com/en-us/windows/win32/learnwin32/windows-coding-conventions
    ctypedef unsigned char BYTE
    ctypedef unsigned int DWORD
    ctypedef int INT32
    ctypedef short INT16
    ctypedef long long INT64
    ctypedef int LONG
    ctypedef long long LONGLONG
    ctypedef unsigned int UINT32
    ctypedef unsigned long long UINT64
    ctypedef unsigned int ULONG
    ctypedef unsigned long long ULONGLONG
    ctypedef unsigned short WORD

    # "miniwindef.h"
    ctypedef int BOOL
    ctypedef float FLOAT
    ctypedef FLOAT *PFLOAT
    ctypedef BOOL *PBOOL # near
    ctypedef BOOL *LPBOOL # far
    ctypedef BYTE *PBYTE # near
    ctypedef BYTE *LPBYTE # far
    ctypedef int *PINT # near
    ctypedef int *LPINT # far
    ctypedef WORD *PWORD # near
    ctypedef WORD *LPWORD # far
    ctypedef long *LPLONG # far
    ctypedef DWORD *PDWORD # near
    ctypedef DWORD *LPDWORD # far
    ctypedef void *LPVOID  # far
    ctypedef const void *LPCVOID # far

    ctypedef int INT
    ctypedef unsigned int UINT
    ctypedef unsigned int *PUINT

    # https://learn.microsoft.com/en-us/windows/win32/api/windef/ns-windef-size
    ctypedef struct SIZE:
        LONG cx
        LONG cy

    ctypedef SIZE* PSIZE
    ctypedef SIZE* LPSIZE

