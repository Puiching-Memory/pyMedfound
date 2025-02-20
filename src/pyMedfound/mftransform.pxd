
# https://learn.microsoft.com/en-us/windows/win32/api/mftransform/
cdef extern from "mftransform.h":
    # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/ne-mftransform-_mft_drain_type
    ctypedef enum _MFT_DRAIN_TYPE:
        MFT_DRAIN_PRODUCE_TAILS = 0
        MFT_DRAIN_NO_TAILS = 0x1

    # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/ne-mftransform-_mft_input_data_buffer_flags
    
    