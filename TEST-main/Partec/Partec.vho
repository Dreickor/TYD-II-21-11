-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "11/20/2022 21:16:25"

-- 
-- Device: Altera EP3C120F780C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Partec IS
    PORT (
	a : IN std_logic;
	b : IN std_logic;
	cin : IN std_logic;
	res : OUT std_logic;
	cout : OUT std_logic
	);
END Partec;

-- Design Ports Information
-- res	=>  Location: PIN_Y12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cout	=>  Location: PIN_AF19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b	=>  Location: PIN_Y13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cin	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Partec IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a : std_logic;
SIGNAL ww_b : std_logic;
SIGNAL ww_cin : std_logic;
SIGNAL ww_res : std_logic;
SIGNAL ww_cout : std_logic;
SIGNAL \res~output_o\ : std_logic;
SIGNAL \cout~output_o\ : std_logic;
SIGNAL \b~input_o\ : std_logic;
SIGNAL \a~input_o\ : std_logic;
SIGNAL \cin~input_o\ : std_logic;
SIGNAL \res~0_combout\ : std_logic;
SIGNAL \cout~0_combout\ : std_logic;

BEGIN

ww_a <= a;
ww_b <= b;
ww_cin <= cin;
res <= ww_res;
cout <= ww_cout;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X52_Y0_N23
\res~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \res~0_combout\,
	devoe => ww_devoe,
	o => \res~output_o\);

-- Location: IOOBUF_X83_Y0_N16
\cout~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \cout~0_combout\,
	devoe => ww_devoe,
	o => \cout~output_o\);

-- Location: IOIBUF_X52_Y0_N8
\b~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b,
	o => \b~input_o\);

-- Location: IOIBUF_X52_Y0_N1
\a~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a,
	o => \a~input_o\);

-- Location: IOIBUF_X52_Y0_N15
\cin~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cin,
	o => \cin~input_o\);

-- Location: LCCOMB_X52_Y1_N24
\res~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \res~0_combout\ = \b~input_o\ $ (\a~input_o\ $ (\cin~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \b~input_o\,
	datac => \a~input_o\,
	datad => \cin~input_o\,
	combout => \res~0_combout\);

-- Location: LCCOMB_X52_Y1_N10
\cout~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cout~0_combout\ = (\b~input_o\ & ((\a~input_o\) # (\cin~input_o\))) # (!\b~input_o\ & (\a~input_o\ & \cin~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \b~input_o\,
	datac => \a~input_o\,
	datad => \cin~input_o\,
	combout => \cout~0_combout\);

ww_res <= \res~output_o\;

ww_cout <= \cout~output_o\;
END structure;


