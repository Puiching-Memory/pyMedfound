# https://learn.microsoft.com/en-us/windows/win32/api/mfapi/

from pyMedfound.WinDef cimport INT32,UINT32,INT16

cdef extern from "mfapi.h":

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ne-mfapi-_mft_enum_flag
    ctypedef enum _MFT_ENUM_FLAG:
        MFT_ENUM_FLAG_SYNCMFT = 0x00000001
        MFT_ENUM_FLAG_ASYNCMFT = 0x00000002
        MFT_ENUM_FLAG_HARDWARE = 0x00000004
        MFT_ENUM_FLAG_FIELDOFUSE = 0x00000008
        MFT_ENUM_FLAG_LOCALMFT = 0x00000010
        MFT_ENUM_FLAG_TRANSCODE_ONLY = 0x00000020
        MFT_ENUM_FLAG_SORTANDFILTER = 0x00000040
        MFT_ENUM_FLAG_SORTANDFILTER_APPROVED_ONLY = 0x000000C0
        MFT_ENUM_FLAG_SORTANDFILTER_WEB_ONLY = 0x00000140
        MFT_ENUM_FLAG_SORTANDFILTER_WEB_ONLY_EDGEMODE = 0x00000240
        MFT_ENUM_FLAG_UNTRUSTED_STOREMFT = 0x00000400
        MFT_ENUM_FLAG_ALL = 0x0000003F

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-define_mediatype_guid
    void DEFINE_MEDIATYPE_GUID(name,format)

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ns-mfapi-digitalwindowsetting
    ctypedef struct tagDigitalWindowSetting:
        double OriginX
        double OriginY
        double WindowSize

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ns-mfapi-macroblock_data
    ctypedef struct _MACROBLOCK_DATA:
        UINT32 flags
        INT16  motionVectorX
        INT16  motionVectorY
        INT32  QPDelta

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ns-mfapi-mf_float2
    # ctypedef struct _MF_FLOAT2:
    #     FLOAT x
    #     FLOAT y
