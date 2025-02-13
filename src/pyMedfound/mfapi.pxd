# cython: language_level=3

# https://learn.microsoft.com/en-us/windows/win32/api/mfapi/

from pyMedfound.WinDef cimport INT32,UINT32,INT16,FLOAT,DWORD,UINT64
from pyMedfound.Winerror cimport HRESULT


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
    ctypedef struct _MF_FLOAT2:
        FLOAT x
        FLOAT y

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ns-mfapi-mf_float3
    ctypedef struct _MF_FLOAT3:
        FLOAT x
        FLOAT y
        FLOAT z

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ns-mfapi-mf_quaternion
    ctypedef struct _MF_QUATERNION:
        FLOAT x
        FLOAT y
        FLOAT z
        FLOAT w

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ne-mfapi-mf_topostatus
    ctypedef enum MF_TOPOSTATUS:
        MF_TOPOSTATUS_INVALID = 0
        MF_TOPOSTATUS_READY = 100
        MF_TOPOSTATUS_STARTED_SOURCE = 200
        MF_TOPOSTATUS_DYNAMIC_CHANGED = 210
        MF_TOPOSTATUS_SINK_SWITCHED = 300
        MF_TOPOSTATUS_ENDED = 400

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfaddperiodiccallback
    # HRESULT MFAddPeriodicCallback(
    #     MFPERIODICCALLBACK Callback,
    #     IUnknown           *pContext,
    #     DWORD              *pdwKey
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfallocateserialworkqueue
    cdef HRESULT MFAllocateSerialWorkQueue(
        DWORD dwWorkQueue,
        DWORD *pdwWorkQueue
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfallocateworkqueue
    cdef HRESULT MFAllocateWorkQueue(
        DWORD *pdwWorkQueue
        )
    
    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfallocateworkqueueex
    # HRESULT MFAllocateWorkQueueEx(
    #     MFASYNC_WORKQUEUE_TYPE WorkQueueType,
    #     DWORD                  *pdwWorkQueue
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ne-mfapi-mfasync_workqueue_type
    ctypedef enum MFASYNC_WORKQUEUE_TYPE:
        MF_STANDARD_WORKQUEUE = 0
        MF_WINDOW_WORKQUEUE = 1
        MF_MULTITHREADED_WORKQUEUE = 2

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ns-mfapi-mfasyncresult
    # ctypedef struct tagMFASYNCRESULT : IMFAsyncResult {
    # OVERLAPPED       overlapped;
    # IMFAsyncCallback *pCallback;
    # HRESULT          hrStatusResult;
    # DWORD            dwBytesTransferred;
    # HANDLE           hEvent;
    # } MFASYNCRESULT;

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfaveragetimeperframetoframerate
    cdef HRESULT MFAverageTimePerFrameToFrameRate(
        UINT64 unAverageTimePerFrame,
        UINT32 *punNumerator,
        UINT32 *punDenominator
        )