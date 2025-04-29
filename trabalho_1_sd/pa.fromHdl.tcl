
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name trabalho_1_sd -dir "/home/ise/VirtualBox/1-Relatorio-SD/Trabalho-1-Sistemas-Digitais/trabalho_1_sd/planAhead_run_1" -part xc3s700anfgg484-5
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "Main.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {xor.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {subtraction.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {sign.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {shift.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {or.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {debouncer.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {and.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {addtion.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {absolute.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Main.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top Main $srcset
add_files [list {Main.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s700anfgg484-5
