# 1 "D:\\yiming\\00work\\FR761_RX_V02.X\\F150.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 285 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "c:\\PROGRA~1\\MICROC~1\\xc8\\v3.00\\pic\\include/language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "D:\\yiming\\00work\\FR761_RX_V02.X\\F150.c" 2








# 1 "D:\\yiming\\00work\\FR761_RX_V02.X/F150.h" 1
# 11 "D:\\yiming\\00work\\FR761_RX_V02.X/F150.h"
# 1 "c:\\PROGRA~1\\MICROC~1\\xc8\\v3.00\\pic\\include\\c99/stdint.h" 1 3



# 1 "c:\\PROGRA~1\\MICROC~1\\xc8\\v3.00\\pic\\include\\c99/musl_xc8.h" 1 3
# 5 "c:\\PROGRA~1\\MICROC~1\\xc8\\v3.00\\pic\\include\\c99/stdint.h" 2 3
# 26 "c:\\PROGRA~1\\MICROC~1\\xc8\\v3.00\\pic\\include\\c99/stdint.h" 3
# 1 "c:\\PROGRA~1\\MICROC~1\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 1 3
# 133 "c:\\PROGRA~1\\MICROC~1\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef unsigned short uintptr_t;
# 148 "c:\\PROGRA~1\\MICROC~1\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef short intptr_t;
# 164 "c:\\PROGRA~1\\MICROC~1\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef signed char int8_t;




typedef short int16_t;




typedef __int24 int24_t;




typedef long int32_t;





typedef long long int64_t;
# 194 "c:\\PROGRA~1\\MICROC~1\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef long long intmax_t;





typedef unsigned char uint8_t;




typedef unsigned short uint16_t;




typedef __uint24 uint24_t;




typedef unsigned long uint32_t;





typedef unsigned long long uint64_t;
# 235 "c:\\PROGRA~1\\MICROC~1\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef unsigned long long uintmax_t;
# 27 "c:\\PROGRA~1\\MICROC~1\\xc8\\v3.00\\pic\\include\\c99/stdint.h" 2 3

typedef int8_t int_fast8_t;

typedef int64_t int_fast64_t;


typedef int8_t int_least8_t;
typedef int16_t int_least16_t;

typedef int24_t int_least24_t;
typedef int24_t int_fast24_t;

typedef int32_t int_least32_t;

typedef int64_t int_least64_t;


typedef uint8_t uint_fast8_t;

typedef uint64_t uint_fast64_t;


typedef uint8_t uint_least8_t;
typedef uint16_t uint_least16_t;

typedef uint24_t uint_least24_t;
typedef uint24_t uint_fast24_t;

typedef uint32_t uint_least32_t;

typedef uint64_t uint_least64_t;
# 148 "c:\\PROGRA~1\\MICROC~1\\xc8\\v3.00\\pic\\include\\c99/stdint.h" 3
# 1 "c:\\PROGRA~1\\MICROC~1\\xc8\\v3.00\\pic\\include\\c99/bits/stdint.h" 1 3
typedef int16_t int_fast16_t;
typedef int32_t int_fast32_t;
typedef uint16_t uint_fast16_t;
typedef uint32_t uint_fast32_t;
# 149 "c:\\PROGRA~1\\MICROC~1\\xc8\\v3.00\\pic\\include\\c99/stdint.h" 2 3
# 12 "D:\\yiming\\00work\\FR761_RX_V02.X/F150.h" 2

typedef union {
  struct {
    _Bool fDRL : 1;
    _Bool fPOS : 1;
    _Bool fLOBEAM : 1;
    _Bool fHIBEAM : 1;
    _Bool LoBeam : 1;
    _Bool fLEFT : 1;
    _Bool fRIGHT : 1;
    _Bool b7 : 1;
  };
  uint8_t all_flags;
} LampFlags_t;

typedef union {
    struct {
        unsigned mode: 3;
        unsigned OverTaking: 1;
        unsigned TurnLeft: 1;
        unsigned TurnRight: 1;
        unsigned HighBeam: 1;
    };
    uint8_t all_flags;
}LampState_t;

typedef enum {
    eOFF_DRL = 0,
    ePOS = 1,
    eAUTO_DRL = 2,
    eAUTO_LOBEAM_POS = 3,
    eLOBEAM = 4
}LampMode_t;
# 10 "D:\\yiming\\00work\\FR761_RX_V02.X\\F150.c" 2

