import pyMedfound as mf

print(mf.__version__)

print(dir(mf))

print(mf.mfapi.call_MFAverageTimePerFrameToFrameRate(166667))