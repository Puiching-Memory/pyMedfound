from pyMedfound cimport mfapi


def call_MFAverageTimePerFrameToFrameRate(UINT64 unAverageTimePerFrame):
    cdef UINT32 numerator = 0
    cdef UINT32 denominator = 0
    result = mfapi.MFAverageTimePerFrameToFrameRate(unAverageTimePerFrame, &numerator, &denominator)
    return result, numerator, denominator