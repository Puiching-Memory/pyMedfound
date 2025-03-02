from pyMedfound.windef cimport BYTE,DWORD,LONG,BOOL,WORD,SIZE,LONGLONG,UINT64,UINT32,UINT8,LPWSTR,LPVOID,LPCWSTR,ULONG,QWORD,UINT,ULONGLONG
from pyMedfound.winerror cimport HRESULT
from pyMedfound.guiddef cimport GUID,REFIID,REFGUID,CLSID,REFCLSID
from pyMedfound.unknwn cimport IUnknown
from pyMedfound.PropIdlBase cimport PROPVARIANT,REFPROPVARIANT
from pyMedfound.wtypes cimport VT_UI4,VT_UI8,VT_R8,VT_CLSID,VT_LPWSTR,VT_UNKNOWN
from pyMedfound.winnt cimport HANDLE

# https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/
cdef extern from "mfobjects.h":
    
    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imf2dbuffer
    cdef cppclass IMF2DBuffer(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imf2dbuffer-contiguouscopyfrom
        HRESULT ContiguousCopyFrom(
            const BYTE *pbSrcBuffer, # [in]
            DWORD      cbSrcBuffer   # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imf2dbuffer-contiguouscopyto
        HRESULT ContiguousCopyTo(
            BYTE  *pbDestBuffer, # [out]
            DWORD cbDestBuffer   # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imf2dbuffer-getcontiguouslength
        HRESULT GetContiguousLength(
            DWORD *pcbLength # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imf2dbuffer-getscanline0andpitch
        HRESULT GetScanline0AndPitch(
            BYTE **pbScanline0, # [out]
            LONG *plPitch       # [out] 
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imf2dbuffer-iscontiguousformat
        HRESULT IsContiguousFormat(
            BOOL *pfIsContiguous # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imf2dbuffer-lock2d
        HRESULT Lock2D(
        BYTE **ppbScanline0, # [out]
        LONG *plPitch        # [out]
        )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imf2dbuffer-unlock2d
        HRESULT Unlock2D()

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imf2dbuffer2
    cdef cppclass IMF2DBuffer2(IMF2DBuffer):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imf2dbuffer2-copy2dto
        HRESULT Copy2DTo(
            IMF2DBuffer2 *pDestBuffer # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imf2dbuffer2-lock2dsize
        HRESULT Lock2DSize(
            MF2DBuffer_LockFlags lockFlags,        # [in]
            BYTE                 **ppbScanline0,   # [out]
            LONG                 *plPitch,         # [out]
            BYTE                 **ppbBufferStart, # [out]
            DWORD                *pcbBufferLength  # [out]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imfasynccallback
    cdef cppclass IMFAsyncCallback(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfasynccallback-getparameters
        HRESULT GetParameters(
            DWORD *pdwFlags, # [out]
            DWORD *pdwQueue  # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfasynccallback-invoke
        HRESULT Invoke(
            IMFAsyncResult *pAsyncResult # [in]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imfasynccallbacklogging
    cdef cppclass IMFAsyncCallbackLogging(IMFAsyncCallback):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfasynccallbacklogging-getobjectpointer
        void * GetObjectPointer()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfasynccallbacklogging-getobjecttag
        DWORD GetObjectTag()

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imfasyncresult
    cdef cppclass IMFAsyncResult(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfasyncresult-getobject
        HRESULT GetObject(
            IUnknown **ppObject # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfasyncresult-getstate
        HRESULT GetState(
            IUnknown **ppunkState # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfasyncresult-getstatenoaddref
        IUnknown * GetStateNoAddRef()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfasyncresult-getstatus
        HRESULT GetStatus()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfasyncresult-setstatus
        HRESULT SetStatus(
            HRESULT hrStatus # [in]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imfattributes
    cdef cppclass IMFAttributes(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-compare
        HRESULT Compare(
            IMFAttributes            *pTheirs, # [in]
            MF_ATTRIBUTES_MATCH_TYPE MatchType,# [in]
            BOOL                     *pbResult # [out]
            )
        
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-compareitem
        HRESULT CompareItem(
            REFGUID        guidKey, # [in]
            REFPROPVARIANT Value,   # [in]
            BOOL           *pbResult# [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-copyallitems
        HRESULT CopyAllItems(
            IMFAttributes *pDest # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-deleteallitems
        HRESULT DeleteAllItems()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-deleteitem
        HRESULT DeleteItem(
            REFGUID guidKey # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getallocatedblob
        HRESULT GetAllocatedBlob(
            REFGUID guidKey, # [in]
            UINT8   **ppBuf, # [out]
            UINT32  *pcbSize # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getallocatedstring
        HRESULT GetAllocatedString(
            REFGUID guidKey,     # [in]
            LPWSTR  *ppwszValue, # [out]
            UINT32  *pcchLength  # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getblob
        HRESULT GetBlob(
            REFGUID guidKey,     # [in]
            UINT8   *pBuf,       # [out]
            UINT32  cbBufSize,   # [in]
            UINT32  *pcbBlobSize # [out] 
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getblobsize
        HRESULT GetBlobSize(
            REFGUID guidKey,     # [in]
            UINT32  *pcbBlobSize # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getcount
        HRESULT GetCount(
            UINT32 *pcItems # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getdouble
        HRESULT GetDouble(
            REFGUID guidKey, # [in]
            double  *pfValue # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getguid
        HRESULT GetGUID(
            REFGUID guidKey,    # [in]
            GUID    *pguidValue # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getitem
        HRESULT GetItem(
            REFGUID     guidKey, # [in]
            PROPVARIANT *pValue  # [in, out]
            )
        
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getitemtype
        HRESULT GetItemType(
            REFGUID           guidKey,
            MF_ATTRIBUTE_TYPE *pType
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getstring
        HRESULT GetString(
            REFGUID guidKey,    # [in]
            LPWSTR  pwszValue,  # [out]
            UINT32  cchBufSize, # [in]
            UINT32  *pcchLength # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getstringlength
        HRESULT GetStringLength(
            REFGUID guidKey,    # [in]
            UINT32  *pcchLength # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getuint32
        HRESULT GetUINT32(
            REFGUID guidKey,  # [in]
            UINT32  *punValue # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getuint64
        HRESULT GetUINT64(
            REFGUID guidKey,  # [in]
            UINT64  *punValue # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getunknown
        HRESULT GetUnknown(
            REFGUID guidKey, # [in]
            REFIID  riid,    # [in]
            LPVOID  *ppv     # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-lockstore
        HRESULT LockStore()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-setblob
        HRESULT SetBlob(
            REFGUID     guidKey,  # [in]
            const UINT8 *pBuf,    # [in]
            UINT32      cbBufSize # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-setdouble
        HRESULT SetDouble(
            REFGUID guidKey, # [in]
            double  fValue   # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-setguid
        HRESULT SetGUID(
            REFGUID guidKey,  # [in]
            REFGUID guidValue # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-setitem
        HRESULT SetItem(
            REFGUID        guidKey, # [in]
            REFPROPVARIANT Value    # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-setstring
        HRESULT SetString(
            REFGUID guidKey, # [in]
            LPCWSTR wszValue # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-setuint32
        HRESULT SetUINT32(
            REFGUID guidKey, # [in]
            UINT32  unValue  # [in]
            )
        
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-setuint64
        HRESULT SetUINT64(
            REFGUID guidKey,
            UINT64  unValue
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-setunknown
        HRESULT SetUnknown(
            REFGUID  guidKey,
            IUnknown *pUnknown
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-unlockstore
        HRESULT UnlockStore()
            
    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imfactivate
    cdef cppclass IMFActivate(IMFAttributes):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfactivate-activateobject
        HRESULT ActivateObject(
            REFIID riid, # [in]
            void   **ppv # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfactivate-detachobject
        HRESULT DetachObject()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfactivate-shutdownobject
        HRESULT ShutdownObject()

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imfbytestream
    cdef cppclass IMFByteStream(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-beginread
        HRESULT BeginRead(
            BYTE             *pb,        # [in]
            ULONG            cb,         # [in]
            IMFAsyncCallback *pCallback, # [in]
            IUnknown         *punkState  # [in]
            )
        
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-beginwrite
        HRESULT BeginWrite(
            const BYTE       *pb,        # [in]
            ULONG            cb,         # [in]
            IMFAsyncCallback *pCallback, # [in]
            IUnknown         *punkState  # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-close
        HRESULT Close()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-endread
        HRESULT EndRead(
            IMFAsyncResult *pResult, # [in]
            ULONG          *pcbRead  # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-endwrite
        HRESULT EndWrite(
            IMFAsyncResult *pResult,   # [in]
            ULONG          *pcbWritten # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-flush
        HRESULT Flush()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-getcapabilities
        HRESULT GetCapabilities(
            DWORD *pdwCapabilities # [out]
            )
        
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-getcurrentposition
        HRESULT GetCurrentPosition(
            QWORD *pqwPosition # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-getlength
        HRESULT GetLength(
            QWORD *pqwLength # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-isendofstream
        HRESULT IsEndOfStream(
            BOOL *pfEndOfStream # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-read
        HRESULT Read(
            BYTE  *pb,     # [in]
            ULONG cb,      # [in]
            ULONG *pcbRead # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-seek
        HRESULT Seek(
            MFBYTESTREAM_SEEK_ORIGIN SeekOrigin,         # [in]
            LONGLONG                 llSeekOffset,       # [in]
            DWORD                    dwSeekFlags,        # [in]
            QWORD                    *pqwCurrentPosition # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-setcurrentposition
        HRESULT SetCurrentPosition(
            QWORD qwPosition # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-setlength
        HRESULT SetLength(
            QWORD qwLength # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-write
        HRESULT Write(
            const BYTE *pb,        # [in]
            ULONG      cb,         # [in]
            ULONG      *pcbWritten # [out]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imfbytestreamproxyclassfactory
    cdef cppclass IMFByteStreamProxyClassFactory(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfbytestreamproxyclassfactory-createbytestreamproxy
        HRESULT CreateByteStreamProxy(
            IMFByteStream *pByteStream, # [in]
            IMFAttributes *pAttributes, # [in]
            REFIID        riid,         # [in]
            LPVOID        *ppvObject    # [out]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imfcollection
    cdef cppclass IMFCollection(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfcollection-addelement
        HRESULT AddElement(
            IUnknown *pUnkElement # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfcollection-getelement
        HRESULT GetElement(
            DWORD    dwElementIndex, # [in]
            IUnknown **ppUnkElement  # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfcollection-getelementcount
        HRESULT GetElementCount(
            DWORD *pcElements # [out]
            )
        
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfcollection-insertelementat
        HRESULT InsertElementAt(
            DWORD    dwIndex,  # [in]
            IUnknown *pUnknown # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfcollection-removeallelements
        HRESULT RemoveAllElements()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfcollection-removeelement
        HRESULT RemoveElement(
            DWORD    dwElementIndex, # [in]
            IUnknown **ppUnkElement  # [out]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imfdxgibuffer
    cdef cppclass IMFDXGIBuffer(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfdxgibuffer-getresource
        HRESULT GetResource(
            REFIID riid,      # [in]
            LPVOID *ppvObject # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfdxgibuffer-getunknown
        HRESULT GetUnknown(
            REFIID guid,      # [in]
            REFIID riid,      # [in]
            LPVOID *ppvObject # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfdxgibuffer-setunknown
        HRESULT SetUnknown(
            REFIID   guid,     # [in]
            IUnknown *pUnkData # [in]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imfdxgidevicemanager
    cdef cppclass IMFDXGIDeviceManager(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-closedevicehandle
        HRESULT CloseDeviceHandle(
            HANDLE hDevice # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-getvideoservice
        HRESULT GetVideoService(
            HANDLE hDevice,    # [in]
            REFIID riid,       # [in]
            void   **ppService # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-lockdevice
        HRESULT LockDevice(
            HANDLE hDevice,       # [in]
            REFIID riid,          # [in]
            void   **ppUnkDevice, # [out]
            BOOL   fBlock         # [in]
            )
        
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-opendevicehandle
        HRESULT OpenDeviceHandle(
            HANDLE *phDevice # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-resetdevice
        HRESULT ResetDevice(
            IUnknown *pUnkDevice, # [in]
            UINT     resetToken   # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-testdevice
        HRESULT TestDevice(
            HANDLE hDevice # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-unlockdevice
        HRESULT UnlockDevice(
            HANDLE hDevice,   # [in]
            BOOL   fSaveState # [in]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imfmediabuffer
    cdef cppclass IMFMediaBuffer(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmediabuffer-getcurrentlength
        HRESULT GetCurrentLength(
            DWORD *pcbCurrentLength # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmediabuffer-getmaxlength
        HRESULT GetMaxLength(
            DWORD *pcbMaxLength # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmediabuffer-lock
        HRESULT Lock(
            BYTE  **ppbBuffer,      # [out]
            DWORD *pcbMaxLength,    # [out]
            DWORD *pcbCurrentLength # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmediabuffer-setcurrentlength
        HRESULT SetCurrentLength(
            DWORD cbCurrentLength # [in]
            )
        
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmediabuffer-unlock
        HRESULT Unlock()

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imfmediaevent
    cdef cppclass IMFMediaEvent(IMFAttributes):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmediaevent-getextendedtype
        HRESULT GetExtendedType(
            GUID *pguidExtendedType # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmediaevent-getstatus
        HRESULT GetStatus(
            HRESULT *phrStatus # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmediaevent-gettype
        HRESULT GetType(
            MediaEventType *pmet # [out]
        )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmediaevent-getvalue
        HRESULT GetValue(
            PROPVARIANT *pvValue # [out]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imfmediaeventgenerator
    cdef cppclass IMFMediaEventGenerator(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-begingetevent
        HRESULT BeginGetEvent(
            IMFAsyncCallback *pCallback, # [in]
            IUnknown         *punkState  # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-endgetevent
        HRESULT EndGetEvent(
            IMFAsyncResult *pResult, # [in]
            IMFMediaEvent  **ppEvent # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-getevent
        HRESULT GetEvent(
            DWORD         dwFlags,  # [in]
            IMFMediaEvent **ppEvent # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-queueevent
        HRESULT QueueEvent(
            MediaEventType    met,              # [in]
            REFGUID           guidExtendedType, # [in]
            HRESULT           hrStatus,         # [in]
            const PROPVARIANT *pvValue          # [in]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imfmediaeventqueue
    cdef cppclass IMFMediaEventQueue(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventqueue-begingetevent
        HRESULT BeginGetEvent(
            IMFAsyncCallback *pCallback, # [in]
            IUnknown         *punkState  # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventqueue-endgetevent
        HRESULT EndGetEvent(
            IMFAsyncResult *pResult, # [in]
            IMFMediaEvent  **ppEvent # [out]
            ) 

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventqueue-getevent
        HRESULT GetEvent(
            DWORD         dwFlags,  # [in]
            IMFMediaEvent **ppEvent # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventqueue-queueevent
        HRESULT QueueEvent(
            IMFMediaEvent *pEvent # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventqueue-queueeventparamunk
        HRESULT QueueEventParamUnk(
            MediaEventType met,              # [in]
            REFGUID        guidExtendedType, # [in]
            HRESULT        hrStatus,         # [in]
            IUnknown       *pUnk             # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventqueue-queueeventparamvar
        HRESULT QueueEventParamVar(
            MediaEventType    met,              # [in]
            REFGUID           guidExtendedType, # [in]
            HRESULT           hrStatus,         # [in]
            const PROPVARIANT *pvValue          # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventqueue-shutdown
        HRESULT Shutdown()

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imfmediatype
    cdef cppclass IMFMediaType(IMFAttributes):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmediatype-freerepresentation
        HRESULT FreeRepresentation(
            GUID   guidRepresentation, # [in]
            LPVOID pvRepresentation    # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmediatype-getmajortype
        HRESULT GetMajorType(
            GUID *pguidMajorType # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmediatype-getrepresentation
        HRESULT GetRepresentation(
            GUID   guidRepresentation, # [in]
            LPVOID *ppvRepresentation  # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmediatype-iscompressedformat
        HRESULT IsCompressedFormat(
            BOOL *pfCompressed # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmediatype-isequal
        HRESULT IsEqual(
            IMFMediaType *pIMediaType, # [in]
            DWORD        *pdwFlags     # [out]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imfaudiomediatype
    # !Deprecated since Windows 7!
    # cdef cppclass IMFAudioMediaType(IMFMediaType):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfaudiomediatype-getaudioformat
        # const WAVEFORMATEX * GetAudioFormat()

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imfmuxstreamattributesmanager
    cdef cppclass IMFMuxStreamAttributesManager(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreamattributesmanager-getattributes
        HRESULT GetAttributes(
            DWORD         dwMuxStreamIndex,    # [in]
            IMFAttributes **ppStreamAttributes # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreamattributesmanager-getstreamcount
        HRESULT GetStreamCount(
            DWORD *pdwMuxStreamCount # [out]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imfmuxstreammediatypemanager
    cdef cppclass IMFMuxStreamMediaTypeManager(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-addstreamconfiguration
        HRESULT AddStreamConfiguration(
            ULONGLONG ullStreamMask # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-getmediatype
        HRESULT GetMediaType(
            DWORD        dwMuxStreamIndex, # [in]
            IMFMediaType **ppMediaType     # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-getstreamconfiguration
        HRESULT GetStreamConfiguration(
            DWORD     ulIndex,        # [in]
            ULONGLONG *pullStreamMask # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-getstreamconfigurationcount
        HRESULT GetStreamConfigurationCount(
            DWORD *pdwCount # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-getstreamcount
        HRESULT GetStreamCount(
            DWORD *pdwMuxStreamCount # [out]
            )
        
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-removestreamconfiguration
        HRESULT RemoveStreamConfiguration(
            ULONGLONG ullStreamMask # [in]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imfplugincontrol
    cdef cppclass IMFPluginControl(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfplugincontrol-getpreferredclsid
        HRESULT GetPreferredClsid(
            DWORD   pluginType, # [in]
            LPCWSTR selector,   # [in]
            CLSID   *clsid      # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfplugincontrol-isdisabled
        HRESULT IsDisabled(
            DWORD    pluginType, # [in]
            REFCLSID clsid       # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfplugincontrol-setdisabled
        HRESULT SetDisabled(
            DWORD    pluginType, # [in]
            REFCLSID clsid,      # [in]
            BOOL     disabled    # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfplugincontrol-setpreferredclsid
        HRESULT SetPreferredClsid(
            DWORD       pluginType, # [in]
            LPCWSTR     selector,   # [in]
            const CLSID *clsid      # [in]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imfplugincontrol2
    cdef cppclass IMFPluginControl2(IMFPluginControl):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfplugincontrol2-setpolicy
        HRESULT SetPolicy(
            MF_PLUGIN_CONTROL_POLICY policy # [in]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imfremoteasynccallback
    # !Applications do not use or implement this interface.!

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imfsample
    cdef cppclass IMFSample(IMFAttributes):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfsample-addbuffer
        HRESULT AddBuffer(
            IMFMediaBuffer *pBuffer # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfsample-converttocontiguousbuffer
        HRESULT ConvertToContiguousBuffer(
            IMFMediaBuffer **ppBuffer # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfsample-copytobuffer
        HRESULT CopyToBuffer(
            IMFMediaBuffer *pBuffer # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfsample-getbuffercount
        HRESULT GetBufferCount(
            DWORD *pdwBufferCount # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfsample-getsampleduration
        HRESULT GetSampleDuration(
            LONGLONG *phnsSampleDuration # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfsample-getsampleflags
        HRESULT GetSampleFlags(
            DWORD *pdwSampleFlags # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfsample-getsampletime
        HRESULT GetSampleTime(
            LONGLONG *phnsSampleTime # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfsample-gettotallength
        HRESULT GetTotalLength(
            DWORD *pcbTotalLength # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfsample-removeallbuffers
        HRESULT RemoveAllBuffers()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfsample-setsampleduration
        HRESULT SetSampleDuration(
            LONGLONG hnsSampleDuration # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfsample-setsampleflags
        HRESULT SetSampleFlags(
            DWORD dwSampleFlags # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfsample-setsampletime
        HRESULT SetSampleTime(
            LONGLONG hnsSampleTime # [in]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imfmuxstreamsamplemanager
    cdef cppclass IMFMuxStreamSampleManager(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreamsamplemanager-getsample
        HRESULT GetSample(
            DWORD     dwMuxStreamIndex, # [in]
            IMFSample **ppSample        # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreamsamplemanager-getstreamconfiguration
        ULONGLONG GetStreamConfiguration()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreamsamplemanager-getstreamcount
        HRESULT GetStreamCount(
            DWORD *pdwMuxStreamCount # [out]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imfsampleoutputstream
    cdef cppclass IMFSampleOutputStream(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfsampleoutputstream-beginwritesample
        HRESULT BeginWriteSample(
            IMFSample        *pSample,   # [in]
            IMFAsyncCallback *pCallback, # [in]
            IUnknown         *punkState  # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfsampleoutputstream-endwritesample
        HRESULT EndWriteSample(
            IMFAsyncResult *pResult # [in]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imfvideomediatype
    cdef cppclass IMFVideoMediaType(IMFMediaType):
        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfvideomediatype-getvideoformat
        # !Deprecated since Windows 7!
        const MFVIDEOFORMAT * GetVideoFormat()

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imfvideomediatype-getvideorepresentation
        # !Deprecated!
        HRESULT GetVideoRepresentation(
            GUID   guidRepresentation, # [in]
            LPVOID *ppvRepresentation, # [out]
            LONG   lStride             # [in]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ne-mfobjects-mf_attribute_serialize_options
    ctypedef enum MF_ATTRIBUTE_SERIALIZE_OPTIONS:
        MF_ATTRIBUTE_SERIALIZE_UNKNOWN_BYREF = 0x1

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ne-mfobjects-mf_attribute_type
    ctypedef enum MF_ATTRIBUTE_TYPE:
        MF_ATTRIBUTE_UINT32 = VT_UI4
        MF_ATTRIBUTE_UINT64 = VT_UI8
        MF_ATTRIBUTE_DOUBLE = VT_R8
        MF_ATTRIBUTE_GUID = VT_CLSID
        MF_ATTRIBUTE_STRING = VT_LPWSTR
        MF_ATTRIBUTE_BLOB
        MF_ATTRIBUTE_IUNKNOWN = VT_UNKNOWN

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ne-mfobjects-mf_attributes_match_type
    ctypedef enum MF_ATTRIBUTES_MATCH_TYPE:
        MF_ATTRIBUTES_MATCH_OUR_ITEMS = 0
        MF_ATTRIBUTES_MATCH_THEIR_ITEMS = 1
        MF_ATTRIBUTES_MATCH_ALL_ITEMS = 2
        MF_ATTRIBUTES_MATCH_INTERSECTION = 3
        MF_ATTRIBUTES_MATCH_SMALLER = 4

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ne-mfobjects-mf_file_accessmode
    ctypedef enum MF_FILE_ACCESSMODE:
        MF_ACCESSMODE_READ = 1
        MF_ACCESSMODE_WRITE = 2
        MF_ACCESSMODE_READWRITE = 3

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ne-mfobjects-mf_file_flags
    ctypedef enum MF_FILE_FLAGS:
        MF_FILEFLAGS_NONE = 0
        MF_FILEFLAGS_NOBUFFERING = 0x1
        MF_FILEFLAGS_ALLOW_WRITE_SHARING = 0x2

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ne-mfobjects-mf_file_openmode
    ctypedef enum MF_FILE_OPENMODE:
        MF_OPENMODE_FAIL_IF_NOT_EXIST = 0
        MF_OPENMODE_FAIL_IF_EXIST = 1
        MF_OPENMODE_RESET_IF_EXIST = 2
        MF_OPENMODE_APPEND_IF_EXIST = 3
        MF_OPENMODE_DELETE_IF_EXIST = 4

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ne-mfobjects-mf_plugin_control_policy
    ctypedef enum MF_PLUGIN_CONTROL_POLICY:
        MF_PLUGIN_CONTROL_POLICY_USE_ALL_PLUGINS = 0
        MF_PLUGIN_CONTROL_POLICY_USE_APPROVED_PLUGINS = 1
        MF_PLUGIN_CONTROL_POLICY_USE_WEB_PLUGINS = 2
        MF_PLUGIN_CONTROL_POLICY_USE_WEB_PLUGINS_EDGEMODE = 3

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ne-mfobjects-mf_plugin_type
    ctypedef enum MF_Plugin_Type:
        MF_Plugin_Type_MFT = 0
        MF_Plugin_Type_MediaSource = 1
        MF_Plugin_Type_MFT_MatchOutputType = 2
        MF_Plugin_Type_Other

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ne-mfobjects-mf2dbuffer_lockflags
    ctypedef enum MF2DBuffer_LockFlags:
        MF2DBuffer_LockFlags_LockTypeMask
        MF2DBuffer_LockFlags_Read = 0x1
        MF2DBuffer_LockFlags_Write = 0x2
        MF2DBuffer_LockFlags_ReadWrite = 0x3
        MF2DBuffer_LockFlags_ForceDWORD = 0x7fffffff

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ns-mfobjects-mfargb
    ctypedef struct MFARGB:
        BYTE rgbBlue
        BYTE rgbGreen
        BYTE rgbRed
        BYTE rgbAlpha

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ns-mfobjects-mfayuvsample
    ctypedef struct MFAYUVSample:
        BYTE bCrValue
        BYTE bCbValue
        BYTE bYValue
        BYTE bSampleAlpha8

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ne-mfobjects-mfbytestream_seek_origin
    ctypedef enum MFBYTESTREAM_SEEK_ORIGIN:
        msoBegin = 0
        msoCurrent

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-mfdeserializeattributesfromstream
    # HRESULT MFDeserializeAttributesFromStream(
        # IMFAttributes *pAttr,
        # DWORD         dwOptions,
        # IStream       *pStm
        # )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ne-mfobjects-mfnominalrange
    ctypedef enum MFNominalRange:
        MFNominalRange_Unknown = 0
        MFNominalRange_Normal = 1
        MFNominalRange_Wide = 2
        MFNominalRange_0_255 = 1
        MFNominalRange_16_235 = 2
        MFNominalRange_48_208 = 3
        MFNominalRange_64_127 = 4
        MFNominalRange_Last
        MFNominalRange_ForceDWORD = 0x7fffffff

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ns-mfobjects-mfoffset
    ctypedef struct MFOffset:
        WORD  fract
        short value

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ns-mfobjects-mfpaletteentry
    ctypedef union MFPaletteEntry:
        MFARGB       ARGB
        MFAYUVSample AYCbCr

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ns-mfobjects-mfratio
    ctypedef struct MFRatio:
        DWORD Numerator
        DWORD Denominator

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-mfserializeattributestostream
    # HRESULT MFSerializeAttributesToStream(
    #     IMFAttributes *pAttr,
    #     DWORD         dwOptions,
    #     IStream       *pStm
    #     )

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ne-mfobjects-mfstandardvideoformat
    ctypedef enum MFStandardVideoFormat:
        MFStdVideoFormat_reserved = 0
        MFStdVideoFormat_NTSC
        MFStdVideoFormat_PAL
        MFStdVideoFormat_DVD_NTSC
        MFStdVideoFormat_DVD_PAL
        MFStdVideoFormat_DV_PAL
        MFStdVideoFormat_DV_NTSC
        MFStdVideoFormat_ATSC_SD480i
        MFStdVideoFormat_ATSC_HD1080i
        MFStdVideoFormat_ATSC_HD720p

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info
    ctypedef struct MFT_REGISTER_TYPE_INFO:
        GUID guidMajorType
        GUID guidSubtype

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ns-mfobjects-mfvideoarea
    ctypedef struct MFVideoArea:
        MFOffset OffsetX
        MFOffset OffsetY
        SIZE     Area

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ne-mfobjects-mfvideochromasubsampling
    ctypedef enum MFVideoChromaSubsampling:
        MFVideoChromaSubsampling_Unknown = 0
        MFVideoChromaSubsampling_ProgressiveChroma = 0x8
        MFVideoChromaSubsampling_Horizontally_Cosited = 0x4
        MFVideoChromaSubsampling_Vertically_Cosited = 0x2
        MFVideoChromaSubsampling_Vertically_AlignedChromaPlanes = 0x1
        MFVideoChromaSubsampling_MPEG2
        MFVideoChromaSubsampling_MPEG1
        MFVideoChromaSubsampling_DV_PAL
        MFVideoChromaSubsampling_Cosited
        MFVideoChromaSubsampling_Last
        MFVideoChromaSubsampling_ForceDWORD = 0x7fffffff

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ns-mfobjects-mfvideocompressedinfo
    ctypedef struct MFVideoCompressedInfo:
        LONGLONG AvgBitrate
        LONGLONG AvgBitErrorRate
        DWORD    MaxKeyFrameSpacing

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ne-mfobjects-mfvideoflags
    ctypedef enum MFVideoFlags:
        MFVideoFlag_PAD_TO_Mask
        MFVideoFlag_PAD_TO_None
        MFVideoFlag_PAD_TO_4x3
        MFVideoFlag_PAD_TO_16x9
        MFVideoFlag_SrcContentHintMask
        MFVideoFlag_SrcContentHintNone
        MFVideoFlag_SrcContentHint16x9
        MFVideoFlag_SrcContentHint235_1
        MFVideoFlag_AnalogProtected = 0x20
        MFVideoFlag_DigitallyProtected = 0x40
        MFVideoFlag_ProgressiveContent = 0x80
        MFVideoFlag_FieldRepeatCountMask
        MFVideoFlag_FieldRepeatCountShift = 8
        MFVideoFlag_ProgressiveSeqReset = 0x800
        MFVideoFlag_PanScanEnabled = 0x20000
        MFVideoFlag_LowerFieldFirst = 0x40000
        MFVideoFlag_BottomUpLinearRep = 0x80000
        MFVideoFlags_DXVASurface = 0x100000
        MFVideoFlags_RenderTargetSurface = 0x400000
        MFVideoFlags_ForceQWORD = 0x7fffffff

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ns-mfobjects-mfvideoinfo
    ctypedef struct MFVideoInfo:
        DWORD                    dwWidth
        DWORD                    dwHeight
        MFRatio                  PixelAspectRatio
        MFVideoChromaSubsampling SourceChromaSubsampling
        MFVideoInterlaceMode     InterlaceMode
        MFVideoTransferFunction  TransferFunction
        MFVideoPrimaries         ColorPrimaries
        MFVideoTransferMatrix    TransferMatrix
        MFVideoLighting          SourceLighting
        MFRatio                  FramesPerSecond
        MFNominalRange           NominalRange
        MFVideoArea              GeometricAperture
        MFVideoArea              MinimumDisplayAperture
        MFVideoArea              PanScanAperture
        UINT64                   VideoFlags

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ns-mfobjects-mfvideosurfaceinfo
    ctypedef struct MFVideoSurfaceInfo:
        DWORD          Format
        DWORD          PaletteEntries
        MFPaletteEntry Palette[1]

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ns-mfobjects-mfvideoformat
    ctypedef struct MFVIDEOFORMAT:
        DWORD                 dwSize
        MFVideoInfo           videoInfo
        GUID                  guidFormat
        MFVideoCompressedInfo compressedInfo
        MFVideoSurfaceInfo    surfaceInfo

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ne-mfobjects-mfvideointerlacemode
    ctypedef enum MFVideoInterlaceMode:
        MFVideoInterlace_Unknown = 0
        MFVideoInterlace_Progressive = 2
        MFVideoInterlace_FieldInterleavedUpperFirst = 3
        MFVideoInterlace_FieldInterleavedLowerFirst = 4
        MFVideoInterlace_FieldSingleUpper = 5
        MFVideoInterlace_FieldSingleLower = 6
        MFVideoInterlace_MixedInterlaceOrProgressive = 7
        MFVideoInterlace_Last
        MFVideoInterlace_ForceDWORD = 0x7fffffff

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ne-mfobjects-mfvideolighting
    ctypedef enum MFVideoLighting:
        MFVideoLighting_Unknown = 0
        MFVideoLighting_bright = 1
        MFVideoLighting_office = 2
        MFVideoLighting_dim = 3
        MFVideoLighting_dark = 4
        MFVideoLighting_Last
        MFVideoLighting_ForceDWORD = 0x7fffffff

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ne-mfobjects-mfvideoprimaries
    ctypedef enum MFVideoPrimaries:
        MFVideoPrimaries_Unknown = 0
        MFVideoPrimaries_reserved = 1
        MFVideoPrimaries_BT709 = 2
        MFVideoPrimaries_BT470_2_SysM = 3
        MFVideoPrimaries_BT470_2_SysBG = 4
        MFVideoPrimaries_SMPTE170M = 5
        MFVideoPrimaries_SMPTE240M = 6
        MFVideoPrimaries_EBU3213 = 7
        MFVideoPrimaries_SMPTE_C = 8
        MFVideoPrimaries_BT2020 = 9
        MFVideoPrimaries_XYZ = 10
        MFVideoPrimaries_DCI_P3 = 11
        MFVideoPrimaries_ACES = 12
        MFVideoPrimaries_Display_P3 = 13
        MFVideoPrimaries_Last
        MFVideoPrimaries_ForceDWORD = 0x7fffffff

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ne-mfobjects-mfvideotransferfunction
    ctypedef enum MFVideoTransferFunction:
        MFVideoTransFunc_Unknown = 0
        MFVideoTransFunc_10 = 1
        MFVideoTransFunc_18 = 2
        MFVideoTransFunc_20 = 3
        MFVideoTransFunc_22 = 4
        MFVideoTransFunc_709 = 5
        MFVideoTransFunc_240M = 6
        MFVideoTransFunc_sRGB = 7
        MFVideoTransFunc_28 = 8
        MFVideoTransFunc_Log_100 = 9
        MFVideoTransFunc_Log_316 = 10
        MFVideoTransFunc_709_sym = 11
        MFVideoTransFunc_2020_const = 12
        MFVideoTransFunc_2020 = 13
        MFVideoTransFunc_26 = 14
        MFVideoTransFunc_2084 = 15
        MFVideoTransFunc_HLG = 16
        MFVideoTransFunc_10_rel = 17
        MFVideoTransFunc_BT1361_ECG = 18
        MFVideoTransFunc_SMPTE428 = 19
        MFVideoTransFunc_Last
        MFVideoTransFunc_ForceDWORD = 0x7fffffff

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ne-mfobjects-mfvideotransfermatrix
    ctypedef enum MFVideoTransferMatrix:
        MFVideoTransferMatrix_Unknown = 0
        MFVideoTransferMatrix_BT709 = 1
        MFVideoTransferMatrix_BT601 = 2
        MFVideoTransferMatrix_SMPTE240M = 3
        MFVideoTransferMatrix_BT2020_10 = 4
        MFVideoTransferMatrix_BT2020_12 = 5
        MFVideoTransferMatrix_Identity = 6
        MFVideoTransferMatrix_FCC47 = 7
        MFVideoTransferMatrix_YCgCo = 8
        MFVideoTransferMatrix_SMPTE2085 = 9
        MFVideoTransferMatrix_Chroma = 10
        MFVideoTransferMatrix_Chroma_const = 11
        MFVideoTransferMatrix_ICtCp = 12
        MFVideoTransferMatrix_Last
        MFVideoTransferMatrix_ForceDWORD = 0x7fffffff
    
    # https://learn.microsoft.com/zh-cn/windows/win32/medfound/media-foundation-events
    # mfobjects.h
    ctypedef enum MediaEventType:
        MEUnknown	= 0,
        MEError	= 1,
        MEExtendedType	= 2,
        MENonFatalError	= 3,
        MEGenericV1Anchor	= MENonFatalError,
        MESessionUnknown	= 100,
        MESessionTopologySet	= 101,
        MESessionTopologiesCleared	= 102,
        MESessionStarted	= 103,
        MESessionPaused	= 104,
        MESessionStopped	= 105,
        MESessionClosed	= 106,
        MESessionEnded	= 107,
        MESessionRateChanged	= 108,
        MESessionScrubSampleComplete	= 109,
        MESessionCapabilitiesChanged	= 110,
        MESessionTopologyStatus	= 111,
        MESessionNotifyPresentationTime	= 112,
        MENewPresentation	= 113,
        MELicenseAcquisitionStart	= 114,
        MELicenseAcquisitionCompleted	= 115,
        MEIndividualizationStart	= 116,
        MEIndividualizationCompleted	= 117,
        MEEnablerProgress	= 118,
        MEEnablerCompleted	= 119,
        MEPolicyError	= 120,
        MEPolicyReport	= 121,
        MEBufferingStarted	= 122,
        MEBufferingStopped	= 123,
        MEConnectStart	= 124,
        MEConnectEnd	= 125,
        MEReconnectStart	= 126,
        MEReconnectEnd	= 127,
        MERendererEvent	= 128,
        MESessionStreamSinkFormatChanged	= 129,
        MESessionV1Anchor	= MESessionStreamSinkFormatChanged,
        MESourceUnknown	= 200,
        MESourceStarted	= 201,
        MEStreamStarted	= 202,
        MESourceSeeked	= 203,
        MEStreamSeeked	= 204,
        MENewStream	= 205,
        MEUpdatedStream	= 206,
        MESourceStopped	= 207,
        MEStreamStopped	= 208,
        MESourcePaused	= 209,
        MEStreamPaused	= 210,
        MEEndOfPresentation	= 211,
        MEEndOfStream	= 212,
        MEMediaSample	= 213,
        MEStreamTick	= 214,
        MEStreamThinMode	= 215,
        MEStreamFormatChanged	= 216,
        MESourceRateChanged	= 217,
        MEEndOfPresentationSegment	= 218,
        MESourceCharacteristicsChanged	= 219,
        MESourceRateChangeRequested	= 220,
        MESourceMetadataChanged	= 221,
        MESequencerSourceTopologyUpdated	= 222,
        MESourceV1Anchor	= MESequencerSourceTopologyUpdated,
        MESinkUnknown	= 300,
        MEStreamSinkStarted	= 301,
        MEStreamSinkStopped	= 302,
        MEStreamSinkPaused	= 303,
        MEStreamSinkRateChanged	= 304,
        MEStreamSinkRequestSample	= 305,
        MEStreamSinkMarker	= 306,
        MEStreamSinkPrerolled	= 307,
        MEStreamSinkScrubSampleComplete	= 308,
        MEStreamSinkFormatChanged	= 309,
        MEStreamSinkDeviceChanged	= 310,
        MEQualityNotify	= 311,
        MESinkInvalidated	= 312,
        MEAudioSessionNameChanged	= 313,
        MEAudioSessionVolumeChanged	= 314,
        MEAudioSessionDeviceRemoved	= 315,
        MEAudioSessionServerShutdown	= 316,
        MEAudioSessionGroupingParamChanged	= 317,
        MEAudioSessionIconChanged	= 318,
        MEAudioSessionFormatChanged	= 319,
        MEAudioSessionDisconnected	= 320,
        MEAudioSessionExclusiveModeOverride	= 321,
        MESinkV1Anchor	= MEAudioSessionExclusiveModeOverride,
        MECaptureAudioSessionVolumeChanged	= 322,
        MECaptureAudioSessionDeviceRemoved	= 323,
        MECaptureAudioSessionFormatChanged	= 324,
        MECaptureAudioSessionDisconnected	= 325,
        MECaptureAudioSessionExclusiveModeOverride	= 326,
        MECaptureAudioSessionServerShutdown	= 327,
        MESinkV2Anchor	= MECaptureAudioSessionServerShutdown,
        METrustUnknown	= 400,
        MEPolicyChanged	= 401,
        MEContentProtectionMessage	= 402,
        MEPolicySet	= 403,
        METrustV1Anchor	= MEPolicySet,
        MEWMDRMLicenseBackupCompleted	= 500,
        MEWMDRMLicenseBackupProgress	= 501,
        MEWMDRMLicenseRestoreCompleted	= 502,
        MEWMDRMLicenseRestoreProgress	= 503,
        MEWMDRMLicenseAcquisitionCompleted	= 506,
        MEWMDRMIndividualizationCompleted	= 508,
        MEWMDRMIndividualizationProgress	= 513,
        MEWMDRMProximityCompleted	= 514,
        MEWMDRMLicenseStoreCleaned	= 515,
        MEWMDRMRevocationDownloadCompleted	= 516,
        MEWMDRMV1Anchor	= MEWMDRMRevocationDownloadCompleted,
        METransformUnknown	= 600,
        METransformNeedInput	= ( METransformUnknown + 1 ) ,
        METransformHaveOutput	= ( METransformNeedInput + 1 ) ,
        METransformDrainComplete	= ( METransformHaveOutput + 1 ) ,
        METransformMarker	= ( METransformDrainComplete + 1 ) ,
        METransformInputStreamStateChanged	= ( METransformMarker + 1 ) ,
        MEByteStreamCharacteristicsChanged	= 700,
        MEVideoCaptureDeviceRemoved	= 800,
        MEVideoCaptureDevicePreempted	= 801,
        MEStreamSinkFormatInvalidated	= 802,
        MEEncodingParameters	= 803,
        MEContentProtectionMetadata	= 900,
        MEDeviceThermalStateChanged	= 950,
        MEReservedMax	= 10000
