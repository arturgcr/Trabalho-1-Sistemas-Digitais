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
static const char *ng0 = "C:/Users/rafam/Documents/Trabalho-1-Sistemas-Digitais/trabalho_1_sd/comparator.vhd";
extern char *IEEE_P_1242562249;

unsigned char ieee_p_1242562249_sub_2720006528_1035706684(char *, char *, char *, char *, char *);
unsigned char ieee_p_1242562249_sub_2720042465_1035706684(char *, char *, char *, char *, char *);


static void work_a_2683404259_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;

LAB0:    xsi_set_current_line(22, ng0);
    t1 = xsi_get_transient_memory(4U);
    memset(t1, 0, 4U);
    t2 = t1;
    memset(t2, (unsigned char)2, 4U);
    t3 = (t0 + 1648U);
    t4 = *((char **)t3);
    t3 = (t4 + 0);
    memcpy(t3, t1, 4U);
    xsi_set_current_line(24, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 4924U);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t3 = (t0 + 4940U);
    t5 = ieee_p_1242562249_sub_2720006528_1035706684(IEEE_P_1242562249, t2, t1, t4, t3);
    if (t5 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 4924U);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t3 = (t0 + 4940U);
    t5 = ieee_p_1242562249_sub_2720042465_1035706684(IEEE_P_1242562249, t2, t1, t4, t3);
    if (t5 != 0)
        goto LAB5;

LAB6:    xsi_set_current_line(29, ng0);
    t1 = (t0 + 1648U);
    t2 = *((char **)t1);
    t8 = (2 - 3);
    t9 = (t8 * -1);
    t10 = (1U * t9);
    t11 = (0 + t10);
    t1 = (t2 + t11);
    *((unsigned char *)t1) = (unsigned char)3;

LAB3:    xsi_set_current_line(32, ng0);
    t1 = (t0 + 1648U);
    t2 = *((char **)t1);
    t1 = (t0 + 3032);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 4U);
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 2952);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(25, ng0);
    t6 = (t0 + 1648U);
    t7 = *((char **)t6);
    t8 = (0 - 3);
    t9 = (t8 * -1);
    t10 = (1U * t9);
    t11 = (0 + t10);
    t6 = (t7 + t11);
    *((unsigned char *)t6) = (unsigned char)3;
    goto LAB3;

LAB5:    xsi_set_current_line(27, ng0);
    t6 = (t0 + 1648U);
    t7 = *((char **)t6);
    t8 = (1 - 3);
    t9 = (t8 * -1);
    t10 = (1U * t9);
    t11 = (0 + t10);
    t6 = (t7 + t11);
    *((unsigned char *)t6) = (unsigned char)3;
    goto LAB3;

}


extern void work_a_2683404259_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2683404259_3212880686_p_0};
	xsi_register_didat("work_a_2683404259_3212880686", "isim/Main_tb_isim_beh.exe.sim/work/a_2683404259_3212880686.didat");
	xsi_register_executes(pe);
}
