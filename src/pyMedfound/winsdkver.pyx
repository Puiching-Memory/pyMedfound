from pyMedfound cimport winsdkver

def get_WIN32_MAXVER():
    return hex(winsdkver.WINVER_MAXVER)

def get_NTDDI_MAXVER():
    return hex(winsdkver.NTDDI_MAXVER)

