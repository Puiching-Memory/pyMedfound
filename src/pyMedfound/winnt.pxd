from pyMedfound.WinDef cimport PVOID

cdef extern from "winnt.h":
    # https://learn.microsoft.com/en-us/windows/win32/winprog/windows-data-types
    ctypedef PVOID HANDLE