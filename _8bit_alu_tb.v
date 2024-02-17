`timescale 1ns/1ps
module _8bit_alu_tb ();
reg [7:0] A,B;
reg clk,rst;
reg [3:0]sel;
wire [7:0]F;
wire z,c_out,over_flow;

_8bit_alu DUT (.A(A),.B(B),.clk(clk),.rst(rst),.sel(sel),.z(z),.c_out(c_out),.over_flow(over_flow),.F(F));

initial
 begin
  $dumpfile("ALU.vcd"); // waveforms in this file      
  $dumpvars;              // saves all waveforms   
  clk = 1'b0;   
  rst = 1'b0;
  sel =4'b0;   
  A = 8'b0;   
  B = 8'b0;  
  $display ("TEST CASE 1") ;  // test Add Function  
  #10
  rst = 1'b1;
  sel =4'b0000;   
  A = 8'd3;   
  B = 8'd2;      
  $display ("TEST CASE 2") ;   // test Subtract Function
  #10
  rst = 1'b1;
  sel =4'b0001;   
  A = 8'd3;   
  B = 8'd2;
  $display ("TEST CASE 3") ;  // test And Function
  #10
  rst = 1'b1;
  sel =4'b1000;   
  A = 8'd3;   
  B = 8'd2;
   $display ("TEST CASE 4") ;  // test XOR Function
  #10
  rst = 1'b1;
  sel =4'b1001;   
  A = 8'd3;   
  B = 8'd2;
    $display ("TEST CASE 5") ;  // test OR Function
  #10
  rst = 1'b1;
  sel =4'b1010;   
  A = 8'd3;   
  B = 8'd2;
    $display ("TEST CASE 6") ;  // test 1's complement Function
  #10
  rst = 1'b1;
  sel =4'b1011;   
  A = 8'd3;   
  B = 8'd2;
   $display ("TEST CASE 7") ;  // test Right Rotate Function
  #10
  rst = 1'b1;
  sel =4'b1100;   
  A = 8'd3;   
  B = 8'd2;
  $display ("TEST CASE 8") ;  // test Left Rotate Function
  #10
  rst = 1'b1;
  sel =4'b1101;   
  A = 8'd3;   
  B = 8'd2;
  $display ("TEST CASE 9") ;  // test Right Shift Function
  #10
  rst = 1'b1;
  sel =4'b1110;   
  A = 8'd3;   
  B = 8'd2;
  $display ("TEST CASE 10") ;  // test Left Shift Function
  #10
  rst = 1'b1;
  sel =4'b1111;   
  A = 8'd3;   
  B = 8'd2;
  $display ("TEST CASE 11") ;    // test 2's complement Function
  #10  
  rst = 1'b1;
  sel =4'b0011;   
  A = 8'd3;   
  B = 8'd2;   
  $display ("TEST CASE 12") ;    // test zero flag Function
  #10  
  rst = 1'b1;
  sel =4'b0001;   
  A = 8'd3;   
  B = 8'd3;   
  #100
  $stop;  //finished with simulation 
 end

// Clock Generator
always #5 clk = ~clk  ;     

endmodule

  
