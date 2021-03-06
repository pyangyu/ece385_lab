transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -sv -work work +incdir+. {lab2.svo}

vlog -sv -work work +incdir+E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB3_Puyu/Lab3 {E:/Folder_U/uiuc_summer_2022/ECE385/LAB/LAB3_Puyu/Lab3/testbench_8.sv}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L gate_work -L work -voptargs="+acc"  testbench2

add wave *
view structure
view signals
run 1000 ns
