transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB3_Puyu/Lab3 {E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB3_Puyu/Lab3/Synchronizers.sv}
vlog -sv -work work +incdir+E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB3_Puyu/Lab3 {E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB3_Puyu/Lab3/Register_unit.sv}
vlog -sv -work work +incdir+E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB3_Puyu/Lab3 {E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB3_Puyu/Lab3/HexDriver.sv}
vlog -sv -work work +incdir+E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB3_Puyu/Lab3 {E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB3_Puyu/Lab3/Control.sv}
vlog -sv -work work +incdir+E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB3_Puyu/Lab3 {E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB3_Puyu/Lab3/ripple_adder.sv}
vlog -sv -work work +incdir+E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB3_Puyu/Lab3 {E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB3_Puyu/Lab3/Processor.sv}

vlog -sv -work work +incdir+E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB3_Puyu/Lab3 {E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB3_Puyu/Lab3/testbench_8.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench2

add wave *
view structure
view signals
run 1000 ns
