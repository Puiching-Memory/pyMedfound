
from pyMedfound.unknwn cimport IUnknown
from pyMedfound.windef cimport DWORD,LONGLONG,UINT32,ULONG_PTR
from pyMedfound.winerror cimport HRESULT
from pyMedfound.mfobjects cimport IMFAttributes,IMFMediaType,IMFSample,IMFCollection,IMFMediaEvent,IMFActivate
from pyMedfound.guiddef cimport GUID

# https://learn.microsoft.com/en-us/windows/win32/api/mftransform/
cdef extern from "mftransform.h":
    # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/ne-mftransform-_mft_drain_type
    # !Not supported!
    # ctypedef enum _MFT_DRAIN_TYPE:
    #     MFT_DRAIN_PRODUCE_TAILS = 0
    #     MFT_DRAIN_NO_TAILS = 0x1

    # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/ne-mftransform-_mft_input_data_buffer_flags
    ctypedef enum _MFT_INPUT_DATA_BUFFER_FLAGS:
        MFT_INPUT_DATA_BUFFER_PLACEHOLDER = 0xffffffff
        
    # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/ne-mftransform-_mft_input_status_flags
    ctypedef enum _MFT_INPUT_STATUS_FLAGS:
        MFT_INPUT_STATUS_ACCEPT_DATA = 0x1
    
    # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/ne-mftransform-_mft_input_stream_info_flags
    ctypedef enum _MFT_INPUT_STREAM_INFO_FLAGS:
        MFT_INPUT_STREAM_WHOLE_SAMPLES = 0x1
        MFT_INPUT_STREAM_SINGLE_SAMPLE_PER_BUFFER = 0x2
        MFT_INPUT_STREAM_FIXED_SAMPLE_SIZE = 0x4
        MFT_INPUT_STREAM_HOLDS_BUFFERS = 0x8
        MFT_INPUT_STREAM_DOES_NOT_ADDREF = 0x100
        MFT_INPUT_STREAM_REMOVABLE = 0x200
        MFT_INPUT_STREAM_OPTIONAL = 0x400
        MFT_INPUT_STREAM_PROCESSES_IN_PLACE = 0x800

    # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/ne-mftransform-_mft_output_data_buffer_flags
    ctypedef enum _MFT_OUTPUT_DATA_BUFFER_FLAGS:
        MFT_OUTPUT_DATA_BUFFER_INCOMPLETE = 0x1000000
        MFT_OUTPUT_DATA_BUFFER_FORMAT_CHANGE = 0x100
        MFT_OUTPUT_DATA_BUFFER_STREAM_END = 0x200
        MFT_OUTPUT_DATA_BUFFER_NO_SAMPLE = 0x300

    # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/ne-mftransform-_mft_output_status_flags
    ctypedef enum _MFT_OUTPUT_STATUS_FLAGS:
        MFT_OUTPUT_STATUS_SAMPLE_READY = 0x1

    # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/ne-mftransform-_mft_output_stream_info_flags
    ctypedef enum _MFT_OUTPUT_STREAM_INFO_FLAGS:
        MFT_OUTPUT_STREAM_WHOLE_SAMPLES = 0x1
        MFT_OUTPUT_STREAM_SINGLE_SAMPLE_PER_BUFFER = 0x2
        MFT_OUTPUT_STREAM_FIXED_SAMPLE_SIZE = 0x4
        MFT_OUTPUT_STREAM_DISCARDABLE = 0x8
        MFT_OUTPUT_STREAM_OPTIONAL = 0x10
        MFT_OUTPUT_STREAM_PROVIDES_SAMPLES = 0x100
        MFT_OUTPUT_STREAM_CAN_PROVIDE_SAMPLES = 0x200
        MFT_OUTPUT_STREAM_LAZY_READ = 0x400
        MFT_OUTPUT_STREAM_REMOVABLE = 0x800

    # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/ne-mftransform-_mft_process_output_flags
    ctypedef enum _MFT_PROCESS_OUTPUT_FLAGS:
        MFT_PROCESS_OUTPUT_DISCARD_WHEN_NO_BUFFER = 0x1
        MFT_PROCESS_OUTPUT_REGENERATE_LAST_OUTPUT = 0x2

    # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/ne-mftransform-_mft_process_output_status
    ctypedef enum _MFT_PROCESS_OUTPUT_STATUS:
        MFT_PROCESS_OUTPUT_STATUS_NEW_STREAMS = 0x100

    # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/ne-mftransform-_mft_set_type_flags
    ctypedef enum _MFT_SET_TYPE_FLAGS:
        MFT_SET_TYPE_TEST_ONLY = 0x1

    # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/nn-mftransform-imftransform
    cdef cppclass IMFTransform(IUnknown):
        # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/nf-mftransform-imftransform-addinputstreams
        HRESULT AddInputStreams(
            DWORD cStreams,     # [in]
            DWORD *adwStreamIDs # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/nf-mftransform-imftransform-deleteinputstream
        HRESULT DeleteInputStream(
            DWORD dwStreamID # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/nf-mftransform-imftransform-getattributes
        HRESULT GetAttributes(
            IMFAttributes **pAttributes # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/nf-mftransform-imftransform-getinputavailabletype
        HRESULT GetInputAvailableType(
            DWORD        dwInputStreamID, # [in]
            DWORD        dwTypeIndex,     # [in]
            IMFMediaType **ppType         # [out]
            )
        
        # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/nf-mftransform-imftransform-getinputcurrenttype
        HRESULT GetInputCurrentType(
            DWORD        dwInputStreamID, # [in]
            IMFMediaType **ppType         # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/nf-mftransform-imftransform-getinputstatus
        HRESULT GetInputStatus(
            DWORD dwInputStreamID, # [in]
            DWORD *pdwFlags        # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/nf-mftransform-imftransform-getinputstreamattributes
        HRESULT GetInputStreamAttributes(
            DWORD         dwInputStreamID, # [in]
            IMFAttributes **pAttributes    # [out]
            )
        
        # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/nf-mftransform-imftransform-getinputstreaminfo
        HRESULT GetInputStreamInfo(
            DWORD                 dwInputStreamID, # [in]
            MFT_INPUT_STREAM_INFO *pStreamInfo     # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/nf-mftransform-imftransform-getoutputavailabletype
        HRESULT GetOutputAvailableType(
            DWORD        dwOutputStreamID, # [in]
            DWORD        dwTypeIndex,      # [in]
            IMFMediaType **ppType          # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/nf-mftransform-imftransform-getoutputcurrenttype
        HRESULT GetOutputCurrentType(
            DWORD        dwOutputStreamID, # [in]
            IMFMediaType **ppType          # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/nf-mftransform-imftransform-getoutputstatus
        HRESULT GetOutputStatus(
            DWORD *pdwFlags # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/nf-mftransform-imftransform-getoutputstreamattributes
        HRESULT GetOutputStreamAttributes(
            DWORD         dwOutputStreamID, # [in]
            IMFAttributes **pAttributes     # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/nf-mftransform-imftransform-getoutputstreaminfo
        HRESULT GetOutputStreamInfo(
            DWORD                  dwOutputStreamID, # [in]
            MFT_OUTPUT_STREAM_INFO *pStreamInfo      # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/nf-mftransform-imftransform-getstreamcount
        HRESULT GetStreamCount(
            DWORD *pcInputStreams, # [out]
            DWORD *pcOutputStreams # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/nf-mftransform-imftransform-getstreamids
        HRESULT GetStreamIDs(
            DWORD dwInputIDArraySize,  # [in]
            DWORD *pdwInputIDs,        # [out]
            DWORD dwOutputIDArraySize, # [in]
            DWORD *pdwOutputIDs        # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/nf-mftransform-imftransform-getstreamlimits
        HRESULT GetStreamLimits(
            DWORD *pdwInputMinimum,  # [out]
            DWORD *pdwInputMaximum,  # [out]
            DWORD *pdwOutputMinimum, # [out]
            DWORD *pdwOutputMaximum  # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/nf-mftransform-imftransform-processevent
        HRESULT ProcessEvent(
            DWORD         dwInputStreamID, # [in]
            IMFMediaEvent *pEvent          # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/nf-mftransform-imftransform-processinput
        HRESULT ProcessInput(
            DWORD     dwInputStreamID, # [in]
            IMFSample *pSample,        # [in]
            DWORD     dwFlags          # [in]
            )
        
        # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/nf-mftransform-imftransform-processmessage
        HRESULT ProcessMessage(
            MFT_MESSAGE_TYPE eMessage, # [in]
            ULONG_PTR        ulParam   # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/nf-mftransform-imftransform-processoutput
        HRESULT ProcessOutput(
            DWORD                  dwFlags,            # [in]
            DWORD                  cOutputBufferCount, # [in]
            MFT_OUTPUT_DATA_BUFFER *pOutputSamples,    # [in, out]
            DWORD                  *pdwStatus          # [out]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/nf-mftransform-imftransform-setinputtype
        HRESULT SetInputType(
            DWORD        dwInputStreamID, # [in]
            IMFMediaType *pType,          # [in]
            DWORD        dwFlags          # [in]
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/nf-mftransform-imftransform-setoutputbounds
        HRESULT SetOutputBounds(
            LONGLONG hnsLowerBound,
            LONGLONG hnsUpperBound
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/nf-mftransform-imftransform-setoutputtype
        HRESULT SetOutputType(
            DWORD        dwOutputStreamID, # [in]
            IMFMediaType *pType,           # [in]
            DWORD        dwFlags           # [in]
            )

    # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/ne-mftransform-mf3dvideooutputtype
    ctypedef enum MF3DVideoOutputType:
        MF3DVideoOutputType_BaseView = 0
        MF3DVideoOutputType_Stereo = 1

    # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/nf-mftransform-mfcreatetransformactivate
    HRESULT MFCreateTransformActivate(
        IMFActivate **ppActivate # [out]
        )

    # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/ns-mftransform-mft_input_stream_info
    ctypedef struct MFT_INPUT_STREAM_INFO:
        LONGLONG hnsMaxLatency
        DWORD    dwFlags
        DWORD    cbSize
        DWORD    cbMaxLookahead
        DWORD    cbAlignment
    
    # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/ne-mftransform-mft_message_type
    ctypedef enum MFT_MESSAGE_TYPE:
        MFT_MESSAGE_COMMAND_FLUSH = 0
        MFT_MESSAGE_COMMAND_DRAIN = 0x1
        MFT_MESSAGE_SET_D3D_MANAGER = 0x2
        MFT_MESSAGE_DROP_SAMPLES = 0x3
        MFT_MESSAGE_COMMAND_TICK = 0x4
        MFT_MESSAGE_NOTIFY_BEGIN_STREAMING = 0x10000000
        MFT_MESSAGE_NOTIFY_END_STREAMING = 0x10000001
        MFT_MESSAGE_NOTIFY_END_OF_STREAM = 0x10000002
        MFT_MESSAGE_NOTIFY_START_OF_STREAM = 0x10000003
        MFT_MESSAGE_NOTIFY_RELEASE_RESOURCES = 0x10000004
        MFT_MESSAGE_NOTIFY_REACQUIRE_RESOURCES = 0x10000005
        MFT_MESSAGE_NOTIFY_EVENT = 0x10000006
        MFT_MESSAGE_COMMAND_SET_OUTPUT_STREAM_STATE = 0x10000007
        MFT_MESSAGE_COMMAND_FLUSH_OUTPUT_STREAM = 0x10000008
        MFT_MESSAGE_COMMAND_MARKER = 0x20000000

    # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/ns-mftransform-mft_output_data_buffer
    ctypedef struct MFT_OUTPUT_DATA_BUFFER:
        DWORD         dwStreamID
        IMFSample     *pSample
        DWORD         dwStatus
        IMFCollection *pEvents

    ctypedef MFT_OUTPUT_DATA_BUFFER* PMFT_OUTPUT_DATA_BUFFER

    # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/ns-mftransform-mft_output_stream_info
    ctypedef struct MFT_OUTPUT_STREAM_INFO:
        DWORD dwFlags
        DWORD cbSize
        DWORD cbAlignment

    # https://learn.microsoft.com/en-us/windows/win32/api/mftransform/ns-mftransform-stream_medium
    ctypedef struct STREAM_MEDIUM:
        GUID   gidMedium
        UINT32 unMediumInstance
    
    ctypedef STREAM_MEDIUM* PSTREAM_MEDIUM