Button Scanner Test Design
======================================================

This FPGA design scans the StickIt! SmallButtons module and displays
the number of a pressed button (1, 2, 3, ..., 8)
on the first digit of the StickIt! LED module.


Important Files
-----------------------------------------------------

`ButtonTest.vhd`: Test code for scanning the buttons and displaying the
    pressed button on the LED digit. You'll also need to install the
    [XESS VHDL library](https://github.com/xesscorp/VHDL_Lib) to get access
    to the LED digits interface module.

`ButtonTest.ucf`: Pin assignments for connecting the XuLA2 FPGA
	board to the StickIt! SmallButtons and LED modules via the StickIt! V4 motherboard.
    (Use the [`gxsconn` tool](https://xesscorp.github.com/xsconnect) to generate pin mappings. Install it with
    `pip install xsconnect`.)

`ButtonTest.xise`: The Xilinx ISE project file that ties all the previous files together.

	
Running the Test
-----------------------------------------------------

1. Load the `.xise` project file with ISE and compile it into a `.bit` file.
2. Insert a XuLA2 board into a StickIt! V4 motherboard.
3. Attach a StickIt! SmallButtons module to the PM2 connector of the motherboard.
4. Attach a StickIt! LED module to the PM1 connector of the motherboard.
5. Attach a USB cable to the XuLA2 board. (This will supply power for the
   entire collection of boards and modules.)
6. Use `GXSTOOLS` to download the `.bit` file to the FPGA on the XuLA2 board.
   After the download completes, the first digit of the LED display should show a "-".
7. Press each button on the SmallButtons module. The digit corresponding to the
   button will appear on the first digit of the LED display.
