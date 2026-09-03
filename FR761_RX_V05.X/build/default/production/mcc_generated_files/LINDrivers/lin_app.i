# 1 "mcc_generated_files/LINDrivers/lin_app.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 295 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Users/t00904/.mchp_packs/Microchip/PIC16F1xxxx_DFP/1.5.133/xc8\\pic\\include/language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "mcc_generated_files/LINDrivers/lin_app.c" 2
# 41 "mcc_generated_files/LINDrivers/lin_app.c"
# 1 "mcc_generated_files/LINDrivers/lin_app.h" 1
# 45 "mcc_generated_files/LINDrivers/lin_app.h"
# 1 "mcc_generated_files/LINDrivers/lin_slave.h" 1
# 42 "mcc_generated_files/LINDrivers/lin_slave.h"
# 1 "C:\\Program Files\\Microchip\\xc8\\v3.10\\pic\\include\\c99/stdint.h" 1 3



# 1 "C:\\Program Files\\Microchip\\xc8\\v3.10\\pic\\include\\c99/musl_xc8.h" 1 3
# 5 "C:\\Program Files\\Microchip\\xc8\\v3.10\\pic\\include\\c99/stdint.h" 2 3
# 26 "C:\\Program Files\\Microchip\\xc8\\v3.10\\pic\\include\\c99/stdint.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v3.10\\pic\\include\\c99/bits/alltypes.h" 1 3
# 133 "C:\\Program Files\\Microchip\\xc8\\v3.10\\pic\\include\\c99/bits/alltypes.h" 3
typedef unsigned short uintptr_t;
# 148 "C:\\Program Files\\Microchip\\xc8\\v3.10\\pic\\include\\c99/bits/alltypes.h" 3
typedef short intptr_t;
# 164 "C:\\Program Files\\Microchip\\xc8\\v3.10\\pic\\include\\c99/bits/alltypes.h" 3
typedef signed char int8_t;




typedef short int16_t;




typedef __int24 int24_t;




typedef long int32_t;





typedef long long int64_t;
# 194 "C:\\Program Files\\Microchip\\xc8\\v3.10\\pic\\include\\c99/bits/alltypes.h" 3
typedef long long intmax_t;





typedef unsigned char uint8_t;




typedef unsigned short uint16_t;




typedef __uint24 uint24_t;




typedef unsigned long uint32_t;





typedef unsigned long long uint64_t;
# 235 "C:\\Program Files\\Microchip\\xc8\\v3.10\\pic\\include\\c99/bits/alltypes.h" 3
typedef unsigned long long uintmax_t;
# 27 "C:\\Program Files\\Microchip\\xc8\\v3.10\\pic\\include\\c99/stdint.h" 2 3

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
# 148 "C:\\Program Files\\Microchip\\xc8\\v3.10\\pic\\include\\c99/stdint.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v3.10\\pic\\include\\c99/bits/stdint.h" 1 3
typedef int16_t int_fast16_t;
typedef int32_t int_fast32_t;
typedef uint16_t uint_fast16_t;
typedef uint32_t uint_fast32_t;
# 149 "C:\\Program Files\\Microchip\\xc8\\v3.10\\pic\\include\\c99/stdint.h" 2 3
# 43 "mcc_generated_files/LINDrivers/lin_slave.h" 2
# 1 "C:\\Program Files\\Microchip\\xc8\\v3.10\\pic\\include\\c99/stdbool.h" 1 3
# 44 "mcc_generated_files/LINDrivers/lin_slave.h" 2


typedef enum {
    LIN_RX_IDLE,
    LIN_RX_BREAK,
    LIN_RX_SYNC,
    LIN_RX_PID,
    LIN_RX_DATA,
    LIN_RX_CHECKSUM,
    LIN_RX_TX_DATA,
    LIN_RX_RDY,
    LIN_RX_ERROR,
    LIN_RX_WAIT
}lin_rx_state_t;

typedef enum {
    TRANSMIT,
    RECEIVE,
    ERROR
}lin_packet_type_t;

typedef enum {
    CMD,
    TYPE,
    LENGTH
}lin_sch_param_t;

typedef union {
    struct {
        uint8_t PID;
        uint8_t data[8];
        uint8_t checksum;
        lin_packet_type_t type;

        uint8_t length;
    };
    uint8_t rawPacket[13];
}lin_packet_t;

typedef struct {
    uint8_t cmd;
    lin_packet_type_t type;
    uint8_t length;
    uint8_t* data;
}lin_rx_cmd_t;

typedef union {
    struct {
        unsigned ID0: 1;
        unsigned ID1: 1;
        unsigned ID2: 1;
        unsigned ID3: 1;
        unsigned ID4: 1;
        unsigned ID5: 1;
        unsigned P0: 1;
        unsigned P1: 1;
    };
    uint8_t rawPID;
}lin_pid_t;


void LIN_init(uint8_t tableLength, const lin_rx_cmd_t* const command, void (*processData)(void));

void LIN_queuePacket(uint8_t cmd);

void LIN_sendPacket(uint8_t length, uint8_t pid, uint8_t* data);

uint8_t LIN_getPacket(uint8_t* data);

uint8_t LIN_getFromTable(uint8_t cmd, lin_sch_param_t param);

lin_rx_state_t LIN_handler(void);

_Bool LIN_checkPID(uint8_t pid);

uint8_t LIN_getChecksum(uint8_t length, uint8_t pid, uint8_t* data);

uint8_t LIN_calcParity(uint8_t CMD);


void LIN_startTimer(uint8_t timeout);

void LIN_timerHandler(void);

void LIN_setTimerHandler(void);

void LIN_stopTimer(void);

void LIN_enableRx(void);

void LIN_disableRx(void);

_Bool LIN_breakCheck(void);
# 46 "mcc_generated_files/LINDrivers/lin_app.h" 2


uint8_t SIGNAL_Data[8];

typedef enum {
    SIGNAL = 0x01
}lin_cmd_t;

const lin_rx_cmd_t scheduleTable[] = {

    {SIGNAL, RECEIVE, 8, SIGNAL_Data }
};


void LIN_Slave_Initialize(void);

void processLIN(void);
# 42 "mcc_generated_files/LINDrivers/lin_app.c" 2
# 1 "mcc_generated_files/LINDrivers/../../F150.h" 1
# 13 "mcc_generated_files/LINDrivers/../../F150.h"
extern uint8_t tempRxData[8];
extern void func_F150(void);
# 43 "mcc_generated_files/LINDrivers/lin_app.c" 2


void LIN_Slave_Initialize(void) {
  LIN_init((sizeof(scheduleTable)/sizeof(lin_rx_cmd_t)), scheduleTable, processLIN);
}

void processLIN(void) {

  uint8_t cmd;

  cmd = LIN_getPacket(tempRxData);
  if (cmd != SIGNAL)
  {
    return;
  }

  func_F150();

}
