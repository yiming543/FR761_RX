/**
  Generated Main Source File

  Company:
    Microchip Technology Inc.

  File Name:
    main.c

  Summary:
    This is the main file generated using PIC10 / PIC12 / PIC16 / PIC18 MCUs

  Description:
    This header file provides implementations for driver APIs for all modules
  selected in the GUI. Generation Information : Product Revision  :  PIC10 /
  PIC12 / PIC16 / PIC18 MCUs - 1.81.8 Device            :  PIC16F15213 Driver
  Version    :  2.00
*/

// 20251114 V01 CS:3EFF
// 輸出:HiBeam/DRL/POS

// 20251217 V02 CS:C5DF
// 修正接收功能.
// 新增LED OFF信號.

// 20260302 V03 CS:
// 將一些功能都做成獨立檔案方便之後修改
// 1. func_main.c: 主程式，包含軟體初始化和主迴圈
// 2. gpio.c/h: GPIO相關的函數和定義
// 3. F150.c/h: F150相關的函數和定義
// 4. 修正MCC產生的LIN驅動程式，一些資料轉換的警告。(明確的資料轉型)

//20260313 V04 CS:4AF9
//修正RX接收不穩定問題.
//修正為F150信號,外加ranger 2024 lock/unlock
//OFF mode:可以接收超車信號



#include "func_main.h"
#include "mcc_generated_files/LINDrivers/lin_slave.h"
#include "mcc_generated_files/mcc.h"

/*
                         Main application
 */
int main(void) {
  // initialize the device
  SYSTEM_Initialize();
  software_Initialize();

  // When using interrupts, you need to set the Global and Peripheral Interrupt
  // Enable bits Use the following macros to:

  // Enable the Global Interrupts
  INTERRUPT_GlobalInterruptEnable();

  // Enable the Peripheral Interrupts
  INTERRUPT_PeripheralInterruptEnable();

  while (1) {
    // Add your application code
    LIN_handler();
    func_main();
  }
  return 0;
}
/**
 End of File
*/