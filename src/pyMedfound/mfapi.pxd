# cython: language_level=3

from pyMedfound.WinDef cimport INT32,UINT32,INT16,FLOAT,DWORD,UINT64,BOOL,WORD,BYTE,LONG,UINT
from pyMedfound.Winerror cimport HRESULT
from pyMedfound.guiddef cimport GUID,REFIID
from pyMedfound.Unknwn cimport IUnknown


# https://learn.microsoft.com/en-us/windows/win32/api/mfapi/
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
    ctypedef struct MACROBLOCK_DATA:
        UINT32 flags
        INT16  motionVectorX
        INT16  motionVectorY
        INT32  QPDelta

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ns-mfapi-mf_float2
    ctypedef struct MF_FLOAT2:
        FLOAT x
        FLOAT y

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ns-mfapi-mf_float3
    ctypedef struct MF_FLOAT3:
        FLOAT x
        FLOAT y
        FLOAT z

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ns-mfapi-mf_quaternion
    ctypedef struct MF_QUATERNION:
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

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfbegincreatefile
    # HRESULT MFBeginCreateFile(
    #     MF_FILE_ACCESSMODE AccessMode,
    #     MF_FILE_OPENMODE   OpenMode,
    #     MF_FILE_FLAGS      fFlags,
    #     LPCWSTR            pwszFilePath,
    #     IMFAsyncCallback   *pCallback,
    #     IUnknown           *pState,
    #     IUnknown           **ppCancelCookie
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfbeginregisterworkqueuewithmmcss
    # HRESULT MFBeginRegisterWorkQueueWithMMCSS(
    #     DWORD            dwWorkQueueId,
    #     LPCWSTR          wszClass,
    #     DWORD            dwTaskId,
    #     IMFAsyncCallback *pDoneCallback,
    #     IUnknown         *pDoneState
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfbeginregisterworkqueuewithmmcssex
    # HRESULT MFBeginRegisterWorkQueueWithMMCSSEx(
    #     DWORD            dwWorkQueueId,
    #     LPCWSTR          wszClass,
    #     DWORD            dwTaskId,
    #     LONG             lPriority,
    #     IMFAsyncCallback *pDoneCallback,
    #     IUnknown         *pDoneState
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfbeginunregisterworkqueuewithmmcss
    # HRESULT MFBeginUnregisterWorkQueueWithMMCSS(
    # DWORD            dwWorkQueueId,
    # IMFAsyncCallback *pDoneCallback,
    # Unknown         *pDoneState
    # )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcalculatebitmapimagesize
    # HRESULT MFCalculateBitmapImageSize(
    # const BITMAPINFOHEADER *pBMIH,
    # UINT32                 cbBufSize,
    # UINT32                 *pcbImageSize,
    # BOOL                   *pbKnown
    # )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcalculateimagesize
    # HRESULT MFCalculateImageSize(
    #     REFGUID guidSubtype,
    #     UINT32  unWidth,
    #     UINT32  unHeight,
    #     UINT32  *pcbImageSize
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ns-mfapi-mfcameraextrinsic_calibratedtransform
    ctypedef struct MFCameraExtrinsic_CalibratedTransform:
        GUID          CalibrationId
        MF_FLOAT3     Position
        MF_QUATERNION Orientation

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ns-mfapi-mfcameraextrinsics
    ctypedef struct MFCameraExtrinsics:
        UINT32                                TransformCount
        MFCameraExtrinsic_CalibratedTransform CalibratedTransforms[1]

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ns-mfapi-mfcameraintrinsic_distortionmodel
    ctypedef struct MFCameraIntrinsic_DistortionModel:
        FLOAT Radial_k1
        FLOAT Radial_k2
        FLOAT Radial_k3
        FLOAT Tangential_p1
        FLOAT Tangential_p2
    
    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ns-mfapi-mfcameraintrinsic_pinholecameramodel
    ctypedef struct MFCameraIntrinsic_PinholeCameraModel:
        MF_FLOAT2 FocalLength
        MF_FLOAT2 PrincipalPoint

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcancelcreatefile
    HRESULT MFCancelCreateFile(
        IUnknown *pCancelCookie
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcancelworkitem
    # HRESULT MFCancelWorkItem(
    #     MFWORKITEM_KEY Key
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcombinesamples
    # HRESULT MFCombineSamples(
    #     IMFSample *pSample,
    #     IMFSample *pSampleToAdd,
    #     DWORD     dwMaxMergedDurationInMS,
    #     BOOL      *pMerged
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcomparefulltopartialmediatype
    # BOOL MFCompareFullToPartialMediaType(
    #     IMFMediaType *pMFTypeFull,
    #     IMFMediaType *pMFTypePartial
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfconvertcolorinfofromdxva
    # !Deprecated!
    # HRESULT MFConvertColorInfoFromDXVA(
    #     MFVIDEOFORMAT *pToFormat,
    #     DWORD         dwFromDXVA
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfconvertcolorinfotodxva
    # !Deprecated!
    # HRESULT MFConvertColorInfoToDXVA(
    #     DWORD               *pdwToDXVA,
    #     const MFVIDEOFORMAT *pFromFormat
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfconvertfromfp16array
    HRESULT MFConvertFromFP16Array(
        float      *pDest,
        const WORD *pSrc,
        DWORD      dwCount
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfconverttofp16array
    HRESULT MFConvertToFP16Array(
        WORD        *pDest,
        const float *pSrc,
        DWORD       dwCount
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcopyimage
    HRESULT MFCopyImage(
        BYTE       *pDest,
        LONG       lDestStride,
        const BYTE *pSrc,
        LONG       lSrcStride,
        DWORD      dwWidthInBytes,
        DWORD      dwLines
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreate2dmediabuffer
    # HRESULT MFCreate2DMediaBuffer(
    #     DWORD          dwWidth,
    #     DWORD          dwHeight,
    #     DWORD          dwFourCC,
    #     BOOL           fBottomUp,
    #     IMFMediaBuffer **ppBuffer
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatealignedmemorybuffer
    # HRESULT MFCreateAlignedMemoryBuffer(
    #     DWORD          cbMaxLength,
    #     DWORD          cbAligment,
    #     IMFMediaBuffer **ppBuffer
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreateammediatypefrommfmediatype
    # HRESULT MFCreateAMMediaTypeFromMFMediaType(
    #     IMFMediaType  *pMFType,
    #     GUID          guidFormatBlockType,
    #     AM_MEDIA_TYPE **ppAMType
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreateasyncresult
    # HRESULT MFCreateAsyncResult(
    #     IUnknown         *punkObject,
    #     IMFAsyncCallback *pCallback,
    #     IUnknown         *punkState,
    #     IMFAsyncResult   **ppAsyncResult
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreateattributes
    # HRESULT MFCreateAttributes(
    #     IMFAttributes **ppMFAttributes,
    #     UINT32        cInitialSize
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreateaudiomediatype
    # !Deprecated!
    # HRESULT MFCreateAudioMediaType(
    #     const WAVEFORMATEX *pAudioFormat,
    #     IMFAudioMediaType  **ppIAudioMediaType
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatecollection
    # HRESULT MFCreateCollection(
    #     IMFCollection **ppIMFCollection
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatedxgidevicemanager
    # HRESULT MFCreateDXGIDeviceManager(
    #     UINT                 *resetToken,
    #     IMFDXGIDeviceManager **ppDeviceManager
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatedxgisurfacebuffer
    # HRESULT MFCreateDXGISurfaceBuffer(
    #     REFIID         riid,
    #     IUnknown       *punkSurface,
    #     UINT           uSubresourceIndex,
    #     BOOL           fBottomUpWhenLinear,
    #     IMFMediaBuffer **ppBuffer
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatedxsurfacebuffer
    # HRESULT MFCreateDXSurfaceBuffer(
    #     REFIID         riid,
    #     IUnknown       *punkSurface,
    #     BOOL           fBottomUpWhenLinear,
    #     IMFMediaBuffer **ppBuffer
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreateeventqueue
    # HRESULT MFCreateEventQueue(
    #     IMFMediaEventQueue **ppMediaEventQueue
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatefile
    # HRESULT MFCreateFile(
    #     MF_FILE_ACCESSMODE AccessMode,
    #     MF_FILE_OPENMODE   OpenMode,
    #     MF_FILE_FLAGS      fFlags,
    #     LPCWSTR            pwszFileURL,
    #     IMFByteStream      **ppIByteStream
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatelegacymediabufferonmfmediabuffer
    # HRESULT MFCreateLegacyMediaBufferOnMFMediaBuffer(
    #     IMFSample      *pSample,
    #     IMFMediaBuffer *pMFMediaBuffer,
    #     DWORD          cbOffset,
    #     IMediaBuffer   **ppMediaBuffer
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatemediabufferfrommediatype
    # HRESULT MFCreateMediaBufferFromMediaType(
    #     IMFMediaType   *pMediaType,
    #     LONGLONG       llDuration,
    #     DWORD          dwMinLength,
    #     DWORD          dwMinAlignment,
    #     IMFMediaBuffer **ppBuffer
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatemediabufferwrapper
    # HRESULT MFCreateMediaBufferWrapper(
    #     IMFMediaBuffer *pBuffer,
    #     DWORD          cbOffset,
    #     DWORD          dwLength,
    #     IMFMediaBuffer **ppBuffer
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatemediaevent
    # HRESULT MFCreateMediaEvent(
    #     MediaEventType    met,
    #     REFGUID           guidExtendedType,
    #     HRESULT           hrStatus,
    #     const PROPVARIANT *pvValue,
    #     IMFMediaEvent     **ppEvent
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatemediaextensionactivate
    # HRESULT MFCreateMediaExtensionActivate(
    #     PCWSTR   szActivatableClassId,
    #     IUnknown *pConfiguration,
    #     REFIID   riid,
    #     LPVOID   *ppvObject
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatemediatype
    # HRESULT MFCreateMediaType(
    # IMFMediaType **ppMFType
    # )

    