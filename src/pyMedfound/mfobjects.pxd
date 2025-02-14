from pyMedfound.WinDef cimport BYTE,DWORD,LONG,BOOL,WORD,SIZE,LONGLONG
from pyMedfound.Winerror cimport HRESULT
from pyMedfound.guiddef cimport GUID

# https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/
cdef extern from "mfobjects.h":
    
    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nn-mfobjects-imf2dbuffer
    ctypedef struct IMF2DBuffer:

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imf2dbuffer-contiguouscopyfrom
        HRESULT ContiguousCopyFrom(
            const BYTE *pbSrcBuffer,
            DWORD      cbSrcBuffer
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imf2dbuffer-contiguouscopyto
        HRESULT ContiguousCopyTo(
            BYTE  *pbDestBuffer,
            DWORD cbDestBuffer
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imf2dbuffer-getcontiguouslength
        HRESULT GetContiguousLength(
            DWORD *pcbLength
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imf2dbuffer-getscanline0andpitch
        HRESULT GetScanline0AndPitch(
            BYTE **pbScanline0,
            LONG *plPitch
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imf2dbuffer-iscontiguousformat
        HRESULT IsContiguousFormat(
            BOOL *pfIsContiguous
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imf2dbuffer-lock2d
        HRESULT Lock2D(
            BYTE **ppbScanline0,
            LONG *plPitch
            )

        # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/nf-mfobjects-imf2dbuffer-unlock2d
        HRESULT Unlock2D()

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ne-mfobjects-mf_attribute_serialize_options
    ctypedef enum MF_ATTRIBUTE_SERIALIZE_OPTIONS:
        MF_ATTRIBUTE_SERIALIZE_UNKNOWN_BYREF = 0x1

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ne-mfobjects-mf_attribute_type
    # ctypedef enum MF_ATTRIBUTE_TYPE:
    #     MF_ATTRIBUTE_UINT32 = VT_UI4
    #     MF_ATTRIBUTE_UINT64 = VT_UI8
    #     MF_ATTRIBUTE_DOUBLE = VT_R8
    #     MF_ATTRIBUTE_GUID = VT_CLSID
    #     MF_ATTRIBUTE_STRING = VT_LPWSTR
    #     MF_ATTRIBUTE_BLOB
    #     MF_ATTRIBUTE_IUNKNOWN = VT_UNKNOWN

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

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ns-mfobjects-mfvideoformat
    # ctypedef struct MFVIDEOFORMAT:
    #     DWORD                 dwSize
    #     MFVideoInfo           videoInfo
    #     GUID                  guidFormat
    #     MFVideoCompressedInfo compressedInfo
    #     MFVideoSurfaceInfo    surfaceInfo

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ns-mfobjects-mfvideoinfo
    # ctypedef struct MFVideoInfo:
    #     DWORD                    dwWidth
    #     DWORD                    dwHeight
    #     MFRatio                  PixelAspectRatio
    #     MFVideoChromaSubsampling SourceChromaSubsampling
    #     MFVideoInterlaceMode     InterlaceMode
    #     MFVideoTransferFunction  TransferFunction
    #     MFVideoPrimaries         ColorPrimaries
    #     MFVideoTransferMatrix    TransferMatrix
    #     MFVideoLighting          SourceLighting
    #     MFRatio                  FramesPerSecond
    #     MFNominalRange           NominalRange
    #     MFVideoArea              GeometricAperture
    #     MFVideoArea              MinimumDisplayAperture
    #     MFVideoArea              PanScanAperture
    #     unsigned __int64         VideoFlags

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

    # https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ns-mfobjects-mfvideosurfaceinfo
    ctypedef struct MFVideoSurfaceInfo:
        DWORD          Format
        DWORD          PaletteEntries
        MFPaletteEntry Palette[1]

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