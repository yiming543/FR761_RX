/*
 * File:   F150.c
 * Author: T00904
 *
 * Created on 2026年3月2日, 上午 9:42
 */

#include "xc.h"

#include "gpio.h"
#include <stdbool.h>
#include <stdint.h>

typedef enum
{
  eOffDayP = 0x09,
  eOffDayN = 0x29,
  eParkDayP = 0x0A,
  eParkDayN = 0x2A,
  eLobeamDayP = 0x0B,
  eLobeamDayN = 0x2B,
  eAutoDayP = 0x0C,
  eAutoDayN = 0x4C,
  eOffNightP = 0x11,
  eOffNightN = 0x31,
  eParkNightP = 0x12,
  eParkNightN = 0x32,
  eLobeamNightP = 0x13,
  eLobeamNightN = 0x33,
  eAutoNightP = 0x94,
  eAutoNightN = 0xB4
} LampControl_t;

// 遠燈bit6,超車bit7
#define mHIBEAM 0B11000000 // 0x40 data[1]
// 左方向
#define mTURN_LEFT 0B00010000 // 0x10 data[1]
// 右方向
#define mTURN_RIGHT 0B00100000 // 0x20 data[1]

uint8_t tempRxData[8];

void func_F150(void)
{
  if (tempRxData[0] == 0x24)
  {
    switch (tempRxData[2])
    {
    case eOffDayP:
      // POS OFF
      DRL_POS_OFF();
      break;

    case eOffDayN:
      // POS OFF
      DRL_POS_OFF();
      break;

    case eOffNightP:
      // POS OFF
      DRL_POS_OFF();
      break;

    case eOffNightN:
      // POS OFF
      DRL_POS_OFF();
      break;

    case eParkDayP:
      // POS ON
      POS_ON();
      break;

    case eParkDayN:
      // POS ON
      POS_ON();
      break;

    case eParkNightP:
      // POS ON
      POS_ON();
      break;

    case eParkNightN:
      // POS ON
      POS_ON();
      break; 

    case eAutoDayP:
      // POS OFF
      DRL_POS_OFF();
      break;

    case eAutoDayN:
      // DRL ON
      DRL_ON();
      break;

    case eAutoNightP:
      // POS ON
      POS_ON();
      break;

    case eAutoNightN:
      // POS ON
      POS_ON();
      break;
      
case eLobeamDayP:
      // POS ON
      POS_ON();
      break;

    case eLobeamDayN:
      // POS ON
      POS_ON();
      break;

    case eLobeamNightP:
      // POS ON
      POS_ON();
      break;

    case eLobeamNightN:
      // POS ON
      POS_ON();
      break;

    default:
      // 無法識別的資料，維持原本的狀態
      break;
    }

    if (tempRxData[1] & mHIBEAM)
    {
      HIBEAM_ON();
    }
    else
    {
      HIBEAM_OFF();
    }
  }
  else if ((tempRxData[0] == 0x31) && (tempRxData[1] == 0x08))
  { // ALL LED OFF
    DRL_POS_OFF();
    HIBEAM_OFF();
  }
  else if ((tempRxData[0] == 0x31) && (tempRxData[1] == 0x0A))
  { // Ignition OFF，維持原本的狀態
  }
  else
  {
    // 無法識別的資料，維持原本的狀態
  }
}
