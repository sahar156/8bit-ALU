module left_rotate (input [7:0]A,output reg[8:0] z);
always @ (*)
 begin
  z<=A<<<1;
end
endmodule 