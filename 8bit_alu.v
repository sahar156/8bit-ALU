module _8bit_alu(input clk,rst,
                input [7:0]A,B,
                input [3:0]sel,
                output z,c_out,output reg  over_flow,
                output reg [7:0] F);
					 
 //output of combinational always   
 reg [8:0] comb_f;
 
//combinational always
always @ (*)
 begin
  case(sel)

   4'b0000:begin
           comb_f=A+B;
           over_flow=(A[7] & B[7] & comb_f[7]) | (~A[7] & ~B[7] & comb_f[7]); //to make overflow flag specific for arithmatic operations
           end
   4'b0001:begin
           comb_f=A-B;
           over_flow=(A[7] & B[7] & comb_f[7]) | (~A[7] & ~B[7] & comb_f[7]);
           end
   4'b0011:begin comb_f[7:0]=~B+8'd1;comb_f[8]=1'b0;over_flow=1'b0;end
   4'b1000:begin comb_f[7:0]=A&B;comb_f[8]=1'b0;over_flow=1'b0;end
   4'b1001:begin comb_f[7:0]=A^B;comb_f[8]=1'b0;over_flow=1'b0;end
   4'b1010:begin comb_f[7:0]=A|B;comb_f[8]=1'b0;over_flow=1'b0;end
   4'b1011:begin comb_f[7:0]=~B;comb_f[8]=1'b0;over_flow=1'b0;end
   4'b1100:begin comb_f[7:0]=A>>>1;comb_f[8]=1'b0;over_flow=1'b0;end
   4'b1101:begin comb_f[7:0]=A<<<1;comb_f[8]=1'b0;over_flow=1'b0;end
   4'b1110:begin comb_f[7:0]=A>>1;comb_f[8]=1'b0;over_flow=1'b0;end
   4'b1111:begin comb_f[7:0]=A<<1;comb_f[8]=1'b0;over_flow=1'b0;end

   default:begin 
	        comb_f[8:0]=9'b0;
			  comb_f[8]=1'b0;
	        over_flow=1'b0;
			  end
  endcase
 end

 //register the final output F with the clock edge
always @(posedge clk or negedge rst)
 begin
  if(!rst)
   F<=8'b0;
 else
  F<=comb_f[7:0];
end

//zero flag and carry out flag 
assign z=(comb_f[7:0]==8'b0);
assign c_out=(comb_f[8]==1'b1);

endmodule 



