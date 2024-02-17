module alu_struct (input clk,rst ,input [7:0] A, B, output reg [8:0] result, output c_out,over_flow,zero,
                input wire [3:0] sel);

  // Components
  wire [8:0] add_result, sub_result,not_B,twos_comp_B,and_result, xor_result,or_result,  right_rotate_result,left_rotate_result,
             shift_right_result,shift_left_result;

// Addition operation
  adder_8bit adder(.A(A), .B(B), .sum(add_result));

  // Subtraction operation
  subtractor_8bit subtractor(.A(A), .B(B), .difference(sub_result));

// 2's compliment operation
  
  adder_8bit adder_(.A(not_B), .B(8'b1), .sum(twos_comp_B));

  // AND operation
  and_g and1(.and_result(and_result),.A(A), .B(B));

  // XOR operation
  xor_g xor1(.xor_result(xor_result),.A(A), .B(B));

  // OR operation
  or_g or1(.or_result(or_result),.A(A), .B(B));

// 1's compliment operation
 not_g not_b(.not_B(not_B),.B(B));

// Right rotate operation
  right_rotate r_rotate(.A(A), .z(right_rotate_result));
  
// left rotate operation
  left_rotate l_rotate(.A(A), .z(left_rotate_result));

// Right shift operation
  right_shift shl(.A(A), .shifted(shift_right_result));

  // Left shift operation
  left_shift sh2(.A(A), .shifted(shift_left_result));

  // flags
  assign zero = (result == 9'b0);
  assign c_out = (result[8] == 1'b1);
  assign over_flow=(A[7] & B[7] & result[7]) | (~A[7] & ~B[7] & result[7]);

  // Output multiplexer based on selection line
  always @(posedge clk or negedge rst) 
   begin
    if(!rst)
     result <= 8'b0;
    else 
     case(sel)
      4'b0000: result <= add_result;        // ADD
      4'b0001: result <= sub_result;        // SUBTRACT
      4'b0011: result <= twos_comp_B;        // 2'S COMPLIMENT
      4'b1000: result <= and_result;        // AND
      4'b1001: result <= xor_result;         // XOR
      4'b1010: result <= or_result;         // OR
      4'b1011: result <= not_B;        // 1'S COMPLIMENT
      4'b1100: result <= right_rotate_result;        // RIGHT ROTATE
      4'b1101: result <= left_rotate_result;        // LEFT ROTATE
      4'b1110: result <= shift_right_result;        // RIGHT SHIFT
      4'b1111: result <= shift_left_result; // LEFT SHIFT
      default: result <= 8'b0;      
    endcase
  end

endmodule
