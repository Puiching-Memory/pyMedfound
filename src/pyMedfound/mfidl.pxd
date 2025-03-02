
from pyMedfound.windef cimport BYTE,DWORD,LPWSTR,LPCWSTR,UINT32,BOOL,QWORD,ULONG,LONGLONG,UINT,UINT64,ULONGLONG,LPVOID
from pyMedfound.winerror cimport HRESULT
from pyMedfound.unknwn cimport IUnknown
from pyMedfound.guiddef cimport GUID,REFGUID,REFIID
from pyMedfound.mfobjects cimport IMFByteStream,IMFAsyncCallback,IMFAsyncResult,IMFAttributes,IMFActivate,IMFMediaEventGenerator,IMFMediaType
from pyMedfound.PropIdlBase cimport PROPVARIANT

# https://learn.microsoft.com/en-us/windows/win32/api/mfidl/
cdef extern from "mfidl.h":
    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/ns-mfidl-asf_flat_picture
    ctypedef struct ASF_FLAT_PICTURE:
        BYTE  bPictureType
        DWORD dwDataLen

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/ns-mfidl-asf_flat_synchronised_lyrics
    ctypedef struct ASF_FLAT_SYNCHRONISED_LYRICS:
        BYTE  bTimeStampFormat
        BYTE  bContentType
        DWORD dwLyricsLen

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-createnamedpropertystore
    # !Deprecate!
    # HRESULT CreateNamedPropertyStore(
    #     INamedPropertyStore **ppStore # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-createpropertystore
    # !Deprecate!
    # HRESULT CreatePropertyStore(
    #     IPropertyStore **ppStore # [out]
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfaudiopolicy
    cdef cppclass IMFAudioPolicy(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfaudiopolicy-getdisplayname
        HRESULT GetDisplayName(
            LPWSTR *pszName # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfaudiopolicy-getgroupingparam
        HRESULT GetGroupingParam(
            GUID *pguidClass # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfaudiopolicy-geticonpath
        HRESULT GetIconPath(
            LPWSTR *pszPath # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfaudiopolicy-setdisplayname
        HRESULT SetDisplayName(
            LPCWSTR pszName # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfaudiopolicy-setgroupingparam
        HRESULT SetGroupingParam(
            REFGUID rguidClass # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfaudiopolicy-seticonpath
        HRESULT SetIconPath(
            LPCWSTR pszPath # [in]
            )
        
    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfaudiostreamvolume
    cdef cppclass IMFAudioStreamVolume(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfaudiostreamvolume-getallvolumes
        HRESULT GetAllVolumes(
            UINT32 dwCount,   # [in]
            float  *pfVolumes # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfaudiostreamvolume-getchannelcount
        HRESULT GetChannelCount(
            UINT32 *pdwCount # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfaudiostreamvolume-getchannelvolume
        HRESULT GetChannelVolume(
            UINT32 dwIndex, # [in]
            float  *pfLevel # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfaudiostreamvolume-setallvolumes
        HRESULT SetAllVolumes(
            UINT32      dwCount,   # [in]
            const float *pfVolumes # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfaudiostreamvolume-setchannelvolume
        HRESULT SetChannelVolume(
            UINT32      dwIndex, # [in]
            const float fLevel   # [in]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfbytestreambuffering
    cdef cppclass IMFByteStreamBuffering(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfbytestreambuffering-enablebuffering
        HRESULT EnableBuffering(
            BOOL fEnable # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfbytestreambuffering-setbufferingparams
        HRESULT SetBufferingParams(
            MFBYTESTREAM_BUFFERING_PARAMS *pParams # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfbytestreambuffering-stopbuffering
        HRESULT StopBuffering()

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfbytestreamcachecontrol
    cdef cppclass IMFByteStreamCacheControl(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfbytestreamcachecontrol-stopbackgroundtransfer
        HRESULT StopBackgroundTransfer()

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfbytestreamcachecontrol2
    cdef cppclass IMFByteStreamCacheControl2(IMFByteStreamCacheControl):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfbytestreamcachecontrol2-getbyteranges
        HRESULT GetByteRanges(
            DWORD                      *pcRanges, # [out]
            MF_BYTE_STREAM_CACHE_RANGE **ppRanges # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfbytestreamcachecontrol2-isbackgroundtransferactive
        HRESULT IsBackgroundTransferActive(
            BOOL *pfActive # [out]
            )
        
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfbytestreamcachecontrol2-setcachelimit
        HRESULT SetCacheLimit(
            QWORD qwBytes # [in]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfbytestreamhandler
    cdef cppclass IMFByteStreamHandler(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfbytestreamhandler-begincreateobject
        HRESULT BeginCreateObject(
            IMFByteStream    *pByteStream,             # [in]
            LPCWSTR          pwszURL,                  # [in]
            DWORD            dwFlags,                  # [in]
            IPropertyStore   *pProps,                  # [in]
            IUnknown         **ppIUnknownCancelCookie, # [out]
            IMFAsyncCallback *pCallback,               # [in]
            IUnknown         *punkState                # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfbytestreamhandler-cancelobjectcreation
        HRESULT CancelObjectCreation(
            IUnknown *pIUnknownCancelCookie # [in]
            )
        
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfbytestreamhandler-endcreateobject
        HRESULT EndCreateObject(
            IMFAsyncResult *pResult,     # [in]
            MF_OBJECT_TYPE *pObjectType, # [out]
            IUnknown       **ppObject    # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfbytestreamhandler-getmaxnumberofbytesrequiredforresolution
        HRESULT GetMaxNumberOfBytesRequiredForResolution(
            QWORD *pqwBytes # [out]
            )
        
    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfbytestreamtimeseek
    cdef cppclass IMFByteStreamTimeSeek(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfbytestreamtimeseek-gettimeseekresult
        HRESULT GetTimeSeekResult(
            QWORD *pqwStartTime, # [out]
            QWORD *pqwStopTime,  # [out]
            QWORD *pqwDuration   # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfbytestreamtimeseek-istimeseeksupported
        HRESULT IsTimeSeekSupported(
            BOOL *pfTimeSeekIsSupported # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfbytestreamtimeseek-timeseek
        HRESULT TimeSeek(
            QWORD qwTimePosition
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfcameraconfigurationmanager
    cdef cppclass IMFCameraConfigurationManager(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcameraconfigurationmanager-loaddefaults
        HRESULT LoadDefaults(
            IMFAttributes                      *cameraAttributes, # [in]
            IMFCameraControlDefaultsCollection **configurations   # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcameraconfigurationmanager-savedefaults
        HRESULT SaveDefaults(
            IMFCameraControlDefaultsCollection *configurations # [in]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfcameracontroldefaults
    cdef cppclass IMFCameraControlDefaults(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaults-getrangeinfo
        HRESULT GetRangeInfo(
            MF_CAMERA_CONTROL_RANGE_INFO *rangeInfo
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaults-gettype
        MF_CAMERA_CONTROL_CONFIGURATION_TYPE GetType()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaults-lockcontroldata
        HRESULT LockControlData(
            void  **control,    # [out]
            ULONG *controlSize, # [out]
            void  **data,       # [out]
            ULONG *dataSize     # [out]
            )
        
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaults-unlockcontroldata
        HRESULT UnlockControlData()

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfcameracontroldefaultscollection
    cdef cppclass IMFCameraControlDefaultsCollection(IMFAttributes):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaultscollection-getcontrol
        HRESULT GetControl(
            ULONG                    index,          # [in]
            IMFCameraControlDefaults **configuration
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaultscollection-getcontrolcount
        ULONG GetControlCount()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaultscollection-getoraddcontrol
        HRESULT GetOrAddControl(
            MF_CAMERA_CONTROL_CONFIGURATION_TYPE configType,
            REFGUID                              controlSet,
            ULONG                                constrolId,
            ULONG                                controlSize,
            ULONG                                dataSize,
            IMFCameraControlDefaults             **defaults
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaultscollection-getoraddextendedcontrol
        HRESULT GetOrAddExtendedControl(
            MF_CAMERA_CONTROL_CONFIGURATION_TYPE configType, # [in]
            ULONG                                constrolId, # [in]
            DWORD                                streamId,   # [in]
            ULONG                                dataSize,   # [in]
            IMFCameraControlDefaults             **defaults  # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaultscollection-removeallcontrols
        HRESULT RemoveAllControls()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaultscollection-removecontrol
        HRESULT RemoveControl(
            REFGUID controlSet, # [in]
            ULONG   constrolId  # [in]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfcameracontrolmonitor
    cdef cppclass IMFCameraControlMonitor(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcameracontrolmonitor-addcontrolsubscription
        HRESULT AddControlSubscription(
            GUID   controlSet,
            UINT32 id
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcameracontrolmonitor-removecontrolsubscription
        HRESULT RemoveControlSubscription(
            GUID   controlSet,
            UINT32 id
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcameracontrolmonitor-shutdown
        void Shutdown()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcameracontrolmonitor-start
        HRESULT Start()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcameracontrolmonitor-stop
        HRESULT Stop()

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfcameracontrolnotify
    cdef cppclass IMFCameraControlNotify(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcameracontrolnotify-onchange
        void OnChange(
            REFGUID controlSet,
            UINT32  id
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcameracontrolnotify-onerror
        void OnError(
            HRESULT hrStatus
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfcameraocclusionstatemonitor
    cdef cppclass IMFCameraOcclusionStateMonitor(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcameraocclusionstatemonitor-getsupportedstates
        DWORD GetSupportedStates()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcameraocclusionstatemonitor-start
        HRESULT Start()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcameraocclusionstatemonitor-stop
        HRESULT Stop()

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfcameraocclusionstatereport
    cdef cppclass IMFCameraOcclusionStateReport(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcameraocclusionstatereport-getocclusionstate
        HRESULT GetOcclusionState(
            DWORD *occlusionState
            )
    
    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfcameraocclusionstatereportcallback
    cdef cppclass IMFCameraOcclusionStateReportCallback(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcameraocclusionstatereportcallback-onocclusionstatereport
        HRESULT OnOcclusionStateReport(
            IMFCameraOcclusionStateReport *occlusionStateReport
            )
    
    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfclock
    cdef cppclass IMFClock(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfclock-getclockcharacteristics
        HRESULT GetClockCharacteristics(
            DWORD *pdwCharacteristics # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfclock-getcontinuitykey
        # !Not supported!
        HRESULT GetContinuityKey(
            DWORD *pdwContinuityKey # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfclock-getcorrelatedtime
        HRESULT GetCorrelatedTime(
            DWORD    dwReserved,     # [in]
            LONGLONG *pllClockTime,  # [out]
            MFTIME   *phnsSystemTime # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfclock-getproperties
        HRESULT GetProperties(
            MFCLOCK_PROPERTIES *pClockProperties # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfclock-getstate
        HRESULT GetState(
            DWORD         dwReserved,   # [in]
            MFCLOCK_STATE *peClockState # [out]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfclockconsumer
    cdef cppclass IMFClockConsumer(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfclockconsumer-getpresentationclock
        HRESULT GetPresentationClock(
            IMFPresentationClock **ppPresentationClock # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfclockconsumer-setpresentationclock
        HRESULT SetPresentationClock(
            IMFPresentationClock *pPresentationClock # [in]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfclockstatesink
    cdef cppclass IMFClockStateSink(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfclockstatesink-onclockpause
        HRESULT OnClockPause(
            MFTIME hnsSystemTime # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfclockstatesink-onclockrestart
        HRESULT OnClockRestart(
            MFTIME hnsSystemTime # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfclockstatesink-onclocksetrate
        HRESULT OnClockSetRate(
            MFTIME hnsSystemTime, # [in]
            float  flRate         # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfclockstatesink-onclockstart
        HRESULT OnClockStart(
            MFTIME   hnsSystemTime,     # [in]
            LONGLONG llClockStartOffset # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfclockstatesink-onclockstop
        HRESULT OnClockStop(
            MFTIME hnsSystemTime # [in]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfcontentdecryptorcontext
    cdef cppclass IMFContentDecryptorContext(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcontentdecryptorcontext-initializehardwarekey
        HRESULT InitializeHardwareKey(
            UINT       InputPrivateDataByteCount, # [in]
            const void *InputPrivateData,         # [in, optional]
            UINT64     *OutputPrivateData         # [out]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfcontentenabler
    cdef cppclass IMFContentEnabler(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcontentenabler-automaticenable
        HRESULT AutomaticEnable()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcontentenabler-cancel
        HRESULT Cancel()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcontentenabler-getenabledata
        HRESULT GetEnableData(
            BYTE  **ppbData, # [out]
            DWORD *pcbData   # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcontentenabler-getenabletype
        HRESULT GetEnableType(
            GUID *pType # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcontentenabler-getenableurl
        HRESULT GetEnableURL(
            LPWSTR              *ppwszURL,    # [out]
            DWORD               *pcchURL,     # [out]
            MF_URL_TRUST_STATUS *pTrustStatus # [in, out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcontentenabler-isautomaticsupported
        HRESULT IsAutomaticSupported(
            BOOL *pfAutomatic # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcontentenabler-monitorenable
        HRESULT MonitorEnable()

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfcontentprotectiondevice
    cdef cppclass IMFContentProtectionDevice(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcontentprotectiondevice-getprivatedatabytecount
        HRESULT GetPrivateDataByteCount(
            DWORD *PrivateInputByteCount, # [out]
            DWORD *PrivateOutputByteCount # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcontentprotectiondevice-invokefunction
        HRESULT InvokeFunction(
            DWORD      FunctionId,             # [in]
            DWORD      InputBufferByteCount,   # [in]
            const BYTE *InputBuffer,           # [in]
            DWORD      *OutputBufferByteCount, # [in, out]
            BYTE       *OutputBuffer           # [out]
            )
    
    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfcontentprotectionmanager
    cdef cppclass IMFContentProtectionManager(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcontentprotectionmanager-beginenablecontent
        HRESULT BeginEnableContent(
            IMFActivate      *pEnablerActivate, # [in]
            IMFTopology      *pTopo,            # [in]
            IMFAsyncCallback *pCallback,        # [in]
            IUnknown         *punkState         # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfcontentprotectionmanager-endenablecontent
        HRESULT EndEnableContent(
            IMFAsyncResult *pResult # [in]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfdxgidevicemanagersource
    cdef cppclass IMFDXGIDeviceManagerSource(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfdxgidevicemanagersource-getmanager
        HRESULT GetManager(
            IMFDXGIDeviceManager **ppManager # [out]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfextendedcameracontrol
    cdef cppclass IMFExtendedCameraControl(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfextendedcameracontrol-commitsettings
        HRESULT CommitSettings()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfextendedcameracontrol-getcapabilities
        ULONGLONG GetCapabilities()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfextendedcameracontrol-getflags
        ULONGLONG GetFlags()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfextendedcameracontrol-lockpayload
        HRESULT LockPayload(
            BYTE  **ppPayload,
            ULONG *pulPayload
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfextendedcameracontrol-setflags
        HRESULT SetFlags(
            ULONGLONG ulFlags
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfextendedcameracontrol-unlockpayload
        HRESULT UnlockPayload()

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfextendedcameracontroller
    cdef cppclass IMFExtendedCameraController(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfextendedcameracontroller-getextendedcameracontrol
        HRESULT GetExtendedCameraControl(
            DWORD                    dwStreamIndex,
            ULONG                    ulPropertyId,
            IMFExtendedCameraControl **ppControl
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imffieldofusemftunlock
    cdef cppclass IMFFieldOfUseMFTUnlock(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imffieldofusemftunlock-unlock
        HRESULT Unlock(
            IUnknown *pUnkMFT # [in]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imffinalizablemediasink
    cdef cppclass IMFFinalizableMediaSink(IMFMediaSink):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imffinalizablemediasink-beginfinalize
        HRESULT BeginFinalize(
            IMFAsyncCallback *pCallback, # [in]
            IUnknown         *punkState  # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imffinalizablemediasink-endfinalize
        HRESULT EndFinalize(
            IMFAsyncResult *pResult # [in]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfgetservice
    cdef cppclass IMFGetService(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfgetservice-getservice
        HRESULT GetService(
            REFGUID guidService, # [in]
            REFIID  riid,        # [in]
            LPVOID  *ppvObject   # [out]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfhttpdownloadrequest
    cdef cppclass IMFHttpDownloadRequest(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-addheader
        HRESULT AddHeader(
            LPCWSTR szHeader # [in]
            )
        
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-beginreadpayload
        HRESULT BeginReadPayload(
            BYTE             *pb,         # [out]
            ULONG            cb,          # [in]
            IMFAsyncCallback *pCallback,  # [in]
            IUnknown         *punkState   # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-beginreceiveresponse
        HRESULT BeginReceiveResponse(
            IMFAsyncCallback *pCallback, # [in]
            IUnknown         *punkState
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-beginsendrequest
        HRESULT BeginSendRequest(
            const BYTE       *pbPayload, # [in]
            ULONG            cbPayload,  # [in]
            IMFAsyncCallback *pCallback, # [in]
            IUnknown         *punkState
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-close
        HRESULT Close()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-endreadpayload
        HRESULT EndReadPayload(
            IMFAsyncResult *pResult,   # [in]
            QWORD          *pqwOffset, # [out]
            ULONG          *pcbRead    # [out]
            )
        
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-endreceiveresponse
        HRESULT EndReceiveResponse(
            IMFAsyncResult *pResult # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-endsendrequest
        HRESULT EndSendRequest(
            IMFAsyncResult *pResult # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-getatendofpayload
        HRESULT GetAtEndOfPayload(
            BOOL *pfAtEndOfPayload # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-gethttpstatus
        HRESULT GetHttpStatus(
            DWORD *pdwHttpStatus # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-getrangeendoffset
        HRESULT GetRangeEndOffset(
            QWORD *pqwRangeEnd # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-gettimeseekresult
        HRESULT GetTimeSeekResult(
            QWORD *pqwStartTime, # [out]
            QWORD *pqwStopTime,  # [out]
            QWORD *pqwDuration   # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-gettotallength
        HRESULT GetTotalLength(
            QWORD *pqwTotalLength # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-geturl
        HRESULT GetURL(
            LPWSTR *ppszURL # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-hasnullsourceorigin
        HRESULT HasNullSourceOrigin(
            BOOL *pfNullSourceOrigin # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-queryheader
        HRESULT QueryHeader(
            LPCWSTR szHeaderName,    # [in]
            DWORD   dwIndex,         # [in]
            LPWSTR  *ppszHeaderValue # [out]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfhttpdownloadsession
    cdef cppclass IMFHttpDownloadSession(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadsession-close
        HRESULT Close()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadsession-createrequest
        HRESULT CreateRequest(
            LPCWSTR                szObjectName,      # [in]
            BOOL                   fBypassProxyCache, # [in]
            BOOL                   fSecure,           # [in]
            LPCWSTR                szVerb,            # [in, optional]
            LPCWSTR                szReferrer,        # [in, optional]
            IMFHttpDownloadRequest **ppRequest
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadsession-setserver
        HRESULT SetServer(
            LPCWSTR szServerName, # [in]
            DWORD   nPort         # [in]
            )
    
    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfhttpdownloadsessionprovider
    cdef cppclass IMFHttpDownloadSessionProvider(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadsessionprovider-createhttpdownloadsession
        HRESULT CreateHttpDownloadSession(
            LPCWSTR                wszScheme,          # [in]
            IMFHttpDownloadSession **ppDownloadSession # [out]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfinputtrustauthority
    cdef cppclass IMFInputTrustAuthority(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfinputtrustauthority-bindaccess
        HRESULT BindAccess(
            MFINPUTTRUSTAUTHORITY_ACCESS_PARAMS *pParam # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfinputtrustauthority-getdecrypter
        HRESULT GetDecrypter(
            REFIID riid, # [in]
            void   **ppv # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfinputtrustauthority-getpolicy
        HRESULT GetPolicy(
            MFPOLICYMANAGER_ACTION Action,    # [in]
            IMFOutputPolicy        **ppPolicy # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfinputtrustauthority-requestaccess
        HRESULT RequestAccess(
            MFPOLICYMANAGER_ACTION Action,                    # [in]
            IMFActivate            **ppContentEnablerActivate # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfinputtrustauthority-reset
        HRESULT Reset()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfinputtrustauthority-updateaccess
        HRESULT UpdateAccess(
            MFINPUTTRUSTAUTHORITY_ACCESS_PARAMS *pParam # [in]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imflocalmftregistration
    cdef cppclass IMFLocalMFTRegistration(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imflocalmftregistration-registermfts
        HRESULT RegisterMFTs(
            MFT_REGISTRATION_INFO *pMFTs, # [in]
            DWORD                 cMFTs   # [in]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfmediasession
    cdef cppclass IMFMediaSession(IMFMediaEventGenerator):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasession-cleartopologies
        HRESULT ClearTopologies()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasession-close
        HRESULT Close()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasession-getclock
        HRESULT GetClock(
            IMFClock **ppClock # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasession-getfulltopology
        HRESULT GetFullTopology(
            DWORD       dwGetFullTopologyFlags, # [in]
            TOPOID      TopoId,                 # [in]
            IMFTopology **ppFullTopology        # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasession-getsessioncapabilities
        HRESULT GetSessionCapabilities(
            DWORD *pdwCaps # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasession-pause
        HRESULT Pause()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasession-settopology
        HRESULT SetTopology(
            DWORD       dwSetTopologyFlags, # [in]
            IMFTopology *pTopology          # [in]
            )
        
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasession-shutdown
        HRESULT Shutdown()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasession-start
        HRESULT Start(
            const GUID        *pguidTimeFormat,  # [in]
            const PROPVARIANT *pvarStartPosition # [in]
            ) 

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasession-stop
        HRESULT Stop()

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfmediasink
    cdef cppclass IMFMediaSink(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasink-addstreamsink
        HRESULT AddStreamSink(
            DWORD         dwStreamSinkIdentifier, # [in]
            IMFMediaType  *pMediaType,            # [in]
            IMFStreamSink **ppStreamSink          # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasink-getcharacteristics
        HRESULT GetCharacteristics(
            DWORD *pdwCharacteristics # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasink-getpresentationclock
        HRESULT GetPresentationClock(
            IMFPresentationClock **ppPresentationClock # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasink-getstreamsinkbyid
        HRESULT GetStreamSinkById(
            DWORD         dwStreamSinkIdentifier, # [in]
            IMFStreamSink **ppStreamSink          # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasink-getstreamsinkcount
        HRESULT GetStreamSinkCount(
            DWORD *pcStreamSinkCount # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasink-removestreamsink
        HRESULT RemoveStreamSink(
            DWORD dwStreamSinkIdentifier # [in]
            )
        
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasink-setpresentationclock
        HRESULT SetPresentationClock(
            IMFPresentationClock *pPresentationClock # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasink-shutdown
        HRESULT Shutdown()

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfmediasinkpreroll
    cdef cppclass IMFMediaSinkPreroll(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasinkpreroll-notifypreroll
        HRESULT NotifyPreroll(
            MFTIME hnsUpcomingStartTime # [in]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfmediasource
    cdef cppclass IMFMediaSource(IMFMediaEventGenerator):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasource-createpresentationdescriptor
        HRESULT CreatePresentationDescriptor(
            IMFPresentationDescriptor **ppPresentationDescriptor # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasource-getcharacteristics
        HRESULT GetCharacteristics(
            DWORD *pdwCharacteristics # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasource-pause
        HRESULT Pause()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasource-shutdown
        HRESULT Shutdown()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasource-start
        HRESULT Start(
            IMFPresentationDescriptor *pPresentationDescriptor, # [in]
            const GUID                *pguidTimeFormat,         # [in]
            const PROPVARIANT         *pvarStartPosition        # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasource-stop
        HRESULT Stop()
    
    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfmediasourceex
    cdef cppclass IMFMediaSourceEx(IMFMediaSource):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasourceex-getsourceattributes
        HRESULT GetSourceAttributes(
            IMFAttributes **ppAttributes # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasourceex-getstreamattributes
        HRESULT GetStreamAttributes(
            DWORD         dwStreamIdentifier, # [in]
            IMFAttributes **ppAttributes      # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nf-mfidl-imfmediasourceex-setd3dmanager
        HRESULT SetD3DManager(
            IUnknown *pManager # [in]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfmediasourcepresentationprovider
    