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

typedef union {
  struct {
    unsigned fDRL : 1;
    unsigned fPOS : 1;
    unsigned fLOBEAM : 1;
    unsigned fHIBEAM : 1;
    unsigned fLEFT : 1;
    unsigned fRIGHT : 1;
    unsigned reserved : 2; // 保留位
  };
  uint8_t all_flags; // 可以用來一次性訪問所有旗標
} LampFlags_t;

typedef union {
  struct {
    unsigned mode : 3;
    unsigned OverTaking : 1; // 超車
    unsigned TurnLeft : 1;   // 左方向
    unsigned TurnRight : 1;  // 右方向
    unsigned HighBeam : 1;   // 遠燈
    unsigned reserved : 1;   // 保留位
  };
  uint8_t all_flags; // 可以用來一次性訪問所有旗標
} LampState_t;

typedef enum {
  eOFF_DRL = 0,
  ePOS = 1,
  eAUTO_DRL = 2,
  eAUTO_LOBEAM_POS = 3,
  eLOBEAM = 4,
  eUndefined
} LampMode_t;

#define MODE_OFF_F150 0x11
#define MODE_OFF_DRL_24 0x51
#define MODE_POS_24 0x12
// #define MODE_POS_24_2 0x14
#define MODE_AUTO_NIGHT_24 0x94
// #define MODE_AUTO_NIGHT_24_2 0xAC
#define MODE_LOW_BEAM_24 0x13
// ford ranger 2023
#define MODE_OFF_DRL 0x49
#define MODE_POS 0x0A
#define MODE_AUTO_DAY 0x4C
#define MODE_AUTO_NIGHT 0x8C
#define MODE_LOW_BEAM 0x0B
// 超車
#define mOVER_TAKING 0B10000000 // 0x80 data[1] MASK
// 遠燈
#define mHIBEAM 0B01000000 // 0x40 data[1]
// 遠燈+超車
#define mHIBEAM2 0B11000000 // 0xC0 data[1]
// 左方向
#define mLEFT_TURN_SIGNAL 0B00010000 // 0x10 data[1]
// 右方向
#define mRIGHT_TURN_SIGNAL 0B00100000 // 0x20 data[1]
// 晝行
#define mDRL 0B01000000 // 0x40 data[2]
// 行車
#define mPOS 0B00100000 // 0x20 data[5]
// 近燈
#define mLOBEAM 0B00001000 // 0x08 data[4]

LampState_t lampState = {0};
LampFlags_t lampFlags = {0};
uint8_t tempRxData[8];

void func_F150(void) {

  // Lamp mode judgment
  if (tempRxData[0] == 0x24) {
    switch (tempRxData[2]) {
      case MODE_OFF_F150:
      lampState.mode = eUndefined;
      lampFlags.all_flags = 0;
      break;
    case MODE_OFF_DRL:
    case MODE_OFF_DRL_24:
      lampState.mode = eOFF_DRL;
      lampFlags.fDRL = 1;
      lampFlags.fPOS = 0;
      break;
    case MODE_POS:
    case MODE_POS_24:
      lampState.mode = ePOS;
      lampFlags.fPOS = 1;
      lampFlags.fDRL = 0;
      break;
    case MODE_AUTO_DAY:
      lampState.mode = eAUTO_DRL;
      lampFlags.fDRL = 1;
      lampFlags.fPOS = 0;
      break;
    case MODE_AUTO_NIGHT:
    case MODE_AUTO_NIGHT_24:
      lampState.mode = eAUTO_LOBEAM_POS;
      lampFlags.fLOBEAM = 1;
      lampFlags.fPOS = 1;
      lampFlags.fDRL = 0;
      break;
    case MODE_LOW_BEAM:
    case MODE_LOW_BEAM_24:
      lampState.mode = eLOBEAM;
      lampFlags.fLOBEAM = 1;
      lampFlags.fPOS = 1;
      lampFlags.fDRL = 0;
      break;
    default:
      lampState.mode = eUndefined;
      break;
    }

    // 遠燈/超車
    if (lampState.mode != eUndefined) {
      if ((tempRxData[1] & mHIBEAM2) != 0) {
        lampFlags.fHIBEAM = 1;
      } else {
        lampFlags.fHIBEAM = 0;
      }
    }

  } else if (tempRxData[0] == 0x01) { // LED OFF
    if (tempRxData[2] == 0x0C) {
      if ((tempRxData[4] & 0B00000100) == 0x04) {
        lampState.all_flags = 0;
        lampFlags.all_flags = 0;
      }
    }
  } else if (tempRxData[0] == 0x11) { // LED OFF
    if (tempRxData[2] == 0x0C) {
      if ((tempRxData[4] & 0B00000111) == 0x07) {
        lampState.all_flags = 0;
        lampFlags.all_flags = 0;
      }
    }
  }

  // Set lamp output
  // DRL
  if (lampFlags.fDRL) {
    DRL_ON();
  } else {
    DRL_OFF();
  }
  // POS
  if (lampFlags.fPOS) {
    POS_ON();
  } else {
    POS_OFF();
  }

  // HIBEAM
  if (lampFlags.fHIBEAM) {
    HiBeam_ON();
  } else {
    HiBeam_OFF();
  }
}
