module subtractor_8bit (input [7:0]A,B,output reg [8:0]difference);
always @ (*)
 begin
  difference<=A-B;
end
endmodule 