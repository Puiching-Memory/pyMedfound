import pyMedfound as mf

print(mf.__version__)

print(dir(mf))

print(mf.mfapi.MFAverageTimePerFrameToFrameRatePY(166667))

print(mf.winsdkver.get_WIN32_MAXVER())
print(mf.winsdkver.get_NTDDI_MAXVER())

print(mf.mfapi.MFllMulDivPY(1,2,2.5,4))