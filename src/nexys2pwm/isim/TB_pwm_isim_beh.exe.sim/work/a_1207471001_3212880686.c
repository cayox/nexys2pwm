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
static const char *ng0 = "/home/xps/Documents/Github/nexys2pwm/src/nexys2pwm/pwmDriver/pwmDriver.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_3620187407_sub_1366267000076357978_3965413181(char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_2255506239096166994_3965413181(char *, char *, char *, char *, int );
unsigned char ieee_p_3620187407_sub_970026082007865855_3965413181(char *, char *, char *, int );


static void work_a_1207471001_3212880686_p_0(char *t0)
{
    char t13[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    int t5;
    int t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t14;
    unsigned int t15;

LAB0:    xsi_set_current_line(34, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3384);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(35, ng0);
    t3 = (t0 + 1672U);
    t4 = *((char **)t3);
    t5 = *((int *)t4);
    t6 = (t5 + 1);
    t3 = (t0 + 3464);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((int *)t10) = t6;
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(37, ng0);
    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t5 = *((int *)t3);
    t6 = (2 - 1);
    t2 = (t5 == t6);
    if (t2 != 0)
        goto LAB5;

LAB7:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(38, ng0);
    t1 = (t0 + 3464);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((int *)t9) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(40, ng0);
    t1 = (t0 + 1192U);
    t3 = *((char **)t1);
    t1 = (t0 + 5800U);
    t5 = xsi_vhdl_pow(2, 8);
    t6 = (t5 - 1);
    t2 = ieee_p_3620187407_sub_970026082007865855_3965413181(IEEE_P_3620187407, t3, t1, t6);
    if (t2 != 0)
        goto LAB8;

LAB10:    t1 = (t0 + 1512U);
    t3 = *((char **)t1);
    t1 = (t0 + 5816U);
    t4 = (t0 + 1192U);
    t7 = *((char **)t4);
    t4 = (t0 + 5800U);
    t2 = ieee_p_3620187407_sub_1366267000076357978_3965413181(IEEE_P_3620187407, t3, t1, t7, t4);
    if (t2 != 0)
        goto LAB11;

LAB12:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 3528);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB9:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 1512U);
    t3 = *((char **)t1);
    t1 = (t0 + 5816U);
    t4 = ieee_p_3620187407_sub_2255506239096166994_3965413181(IEEE_P_3620187407, t13, t3, t1, 1);
    t7 = (t13 + 12U);
    t14 = *((unsigned int *)t7);
    t15 = (1U * t14);
    t2 = (8U != t15);
    if (t2 == 1)
        goto LAB13;

LAB14:    t8 = (t0 + 3592);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t4, 8U);
    xsi_driver_first_trans_fast(t8);
    goto LAB6;

LAB8:    xsi_set_current_line(41, ng0);
    t4 = (t0 + 3528);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t4);
    goto LAB9;

LAB11:    xsi_set_current_line(43, ng0);
    t8 = (t0 + 3528);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t8);
    goto LAB9;

LAB13:    xsi_size_not_matching(8U, t15, 0);
    goto LAB14;

}


extern void work_a_1207471001_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1207471001_3212880686_p_0};
	xsi_register_didat("work_a_1207471001_3212880686", "isim/TB_pwm_isim_beh.exe.sim/work/a_1207471001_3212880686.didat");
	xsi_register_executes(pe);
}
