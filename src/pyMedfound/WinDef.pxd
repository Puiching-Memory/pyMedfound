#cython:language_level=3

cdef extern from "windows.h":
    # must be included before other Windows headers
    pass

cdef extern from "windef.h": # --> "minwindef.h"
    # https://learn.microsoft.com/en-us/windows/win32/learnwin32/windows-coding-conventions
    # https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-dtyp/cca27429-5689-4a16-b2b4-9325d93e4ba2
    # https://learn.microsoft.com/en-us/windows/win32/winprog/windows-data-types
    # NOTE: LP means far pointer, P means near pointer
    ctypedef unsigned short wchar_t
    ctypedef void* ADCONNECTION_HANDLE
    ctypedef int BOOL
    ctypedef BOOL* PBOOL
    ctypedef BOOL* LPBOOL
    ctypedef unsigned char BYTE
    ctypedef BYTE* PBYTE
    ctypedef BYTE* LPBYTE
    ctypedef BYTE BOOLEAN
    ctypedef BOOLEAN* PBOOLEAN
    ctypedef wchar_t WCHAR
    ctypedef WCHAR* PWCHAR
    ctypedef WCHAR* BSTR
    ctypedef char CHAR
    ctypedef CHAR* PCHAR
    ctypedef double DOUBLE
    ctypedef unsigned long DWORD
    ctypedef DWORD* PDWORD
    ctypedef DWORD* LPDWORD
    ctypedef unsigned int DWORD32
    # ctypedef unsigned __int64 DWORD64
    ctypedef unsigned long long DWORD64
    ctypedef DWORD64* PDWORD64
    # ctypedef unsigned __int64 ULONGLONG
    ctypedef unsigned long long ULONGLONG
    ctypedef ULONGLONG DWORDLONG
    ctypedef ULONGLONG* PDWORDLONG
    ctypedef unsigned long error_status_t
    ctypedef float FLOAT
    ctypedef unsigned char UCHAR
    ctypedef UCHAR* PUCHAR
    ctypedef short SHORT

    ctypedef void* HANDLE
    ctypedef DWORD HCALL
    ctypedef int INT
    ctypedef INT* LPINT
    ctypedef signed char INT8
    ctypedef signed short INT16
    ctypedef signed int INT32
    # ctypedef signed __int64 INT64
    ctypedef signed long long INT64
    ctypedef void* LDAP_UDP_HANDLE
    ctypedef const wchar_t* LMCSTR
    ctypedef WCHAR* LMSTR
    ctypedef long LONG
    ctypedef LONG* PLONG
    ctypedef LONG* LPLONG
    # ctypedef signed __int64 LONGLONG
    ctypedef signed long long LONGLONG
    ctypedef LONG HRESULT
    
    # NOTE: __int3264 == int on 32-bit, __int3264 == long long on 64-bit
    # ctypedef __int3264 LONG_PTR
    ctypedef long long LONG_PTR
    # ctypedef unsigned __int3264 ULONG_PTR
    ctypedef unsigned long long ULONG_PTR
    
    ctypedef signed int LONG32
    # ctypedef signed __int64 LONG64
    ctypedef signed long long LONG64
    ctypedef LONG64* PLONG64
    ctypedef const char* LPCSTR
    ctypedef const void* LPCVOID
    ctypedef const wchar_t* LPCWSTR
    ctypedef const wchar_t* PCWSTR
    ctypedef char* PSTR
    ctypedef char* LPSTR
    
    ctypedef wchar_t* LPWSTR
    ctypedef wchar_t* PWSTR
    ctypedef DWORD NET_API_STATUS
    ctypedef long NTSTATUS
    ctypedef void* PCONTEXT_HANDLE
    ctypedef PCONTEXT_HANDLE* PPCONTEXT_HANDLE
    
    # ctypedef unsigned __int64 QWORD
    ctypedef unsigned long long QWORD
    ctypedef void* RPC_BINDING_HANDLE
    ctypedef UCHAR* STRING
    
    ctypedef unsigned int UINT
    ctypedef unsigned char UINT8
    ctypedef unsigned short UINT16
    ctypedef unsigned int UINT32
    # ctypedef unsigned __int64 UINT64
    ctypedef unsigned long long UINT64
    ctypedef unsigned long ULONG
    ctypedef ULONG *PULONG
    
    ctypedef ULONG_PTR DWORD_PTR
    ctypedef ULONG_PTR SIZE_T
    ctypedef unsigned int ULONG32
    # ctypedef unsigned __int64 ULONG64
    ctypedef unsigned long long ULONG64
    ctypedef wchar_t UNICODE
    ctypedef unsigned short USHORT
    ctypedef void VOID
    ctypedef VOID* PVOID
    ctypedef VOID* LPVOID
    ctypedef unsigned short WORD
    ctypedef WORD* PWORD
    ctypedef WORD* LPWORD

    # https://learn.microsoft.com/en-us/windows/win32/api/windef/ns-windef-size
    ctypedef struct SIZE:
        LONG cx
        LONG cy

    ctypedef SIZE* PSIZE
    ctypedef SIZE* LPSIZE

    # https://learn.microsoft.com/en-us/windows/win32/api/windef/ns-windef-rect
    ctypedef struct RECT:
        LONG left
        LONG top
        LONG right
        LONG bottom

    ctypedef RECT* PRECT
    ctypedef RECT* LPRECT
    ctypedef RECT* NPRECT

