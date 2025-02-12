from libc.stdint cimport uint32_t,int64_t,uint8_t
from cython.parallel import prange
import numpy as np
cimport numpy as cnp

from pyMedfound.Med cimport BYTE, DWORD, INT32, INT64, LONG, LONGLONG, UINT32, UINT64, ULONG, ULONGLONG, WORD