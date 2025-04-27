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
static const char *ng0 = "C:/Users/rafam/Documents/Trabalho-1-Sistemas-Digitais/trabalho_1_sd/shift.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_3327597146_3212880686_p_0(char *t0)
{
    char t16[16];
    char t18[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned int t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t17;
    char *t19;
    char *t20;
    int t21;
    unsigned int t22;
    unsigned char t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;

LAB0:    xsi_set_current_line(34, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3400);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(35, ng0);
    t3 = (t0 + 1352U);
    t4 = *((char **)t3);
    t3 = (t0 + 5641);
    t6 = 1;
    if (4U == 4U)
        goto LAB8;

LAB9:    t6 = 0;

LAB10:    if (t6 != 0)
        goto LAB5;

LAB7:    t1 = (t0 + 1352U);
    t3 = *((char **)t1);
    t1 = (t0 + 5645);
    t2 = 1;
    if (4U == 4U)
        goto LAB18;

LAB19:    t2 = 0;

LAB20:    if (t2 != 0)
        goto LAB16;

LAB17:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 1192U);
    t3 = *((char **)t1);
    t1 = (t0 + 3496);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t3, 4U);
    xsi_driver_first_trans_fast(t1);

LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(37, ng0);
    t10 = (t0 + 1192U);
    t11 = *((char **)t10);
    t12 = (3 - 2);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t10 = (t11 + t14);
    t17 = ((IEEE_P_2592010699) + 4024);
    t19 = (t18 + 0U);
    t20 = (t19 + 0U);
    *((int *)t20) = 2;
    t20 = (t19 + 4U);
    *((int *)t20) = 0;
    t20 = (t19 + 8U);
    *((int *)t20) = -1;
    t21 = (0 - 2);
    t22 = (t21 * -1);
    t22 = (t22 + 1);
    t20 = (t19 + 12U);
    *((unsigned int *)t20) = t22;
    t15 = xsi_base_array_concat(t15, t16, t17, (char)97, t10, t18, (char)99, (unsigned char)2, (char)101);
    t22 = (3U + 1U);
    t23 = (4U != t22);
    if (t23 == 1)
        goto LAB14;

LAB15:    t20 = (t0 + 3496);
    t24 = (t20 + 56U);
    t25 = *((char **)t24);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    memcpy(t27, t15, 4U);
    xsi_driver_first_trans_fast(t20);
    goto LAB6;

LAB8:    t7 = 0;

LAB11:    if (t7 < 4U)
        goto LAB12;
    else
        goto LAB10;

LAB12:    t8 = (t4 + t7);
    t9 = (t3 + t7);
    if (*((unsigned char *)t8) != *((unsigned char *)t9))
        goto LAB9;

LAB13:    t7 = (t7 + 1);
    goto LAB11;

LAB14:    xsi_size_not_matching(4U, t22, 0);
    goto LAB15;

LAB16:    xsi_set_current_line(40, ng0);
    t9 = (t0 + 1192U);
    t10 = *((char **)t9);
    t12 = (3 - 3);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t9 = (t10 + t14);
    t15 = ((IEEE_P_2592010699) + 4024);
    t17 = (t18 + 0U);
    t19 = (t17 + 0U);
    *((int *)t19) = 3;
    t19 = (t17 + 4U);
    *((int *)t19) = 1;
    t19 = (t17 + 8U);
    *((int *)t19) = -1;
    t21 = (1 - 3);
    t22 = (t21 * -1);
    t22 = (t22 + 1);
    t19 = (t17 + 12U);
    *((unsigned int *)t19) = t22;
    t11 = xsi_base_array_concat(t11, t16, t15, (char)99, (unsigned char)2, (char)97, t9, t18, (char)101);
    t22 = (1U + 3U);
    t6 = (4U != t22);
    if (t6 == 1)
        goto LAB24;

LAB25:    t19 = (t0 + 3496);
    t20 = (t19 + 56U);
    t24 = *((char **)t20);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t11, 4U);
    xsi_driver_first_trans_fast(t19);
    goto LAB6;

LAB18:    t7 = 0;

LAB21:    if (t7 < 4U)
        goto LAB22;
    else
        goto LAB20;

LAB22:    t5 = (t3 + t7);
    t8 = (t1 + t7);
    if (*((unsigned char *)t5) != *((unsigned char *)t8))
        goto LAB19;

LAB23:    t7 = (t7 + 1);
    goto LAB21;

LAB24:    xsi_size_not_matching(4U, t22, 0);
    goto LAB25;

}

static void work_a_3327597146_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(49, ng0);

LAB3:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 3560);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 4U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3416);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3327597146_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3327597146_3212880686_p_0,(void *)work_a_3327597146_3212880686_p_1};
	xsi_register_didat("work_a_3327597146_3212880686", "isim/Main_tb_isim_beh.exe.sim/work/a_3327597146_3212880686.didat");
	xsi_register_executes(pe);
}
