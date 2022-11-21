transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {Partec.vho}

vcom -93 -work work {C:/Users/Usuario/OneDrive/Escritorio/facu-main/TEST-main/Partec/parte_c_tb.vhd}

vsim -t 1ps -L altera -L cycloneiii -L gate_work -L work -voptargs="+acc"  parte_c_tb

add wave *
view structure
view signals
run -all
