module adder_8bit (input[7:0] A,B,output reg[8:0] sum);
always @ (*)
 begin
  sum<=A+B;
end
endmodule
