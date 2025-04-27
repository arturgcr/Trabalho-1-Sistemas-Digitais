/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/rafam/Documents/Trabalho-1-Sistemas-Digitais/trabalho_1_sd/absolute.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

char *ieee_p_2592010699_sub_1837678034_503743352(char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_2641645557_3212880686_p_0(char *t0)
{
    char t12[16];
    char t13[16];
    char t14[16];
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;

LAB0:    xsi_set_current_line(19, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = (3 - 3);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t7 == (unsigned char)2);
    if (t8 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(24, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 4672U);
    t9 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t13, t2, t1);
    t10 = (t0 + 4736);
    t15 = (t14 + 0U);
    t16 = (t15 + 0U);
    *((int *)t16) = 0;
    t16 = (t15 + 4U);
    *((int *)t16) = 3;
    t16 = (t15 + 8U);
    *((int *)t16) = 1;
    t3 = (3 - 0);
    t4 = (t3 * 1);
    t4 = (t4 + 1);
    t16 = (t15 + 12U);
    *((unsigned int *)t16) = t4;
    t16 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t12, t9, t13, t10, t14);
    t17 = (t0 + 1488U);
    t18 = *((char **)t17);
    t17 = (t18 + 0);
    t19 = (t12 + 12U);
    t4 = *((unsigned int *)t19);
    t5 = (1U * t4);
    memcpy(t17, t16, t5);

LAB3:    xsi_set_current_line(27, ng0);
    t1 = (t0 + 1488U);
    t2 = *((char **)t1);
    t1 = (t0 + 2872);
    t9 = (t1 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t15 = *((char **)t11);
    memcpy(t15, t2, 4U);
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 2792);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(21, ng0);
    t9 = (t0 + 1032U);
    t10 = *((char **)t9);
    t9 = (t0 + 1488U);
    t11 = *((char **)t9);
    t9 = (t11 + 0);
    memcpy(t9, t10, 4U);
    goto LAB3;

}


extern void work_a_2641645557_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2641645557_3212880686_p_0};
	xsi_register_didat("work_a_2641645557_3212880686", "isim/Main_tb_isim_beh.exe.sim/work/a_2641645557_3212880686.didat");
	xsi_register_executes(pe);
}
