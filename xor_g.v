module xor_g (input[7:0] A,B,output reg[8:0] xor_result);
always @ (*)
 begin
  xor_result=A^B;
end
endmodule 