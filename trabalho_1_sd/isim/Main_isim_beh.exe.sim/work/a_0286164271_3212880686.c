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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ise/VirtualBox/Trabalho-1-Sistemas-Digitais/trabalho_1_sd/Main.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_2423793367844140314_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_3525738511873186323_1035706684(char *, char *, char *, char *, char *, char *);
unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_0286164271_3212880686_p_0(char *t0)
{
    char t11[16];
    char t12[16];
    char t13[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 1312U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 4520);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(48, ng0);
    t3 = (t0 + 2312U);
    t4 = *((char **)t3);
    t5 = *((int *)t4);
    if (t5 == 0)
        goto LAB6;

LAB9:    if (t5 == 1)
        goto LAB7;

LAB10:
LAB8:    xsi_set_current_line(64, ng0);

LAB5:    goto LAB3;

LAB6:    xsi_set_current_line(51, ng0);
    t3 = (t0 + 1032U);
    t6 = *((char **)t3);
    t3 = (t0 + 4632);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t6, 4U);
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(52, ng0);
    t1 = (t0 + 4696);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = 1;
    xsi_driver_first_trans_fast(t1);
    goto LAB5;

LAB7:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 1192U);
    t3 = *((char **)t1);
    t1 = (t0 + 4760);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t3, 4U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(57, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t1 = (t0 + 2608U);
    t4 = *((char **)t1);
    t1 = (t4 + 0);
    memcpy(t1, t3, 4U);
    xsi_set_current_line(58, ng0);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t1 = (t0 + 2728U);
    t4 = *((char **)t1);
    t1 = (t4 + 0);
    memcpy(t1, t3, 4U);
    xsi_set_current_line(59, ng0);
    t1 = (t0 + 2608U);
    t3 = *((char **)t1);
    t1 = (t0 + 7688U);
    t4 = ieee_p_1242562249_sub_2423793367844140314_1035706684(IEEE_P_1242562249, t12, t3, t1, 5);
    t6 = (t0 + 2728U);
    t7 = *((char **)t6);
    t6 = (t0 + 7704U);
    t8 = ieee_p_1242562249_sub_2423793367844140314_1035706684(IEEE_P_1242562249, t13, t7, t6, 5);
    t9 = ieee_p_1242562249_sub_3525738511873186323_1035706684(IEEE_P_1242562249, t11, t4, t12, t8, t13);
    t10 = (t11 + 12U);
    t14 = *((unsigned int *)t10);
    t15 = (1U * t14);
    t2 = (5U != t15);
    if (t2 == 1)
        goto LAB12;

LAB13:    t16 = (t0 + 4824);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t9, 5U);
    xsi_driver_first_trans_fast(t16);
    xsi_set_current_line(60, ng0);
    t1 = (t0 + 4696);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = 2;
    xsi_driver_first_trans_fast(t1);
    goto LAB5;

LAB11:;
LAB12:    xsi_size_not_matching(5U, t15, 0);
    goto LAB13;

}

static void work_a_0286164271_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(71, ng0);

LAB3:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t3 = (4 - 3);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 4888);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 4U);
    xsi_driver_first_trans_fast_port(t6);

LAB2:    t11 = (t0 + 4536);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0286164271_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(72, ng0);

LAB3:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t3 = (4 - 4);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t0 + 4952);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t7;
    xsi_driver_first_trans_fast_port(t8);

LAB2:    t13 = (t0 + 4552);
    *((int *)t13) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0286164271_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0286164271_3212880686_p_0,(void *)work_a_0286164271_3212880686_p_1,(void *)work_a_0286164271_3212880686_p_2};
	xsi_register_didat("work_a_0286164271_3212880686", "isim/Main_isim_beh.exe.sim/work/a_0286164271_3212880686.didat");
	xsi_register_executes(pe);
}
