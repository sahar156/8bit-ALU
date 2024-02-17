module or_g (input[7:0] A,B,output reg[8:0] or_result);
always @ (*)
 begin
  or_result<=A|B;
end
endmodule 