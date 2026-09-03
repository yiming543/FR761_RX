/*
 * File:   func_main.c
 * Author: T00904
 *
 * Created on 2026年2月23日, 下午 2:19
 */

// #include "mcc_generated_files/mcc.h"
#include "mcc_generated_files/pin_manager.h"
#include "mcc_generated_files/tmr0.h"
#include "mcc_generated_files/eusart1.h"

void Clear_No_Call_Warning(void);
void software_Initialize(void);
void func_main (void);

// 消除未呼叫警告 假裝有使用這些函數
void Clear_No_Call_Warning(void) {
  unsigned char i = 0;
  if (i == 1) {
    PIN_MANAGER_IOC();
  } else if (i == 2) {
    TMR0_StartTimer();
    TMR0_StopTimer();
    TMR0_ReadTimer();
    TMR0_WriteTimer(0);
    TMR0_Reload(0);
  } else if (i == 3) {
    EUSART1_is_tx_done();
    EUSART1_is_tx_ready();
  } else if (i == 4) {
  } else if (i == 5) {
  } else if (i == 6) {
  } else if (i == 7) {
  } else if (i == 8) {
  }
}

// 初始化軟體相關的變數和狀態
void software_Initialize(void) {
  Clear_No_Call_Warning();
}

void func_main (void) {
}