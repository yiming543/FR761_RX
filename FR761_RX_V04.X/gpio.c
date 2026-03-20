/*
 * File:   gpio.c
 * Author: T00904
 * 車燈輸入腳位(輸入) DRL/POS/TURN/HIBEAM/LOBEAM/ACC
 * 車燈LED腳位(輸出)  DRL/POS/TURN/HIBEAM/LOBEAM/P2
 * 散熱風扇腳位(輸出) FAN_EN
 * LED顏色選擇腳位(輸入) COLORSELECT
 * LED顏色控制腳位(輸出) YL_en WL_en
 * LED顏色控制腳位(輸出) WL_en WL_en
 * Created on 2026年2月23日, 下午 3:18
 */

#include <xc.h>
#include "mcc_generated_files/pin_manager.h"
#include <stdbool.h>
// #include <stdint.h>
#include "gpio.h"


#define HiBeam_en1 HiBeam_enable_LAT
#define DRL_en DRL_enable_LAT
#define POS_en POS_enbale_LAT

enum COLOR { COLOR_YELLOW = 0, COLOR_WHITE = 1 };

#define ON 1
#define OFF 0

#define LAMP_L_SIDE 1

void HiBeam_ON(void) { HiBeam_en1 = ON; }
void HiBeam_OFF(void) { HiBeam_en1 = OFF; }
void DRL_ON(void) { DRL_en = ON; }
void DRL_OFF(void) { DRL_en = OFF; }
void POS_ON(void) { POS_en = ON; }
void POS_OFF(void) { POS_en = OFF; }
