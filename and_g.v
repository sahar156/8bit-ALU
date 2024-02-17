module and_g (input[7:0] A,B,output reg[8:0] and_result);
always @ (*)
 begin
  and_result<=A&B;
end
endmodule 