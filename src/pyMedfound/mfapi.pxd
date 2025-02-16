# cython: language_level=3

from pyMedfound.WinDef cimport INT32,UINT32,INT16,FLOAT,DWORD,UINT64,BOOL,WORD,BYTE,LONG,UINT,UINT8,LPDWORD,LPWSTR,ULONG,LONGLONG,INT64
from pyMedfound.Winerror cimport HRESULT
from pyMedfound.guiddef cimport GUID,REFIID,REFGUID
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

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatemediatypefromrepresentation
    # HRESULT MFCreateMediaTypeFromRepresentation(
    #     GUID         guidRepresentation, # [in]
    #     LPVOID       pvRepresentation,   # [in]
    #     IMFMediaType **ppIMediaType      # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatememorybuffer
    # HRESULT MFCreateMemoryBuffer(
    #     DWORD          cbMaxLength,
    #     IMFMediaBuffer **ppBuffer
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatemfbytestreamwrapper
    # HRESULT MFCreateMFByteStreamWrapper(
    #     IMFByteStream *pStream,         # [in]
    #     IMFByteStream **ppStreamWrapper # [in]
    #     )
    
    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatemfvideoformatfrommfmediatype
    # !Deprecated!
    # HRESULT MFCreateMFVideoFormatFromMFMediaType(
    #     IMFMediaType  *pMFType, # [in]
    #     MFVIDEOFORMAT **ppMFVF, # [out]
    #     UINT32        *pcbSize  # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatemuxstreamattributes
    # HRESULT MFCreateMuxStreamAttributes(
    #     IMFCollection *pAttributesToMux, # [in]
    #     IMFAttributes **ppMuxAttribs     # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatemuxstreammediatype
    # HRESULT MFCreateMuxStreamMediaType(
    #     IMFCollection *pMediaTypesToMux, # [in]
    #     IMFMediaType  **ppMuxMediaType   # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatemuxstreamsample
    # HRESULT MFCreateMuxStreamSample(
    #     IMFCollection *pSamplesToMux, # [in]
    #     IMFSample     **ppMuxSample   # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatesample
    # HRESULT MFCreateSample(
    #     IMFSample **ppIMFSample
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatetempfile
    # HRESULT MFCreateTempFile(
    #     MF_FILE_ACCESSMODE AccessMode,
    #     MF_FILE_OPENMODE   OpenMode,
    #     MF_FILE_FLAGS      fFlags,
    #     IMFByteStream      **ppIByteStream
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatevideomediatype
    # !Deprecated!
    # HRESULT MFCreateVideoMediaType(
    #     const MFVIDEOFORMAT *pVideoFormat,      # [in]
    #     IMFVideoMediaType   **ppIVideoMediaType # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatevideomediatypefrombitmapinfoheader
    # FIXME: This function is not implemented.

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatevideomediatypefrombitmapinfoheaderex
    # HRESULT MFCreateVideoMediaTypeFromBitMapInfoHeaderEx(
    #     const BITMAPINFOHEADER *pbmihBitMapInfoHeader, # [in]
    #     UINT32                 cbBitMapInfoHeader,     # [in]
    #     DWORD                  dwPixelAspectRatioX,
    #     DWORD                  dwPixelAspectRatioY,
    #     MFVideoInterlaceMode   InterlaceMode,
    #     QWORD                  VideoFlags,
    #     DWORD                  dwFramesPerSecondNumerator,
    #     DWORD                  dwFramesPerSecondDenominator,
    #     DWORD                  dwMaxBitRate,
    #     IMFVideoMediaType      **ppIVideoMediaType    # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatevideomediatypefromsubtype
    # HRESULT MFCreateVideoMediaTypeFromSubtype(
    #     const GUID        *pAMSubtype,        # [in]
    #     IMFVideoMediaType **ppIVideoMediaType # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatevideomediatypefromvideoinfoheader
    # HRESULT MFCreateVideoMediaTypeFromVideoInfoHeader(
    #     const KS_VIDEOINFOHEADER *pVideoInfoHeader,
    #     DWORD                    cbVideoInfoHeader,
    #     DWORD                    dwPixelAspectRatioX,
    #     DWORD                    dwPixelAspectRatioY,
    #     MFVideoInterlaceMode     InterlaceMode,
    #     QWORD                    VideoFlags,
    #     const GUID               *pSubtype,
    #     IMFVideoMediaType        **ppIVideoMediaType
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatevideomediatypefromvideoinfoheader2
    # HRESULT MFCreateVideoMediaTypeFromVideoInfoHeader2(
    #     const KS_VIDEOINFOHEADER2 *pVideoInfoHeader,
    #     DWORD                     cbVideoInfoHeader,
    #     QWORD                     AdditionalVideoFlags,
    #     const GUID                *pSubtype,
    #     IMFVideoMediaType         **ppIVideoMediaType
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatevideosampleallocatorex
    HRESULT MFCreateVideoSampleAllocatorEx(
        REFIID riid,                  # [in]
        void   **ppSampleAllocator    # [out]
        )
    
    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatewaveformatexfrommfmediatype
    # HRESULT MFCreateWaveFormatExFromMFMediaType(
    #     IMFMediaType *pMFType,
    #     WAVEFORMATEX **ppWF,
    #     UINT32       *pcbSize,
    #     UINT32       Flags
    #     )
    
    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfcreatewicbitmapbuffer
    # HRESULT MFCreateWICBitmapBuffer(
    #     REFIID         riid,         # [in]
    #     IUnknown       *punkSurface, # [in]
    #     IMFMediaBuffer **ppBuffer    # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ne-mfapi-mfdepthmeasurement
    ctypedef enum MFDepthMeasurement:
        DistanceToFocalPlane = 0
        DistanceToOpticalCenter = 1

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfendcreatefile
    # HRESULT MFEndCreateFile(
    #     IMFAsyncResult *pResult, # [in]
    #     IMFByteStream  **ppFile  # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfendregisterworkqueuewithmmcss
    # HRESULT MFEndRegisterWorkQueueWithMMCSS(
    #     IMFAsyncResult *pResult,  # [in]
    #     DWORD          *pdwTaskId # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfendunregisterworkqueuewithmmcss
    # HRESULT MFEndUnregisterWorkQueueWithMMCSS(
    #     IMFAsyncResult *pResult # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ns-mfapi-mffolddown_matrix
    ctypedef struct MFFOLDDOWN_MATRIX:
        UINT32 cbSize
        UINT32 cSrcChannels
        UINT32 cDstChannels
        UINT32 dwChannelMask
        LONG   Coeff[64]

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfframeratetoaveragetimeperframe
    HRESULT MFFrameRateToAverageTimePerFrame(
        UINT32 unNumerator, # [in]
        UINT32 unDenominator, # [in]
        UINT64 *punAverageTimePerFrame # [out]
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ne-mfapi-mfframesourcetypes
    ctypedef enum MFFrameSourceTypes:
        MFFrameSourceTypes_Color = 0x0001
        MFFrameSourceTypes_Infrared = 0x0002
        MFFrameSourceTypes_Depth = 0x0004
        MFFrameSourceTypes_Image = 0x0008
        MFFrameSourceTypes_Custom = 0x0080

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfgetattribute2uint32asuint64
    # HRESULT MFGetAttribute2UINT32asUINT64(
    #     IMFAttributes *pAttributes, # [in]
    #     REFGUID       guidKey,      # [out]
    #     UINT32        *punHigh32,   # [out]
    #     UINT32        *punLow32     # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfgetattributedouble
    # double MFGetAttributeDouble(
    #     IMFAttributes *pAttributes, # [in]
    #     REFGUID       guidKey,      # [in]
    #     double        fDefault      # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfgetattributeratio
    # HRESULT MFGetAttributeRatio(
    #     IMFAttributes *pAttributes,   # [in]
    #     REFGUID       guidKey,        # [in]
    #     UINT32        *punNumerator,  # [out]
    #     UINT32        *punDenominator # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfgetattributesasblob
    # HRESULT MFGetAttributesAsBlob(
    #     IMFAttributes *pAttributes, # [in]
    #     UINT8         *pBuf,        # [out]
    #     UINT          cbBufSize     # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfgetattributesasblobsize
    # HRESULT MFGetAttributesAsBlobSize(
    #     IMFAttributes *pAttributes, # [in]
    #     UINT32        *pcbBufSize   # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfgetattributesize
    # HRESULT MFGetAttributeSize(
    #     IMFAttributes *pAttributes, # [in]
    #     REFGUID       guidKey,      # [in]
    #     UINT32        *punWidth,    # [out]
    #     UINT32        *punHeight    # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfgetattributestring
    # HRESULT MFGetAttributeString(
    #     IMFAttributes *pAttributes, # [in]
    #     REFGUID       guidKey,      # [in]
    #     PWSTR         *ppsz         # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfgetattributeuint32
    # UINT32 MFGetAttributeUINT32(
    #     IMFAttributes *pAttributes, # [in]
    #     REFGUID       guidKey,      # [in]
    #     UINT32        unDefault     # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfgetattributeuint64
    # UINT64 MFGetAttributeUINT64(
    #     IMFAttributes *pAttributes, # [in]
    #     REFGUID       guidKey,      # [in]
    #     UINT64        unDefault     # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfgetcontentprotectionsystemclsid
    # HRESULT MFGetContentProtectionSystemCLSID(
    #     REFGUID guidProtectionSystemID, # [in]
    #     CLSID   *pclsid                 # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfgetmftmerit
    HRESULT MFGetMFTMerit(
        IUnknown   *pMFT,      # [in, out]
        UINT32     cbVerifier, # [in]
        const BYTE *verifier,  # [in]
        DWORD      *merit      # [out]
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfgetplanesize
    HRESULT MFGetPlaneSize(
        DWORD format,       # [in]
        DWORD dwWidth,      # [in]
        DWORD dwHeight,     # [in]
        DWORD *pdwPlaneSize # [out]
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfgetplugincontrol
    # HRESULT MFGetPluginControl(
    #     IMFPluginControl **ppPluginControl # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfgetstrideforbitmapinfoheader
    HRESULT MFGetStrideForBitmapInfoHeader(
        DWORD format,  # [in]
        DWORD dwWidth, # [in]
        LONG  *pStride # [out]
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfgettimerperiodicity
    HRESULT MFGetTimerPeriodicity(
        DWORD *Periodicity # [out]
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfgetuncompressedvideoformat
    # !Deprecated!
    # DWORD MFGetUncompressedVideoFormat(
    #     const MFVIDEOFORMAT *pVideoFormat # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfgetworkqueuemmcssclass
    HRESULT MFGetWorkQueueMMCSSClass(
        DWORD  dwWorkQueueId, # [in]
        LPWSTR pwszClass,     # [out]
        DWORD  *pcchClass     # [in, out]
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfgetworkqueuemmcsspriority
    HRESULT MFGetWorkQueueMMCSSPriority(
        DWORD dwWorkQueueId, # [in]
        LONG  *lPriority     # [out]
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfgetworkqueuemmcsstaskid
    HRESULT MFGetWorkQueueMMCSSTaskId(
        DWORD   dwWorkQueueId, # [in]
        LPDWORD pdwTaskId      # [out]
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfheapalloc
    # void * MFHeapAlloc(
    #     size_t          nSize,    # [in]
    #     ULONG           dwFlags,  # [in]
    #     char            *pszFile, # [in]
    #     int             line,     # [in]
    #     EAllocationType eat       # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfheapfree
    void MFHeapFree(
        void *pv # [in]
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfinitammediatypefrommfmediatype
    # HRESULT MFInitAMMediaTypeFromMFMediaType(
    #     IMFMediaType  *pMFType,
    #     GUID          guidFormatBlockType,
    #     AM_MEDIA_TYPE *pAMType
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfinitattributesfromblob
    # HRESULT MFInitAttributesFromBlob(
    #     IMFAttributes *pAttributes, # [in]
    #     const UINT8   *pBuf,        # [in]
    #     UINT          cbBufSize     # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfinitmediatypefromammediatype
    # HRESULT MFInitMediaTypeFromAMMediaType(
    #     IMFMediaType        *pMFType,
    #     const AM_MEDIA_TYPE *pAMType
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfinitmediatypefrommfvideoformat
    # !Deprecated!
    # HRESULT MFInitMediaTypeFromMFVideoFormat(
    #     IMFMediaType        *pMFType,
    #     const MFVIDEOFORMAT *pMFVF,
    #     UINT32              cbBufSize
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfinitmediatypefrommpeg1videoinfo
    # HRESULT MFInitMediaTypeFromMPEG1VideoInfo(
    #     IMFMediaType         *pMFType,
    #     const MPEG1VIDEOINFO *pMP1VI,
    #     UINT32               cbBufSize,
    #     const GUID           *pSubtype
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfinitmediatypefrommpeg2videoinfo
    # HRESULT MFInitMediaTypeFromMPEG2VideoInfo(
    #     IMFMediaType         *pMFType,
    #     const MPEG2VIDEOINFO *pMP2VI,
    #     UINT32               cbBufSize,
    #     const GUID           *pSubtype
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfinitmediatypefromvideoinfoheader
    # HRESULT MFInitMediaTypeFromVideoInfoHeader(
    #     IMFMediaType          *pMFType,
    #     const VIDEOINFOHEADER *pVIH,
    #     UINT32                cbBufSize,
    #     const GUID            *pSubtype
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfinitmediatypefromvideoinfoheader2
    # HRESULT MFInitMediaTypeFromVideoInfoHeader2(
    #     IMFMediaType           *pMFType,
    #     const VIDEOINFOHEADER2 *pVIH2,
    #     UINT32                 cbBufSize,
    #     const GUID             *pSubtype
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfinitmediatypefromwaveformatex
    # HRESULT MFInitMediaTypeFromWaveFormatEx(
    #     IMFMediaType       *pMFType,
    #     const WAVEFORMATEX *pWaveFormat,
    #     UINT32             cbBufSize
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfinitvideoformat
    # !Deprecated!
    # HRESULT MFInitVideoFormat(
    #     MFVIDEOFORMAT         *pVideoFormat, # [out]
    #     MFStandardVideoFormat type           # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfinitvideoformat_rgb
    # !Deprecated!
    # HRESULT MFInitVideoFormat_RGB(
    #     MFVIDEOFORMAT *pVideoFormat, # [in]
    #     DWORD         dwWidth,       # [in]
    #     DWORD         dwHeight,      # [in]
    #     DWORD         D3Dfmt         # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfinvokecallback
    # HRESULT MFInvokeCallback(
    #     IMFAsyncResult *pAsyncResult
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfisformatyuv
    BOOL MFIsFormatYUV(
        DWORD Format # [in]
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfllmuldiv
    LONGLONG MFllMulDiv(
        LONGLONG a,
        LONGLONG b,
        LONGLONG c,
        LONGLONG d
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mflockdxgidevicemanager
    # HRESULT MFLockDXGIDeviceManager(
    #     UINT                 *pResetToken, # [out]
    #     IMFDXGIDeviceManager **ppManager   # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mflockplatform
    HRESULT MFLockPlatform()

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mflocksharedworkqueue
    # HRESULT MFLockSharedWorkQueue(
    #     PCWSTR wszClass,     # [in]
    #     LONG   BasePriority, # [in]
    #     DWORD  *pdwTaskId,   # [in, out]
    #     DWORD  *pID          # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mflockworkqueue
    HRESULT MFLockWorkQueue(
        DWORD dwWorkQueue # [in]
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfmapdx9formattodxgiformat
    # DXGI_FORMAT MFMapDX9FormatToDXGIFormat(
    #     DWORD dx9 # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfmapdxgiformattodx9format
    # DWORD MFMapDXGIFormatToDX9Format(
    #     DXGI_FORMAT dx11 # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nc-mfapi-mfperiodiccallback
    # MFPERIODICCALLBACK Mfperiodiccallback
    # void Mfperiodiccallback(
    #     IUnknown *pContext # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ns-mfapi-mfpinholecameraintrinsic_intrinsicmodel
    ctypedef struct MFPinholeCameraIntrinsic_IntrinsicModel:
        UINT32                               Width
        UINT32                               Height
        MFCameraIntrinsic_PinholeCameraModel CameraModel
        MFCameraIntrinsic_DistortionModel    DistortionModel

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ns-mfapi-mfpinholecameraintrinsics
    ctypedef struct MFPinholeCameraIntrinsics:
        UINT32                                  IntrinsicModelCount
        MFPinholeCameraIntrinsic_IntrinsicModel IntrinsicModels[1]

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfputwaitingworkitem
    # HRESULT MFPutWaitingWorkItem(
    #     HANDLE         hEvent,   # [in]
    #     LONG           Priority, # [in]
    #     IMFAsyncResult *pResult, # [in]
    #     MFWORKITEM_KEY *pKey     # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfputworkitem
    # HRESULT MFPutWorkItem(
    #     DWORD            dwQueue,    # [in]
    #     IMFAsyncCallback *pCallback, # [in]
    #     IUnknown         *pState     # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfputworkitem2
    # HRESULT MFPutWorkItem2(
    #     DWORD            dwQueue,    # [in]
    #     LONG             Priority,   # [in]
    #     IMFAsyncCallback *pCallback, # [in]
    #     IUnknown         *pState     # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfputworkitemex
    # HRESULT MFPutWorkItemEx(
    #     DWORD          dwQueue, # [in]
    #     IMFAsyncResult *pResult # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfputworkitemex2
    # HRESULT MFPutWorkItemEx2(
    #     DWORD          dwQueue,  # [in]
    #     LONG           Priority, # [in]
    #     IMFAsyncResult *pResult  # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfregisterlocalbytestreamhandler
    # HRESULT MFRegisterLocalByteStreamHandler(
    #     PCWSTR      szFileExtension, # [in]
    #     PCWSTR      szMimeType,      # [in]
    #     IMFActivate *pActivate       # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfregisterlocalschemehandler
    # HRESULT MFRegisterLocalSchemeHandler(
    #     PCWSTR      szScheme,  # [in]
    #     IMFActivate *pActivate # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfregisterplatformwithmmcss
    # HRESULT MFRegisterPlatformWithMMCSS(
    #     PCWSTR wszClass,   # [in]
    #     DWORD  *pdwTaskId, # [in, out]
    #     LONG   lPriority   # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfremoveperiodiccallback
    HRESULT MFRemovePeriodicCallback(
        DWORD dwKey # [in]
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ne-mfapi-mfsampleencryptionprotectionscheme
    ctypedef enum MFSampleEncryptionProtectionScheme:
        MF_SAMPLE_ENCRYPTION_PROTECTION_SCHEME_NONE = 0
        MF_SAMPLE_ENCRYPTION_PROTECTION_SCHEME_AES_CTR = 1
        MF_SAMPLE_ENCRYPTION_PROTECTION_SCHEME_AES_CBC = 2

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfscheduleworkitem
    # HRESULT MFScheduleWorkItem(
    #     IMFAsyncCallback *pCallback, # [in]
    #     IUnknown         *pState,    # [in]
    #     INT64            Timeout,    # [in]
    #     MFWORKITEM_KEY   *pKey       # [out]
    #     )
    
    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfscheduleworkitemex
    # HRESULT MFScheduleWorkItemEx(
    #     IMFAsyncResult *pResult, # [in]
    #     INT64          Timeout,  # [in]
    #     MFWORKITEM_KEY *pKey     # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfsetattribute2uint32asuint64
    # HRESULT MFSetAttribute2UINT32asUINT64(
    #     IMFAttributes *pAttributes, # [in]
    #     REFGUID       guidKey,      # [in]
    #     UINT32        unHigh32,     # [in]
    #     UINT32        unLow32       # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfsetattributeratio
    # HRESULT MFSetAttributeRatio(
    #     IMFAttributes *pAttributes, # [in]
    #     REFGUID       guidKey,      # [in]
    #     UINT32        unNumerator,  # [in]
    #     UINT32        unDenominator # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfsetattributesize
    # HRESULT MFSetAttributeSize(
    #     IMFAttributes *pAttributes, # [in]
    #     REFGUID       guidKey,      # [in]
    #     UINT32        unWidth,      # [in]
    #     UINT32        unHeight      # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfshutdown
    HRESULT MFShutdown()

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfsplitsample
    # HRESULT MFSplitSample(
    #     IMFSample *pSample,
    #     IMFSample **pOutputSamples,
    #     DWORD     dwOutputSampleMaxCount,
    #     DWORD     *pdwOutputSampleCount
    #     )

    int MF_SDK_VERSION
    int MF_API_VERSION
    int MF_VERSION

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfstartup
    HRESULT MFStartup(
        ULONG Version, # MF_VERSION
        DWORD dwFlags
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mftenum
    # HRESULT MFTEnum(
    #     GUID                   guidCategory, # [in]
    #     UINT32                 Flags,        # [in]
    #     MFT_REGISTER_TYPE_INFO *pInputType,  # [in]
    #     MFT_REGISTER_TYPE_INFO *pOutputType, # [in]
    #     IMFAttributes          *pAttributes, # [in]
    #     CLSID                  **ppclsidMFT, # [out]
    #     UINT32                 *pcMFTs       # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mftenum2
    # HRESULT MFTEnum2(
    #     GUID                         guidCategory,      # [in] 
    #     UINT32                       Flags,             # [in]
    #     const MFT_REGISTER_TYPE_INFO *pInputType,       # [in]
    #     const MFT_REGISTER_TYPE_INFO *pOutputType,      # [in]
    #     IMFAttributes                *pAttributes,      # [in, optional]
    #     IMFActivate                  ***pppMFTActivate, # [out]
    #     UINT32                       *pnumMFTActivate   # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mftenumex
    # HRESULT MFTEnumEx(
    #     GUID                         guidCategory,      # [in] 
    #     UINT32                       Flags,             # [in]
    #     const MFT_REGISTER_TYPE_INFO *pInputType,       # [in]
    #     const MFT_REGISTER_TYPE_INFO *pOutputType,      # [in]
    #     IMFActivate                  ***pppMFTActivate, # [out]
    #     UINT32                       *pnumMFTActivate   # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mftgetinfo
    # HRESULT MFTGetInfo(
    #     CLSID                  clsidMFT,        # [in]
    #     LPWSTR                 *pszName,        # [out]
    #     MFT_REGISTER_TYPE_INFO **ppInputTypes,  # [out]
    #     UINT32                 *pcInputTypes,   # [out]
    #     MFT_REGISTER_TYPE_INFO **ppOutputTypes, # [out]
    #     UINT32                 *pcOutputTypes,  # [out]
    #     IMFAttributes          **ppAttributes   # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mftregister
    # HRESULT MFTRegister(
    #     CLSID                  clsidMFT,      # [in]
    #     GUID                   guidCategory,  # [in]
    #     LPWSTR                 pszName,       # [in]
    #     UINT32                 Flags,         # [in]
    #     UINT32                 cInputTypes,   # [in]
    #     MFT_REGISTER_TYPE_INFO *pInputTypes,  # [in]
    #     UINT32                 cOutputTypes,  # [in]
    #     MFT_REGISTER_TYPE_INFO *pOutputTypes, # [in]
    #     IMFAttributes          *pAttributes   # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mftregisterlocal
    # HRESULT MFTRegisterLocal(
    #     IClassFactory                *pClassFactory,  # [in]
    #     REFGUID                      guidCategory,    # [in]
    #     LPCWSTR                      pszName,         # [in]
    #     UINT32                       Flags,           # [in]
    #     UINT32                       cInputTypes,     # [in]
    #     const MFT_REGISTER_TYPE_INFO *pInputTypes,    # [in]
    #     UINT32                       cOutputTypes,    # [in]
    #     const MFT_REGISTER_TYPE_INFO *pOutputTypes    # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mftregisterlocalbyclsid
    # HRESULT MFTRegisterLocalByCLSID(
    #     REFCLSID                     clisdMFT,     # [in]
    #     REFGUID                      guidCategory, # [in]
    #     LPCWSTR                      pszName,      # [in]
    #     UINT32                       Flags,        # [in]
    #     UINT32                       cInputTypes,  # [in]
    #     const MFT_REGISTER_TYPE_INFO *pInputTypes, # [in]
    #     UINT32                       cOutputTypes, # [in]
    #     const MFT_REGISTER_TYPE_INFO *pOutputTypes # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mftunregister
    # HRESULT MFTUnregister(
    #     CLSID clsidMFT # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mftunregisterlocal
    # HRESULT MFTUnregisterLocal(
    #     IClassFactory *pClassFactory # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mftunregisterlocalbyclsid
    # HRESULT MFTUnregisterLocalByCLSID(
    #     CLSID clsidMFT # [in]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfunlockdxgidevicemanager
    HRESULT MFUnlockDXGIDeviceManager()

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfunlockplatform
    HRESULT MFUnlockPlatform()

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfunlockworkqueue
    HRESULT MFUnlockWorkQueue(
        DWORD dwWorkQueue # [in]
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfunregisterplatformfrommmcss
    HRESULT MFUnregisterPlatformFromMMCSS()

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfunwrapmediatype
    # HRESULT MFUnwrapMediaType(
    #     IMFMediaType *pWrap,
    #     IMFMediaType **ppOrig
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfvalidatemediatypesize
    HRESULT MFValidateMediaTypeSize(
        GUID   FormatType, # [in]
        UINT8  *pBlock,    # [in]
        UINT32 cbSize      # [in]
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ne-mfapi-mfvideo3dformat
    ctypedef enum MFVideo3DFormat:
        MFVideo3DSampleFormat_BaseView = 0
        MFVideo3DSampleFormat_MultiView = 1
        MFVideo3DSampleFormat_Packed_LeftRight = 2
        MFVideo3DSampleFormat_Packed_TopBottom = 3

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ne-mfapi-mfvideo3dsampleformat
    ctypedef enum MFVideo3DSampleFormat:
        MFSampleExtension_3DVideo_MultiView = 1
        MFSampleExtension_3DVideo_Packed = 0

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ne-mfapi-mfvideodrmflags
    ctypedef enum MFVideoDRMFlags:
        MFVideoDRMFlag_None = 0
        MFVideoDRMFlag_AnalogProtected = 1
        MFVideoDRMFlag_DigitallyProtected = 2

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ne-mfapi-mfvideopadflags
    ctypedef enum MFVideoPadFlags:
        MFVideoPadFlag_PAD_TO_None = 0
        MFVideoPadFlag_PAD_TO_4x3 = 1
        MFVideoPadFlag_PAD_TO_16x9 = 2

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ne-mfapi-mfvideorotationformat
    ctypedef enum MFVideoRotationFormat:
        MFVideoRotationFormat_0 = 0
        MFVideoRotationFormat_90 = 90
        MFVideoRotationFormat_180 = 180
        MFVideoRotationFormat_270 = 270

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ne-mfapi-mfvideosrccontenthintflags
    ctypedef enum MFVideoSrcContentHintFlags:
        MFVideoSrcContentHintFlag_None = 0
        MFVideoSrcContentHintFlag_16x9 = 1
        MFVideoSrcContentHintFlag_235_1 = 2
    
    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ne-mfapi-mfwaveformatexconvertflags
    ctypedef enum MFWaveFormatExConvertFlags:
        MFWaveFormatExConvertFlag_Normal = 0
        MFWaveFormatExConvertFlag_ForceExtensible = 1

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-mfwrapmediatype
    # HRESULT MFWrapMediaType(
    #     IMFMediaType *pOrig,
    #     REFGUID      MajorType,
    #     REFGUID      SubType,
    #     IMFMediaType **ppWrap
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ns-mfapi-mt_arbitrary_header
    ctypedef struct MT_ARBITRARY_HEADER:
        GUID  majortype
        GUID  subtype
        BOOL  bFixedSizeSamples
        BOOL  bTemporalCompression
        ULONG lSampleSize
        GUID  formattype

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ns-mfapi-mt_custom_video_primaries
    ctypedef struct MT_CUSTOM_VIDEO_PRIMARIES:
        float fRx
        float fRy
        float fGx
        float fGy
        float fBx
        float fBy
        float fWx
        float fWy

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-pack2uint32asuint64
    UINT64 Pack2UINT32AsUINT64(
        UINT32 unHigh, # [in]
        UINT32 unLow   # [in]
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-packratio
    UINT64 PackRatio(
        INT32  nNumerator,   # [in]
        UINT32 unDenominator # [in]
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-packsize
    UINT64 PackSize(
        UINT32 unWidth, # [in]
        UINT32 unHeight # [in]
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/ns-mfapi-roi_area
    # ctypedef struct ROI_AREA:
    #     RECT  rect
    #     INT32 QPDelta
    # ctypedef ROI_AREA* PROI_AREA

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-unpack2uint32asuint64
    void Unpack2UINT32AsUINT64(
        UINT64 unPacked, # [in]
        UINT32 *punHigh, # [out]
        UINT32 *punLow   # [out]
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-unpackratio
    void UnpackRatio(
        UINT64 unPacked,       # [in]
        INT32  *pnNumerator,   # [out]
        UINT32 *punDenominator # [out]
        )
    
    # https://learn.microsoft.com/en-us/windows/win32/api/mfapi/nf-mfapi-unpacksize
    void UnpackSize(
        UINT64 unPacked,  # [in]
        UINT32 *punWidth, # [out]
        UINT32 *punHeight # [out]
        )