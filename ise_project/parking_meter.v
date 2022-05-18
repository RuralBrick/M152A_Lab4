`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:48:46 05/16/2022 
// Design Name: 
// Module Name:    parking_meter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module parking_meter(
    input clk,
    input [7:0] sw,
    input btns,
    input btnu,
    input btnl,
    input btnd,
    input btnr,
    input [7:0] JA,
    output [7:0] seg,
    output [3:0] an
    );

	wire rst;

	debouncer debouncer1(.clk(clk), .btn(btnr), .state(rst));

	wire clk_1Hz;
	wire clk_fast;
	wire clk_blink;
	
	clocks clocks1(
		.clk(clk),
		.rst(rst),
		.clk_1Hz(clk_1Hz),
		.clk_fast(clk_fast),
		.clk_blink(clk_blink)
	);

	reg state_blink;

	wire [3:0] digit3;
	wire [3:0] digit2;
	wire [3:0] digit1;
	wire [3:0] digit0;
	
	display_control display_control1(
		.clk_fast(clk_fast),
		.clk_blink(clk_blink),
		.state_blink(state_blink),
		.digit3(digit3),
		.digit2(digit2),
		.digit1(digit1),
		.digit0(digit0),
		.seg(seg),
		.an(an)
	);

endmodule
