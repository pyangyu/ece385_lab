transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB2_Puyu {E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB2_Puyu/Synchronizers.sv}
vlog -sv -work work +incdir+E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB2_Puyu {E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB2_Puyu/Router.sv}
vlog -sv -work work +incdir+E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB2_Puyu {E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB2_Puyu/Reg_4.sv}
vlog -sv -work work +incdir+E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB2_Puyu {E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB2_Puyu/HexDriver.sv}
vlog -sv -work work +incdir+E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB2_Puyu {E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB2_Puyu/Control.sv}
vlog -sv -work work +incdir+E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB2_Puyu {E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB2_Puyu/compute.sv}
vlog -sv -work work +incdir+E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB2_Puyu {E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB2_Puyu/Register_unit.sv}
vlog -sv -work work +incdir+E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB2_Puyu {E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB2_Puyu/Processor.sv}

vlog -sv -work work +incdir+E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB2_Puyu {E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB2_Puyu/testbench_8.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench2

add wave *
view structure
view signals
run 400 ns
