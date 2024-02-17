module not_g (input[7:0] B,output reg[8:0] not_B);
always @ (*)
 begin
  not_B<=!B;
end
endmodule 