# cython: language_level=3

from pyMedfound cimport mfapi

def MFAverageTimePerFrameToFrameRatePY(UINT64 unAverageTimePerFrame):
    cdef UINT32 numerator = 0
    cdef UINT32 denominator = 0
    result = mfapi.MFAverageTimePerFrameToFrameRate(unAverageTimePerFrame, &numerator, &denominator)
    return result, numerator, denominator

def MFllMulDivPY(LONGLONG a, LONGLONG b, LONGLONG c, LONGLONG d):
    # result == ((a * b) + d) / c
    return mfapi.MFllMulDiv(a, b, c, d)