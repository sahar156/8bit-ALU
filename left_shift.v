module left_shift (input [7:0]A,output reg[8:0] shifted);
always @ (*)
 begin
  shifted<=A<<1;
end
endmodule 