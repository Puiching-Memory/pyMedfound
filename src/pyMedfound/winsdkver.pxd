# https://learn.microsoft.com/zh-cn/cpp/porting/modifying-winver-and-win32-winnt?view=msvc-170

cdef extern from "winsdkver.h":
    int _WIN32_MAXVER
    int _WIN32_WINDOWS_MAXVER
    int NTDDI_MAXVER
    int _WIN32_IE_MAXVER
    int _WIN32_WINNT_MAXVER
    int WINVER_MAXVER