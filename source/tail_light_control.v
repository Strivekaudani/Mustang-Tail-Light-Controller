`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Munya Kaudani 
// Mustang Tail Light Controller
// 
//////////////////////////////////////////////////////////////////////////////////

module tail_light_control(
    input wire	     clk,
    input wire	     rst_n,
    input wire	     brake,
    input wire	     turn_right,
    input wire	     turn_left,
    output reg [2:0] right_tail_light_control,
    output reg [2:0] left_tail_light_control
    );
    
    // internal registers
   reg [2:0]	     count;   
   
   // internal combinational variables
   reg [2:0]	     count_next;   
   reg [3:0]	     right_tail_light_control_next;
   reg [3:0]	     left_tail_light_control_next;

        
    // clock in registers, asynch active-low reset    
    always @(posedge clk or negedge rst_n)
    begin
        if (rst_n == 1'b0) begin
	   count                    <= 3'b000;
	   right_tail_light_control <= 3'b000;
           left_tail_light_control  <= 3'b000;
        end else begin
	   count                    <= count_next;
	   right_tail_light_control <= right_tail_light_control_next;
	   left_tail_light_control  <= left_tail_light_control_next;
        end   
    end

    // combinational logic block
    always @(*)
      begin

	 // input signals for this logic
	 count_next = count;
	 right_tail_light_control_next = right_tail_light_control;
	 left_tail_light_control_next = left_tail_light_control;
	
	
	 if(count >= 3'b101)begin
	    count_next = 3'b000;
	 end 

	 // combinational logic for count_next, right_tail_light_control_next, and left_tail_light_control_next
	 if(turn_right == 1'b1)begin
	    if(count == 3'b100)begin
	       case(right_tail_light_control)
		 3'b000: right_tail_light_control_next = 3'b001;
		 3'b001: right_tail_light_control_next = 3'b011;
		 3'b011: right_tail_light_control_next = 3'b111;
		 3'b111: right_tail_light_control_next = 3'b000;
		 default: right_tail_light_control_next = 3'b000;
	       endcase // case (right_tail_light_control_next)
	    end
	 end // if (turn_right == 1'b1)

	 if(turn_left == 1'b1)begin
	    if(count == 3'b100)begin
	       case(left_tail_light_control)
		 3'b000: left_tail_light_control_next = 3'b001;
		 3'b001: left_tail_light_control_next = 3'b011;
		 3'b011: left_tail_light_control_next = 3'b111;
		 3'b111: left_tail_light_control_next = 3'b000;
		 default: left_tail_light_control_next = 3'b000;
	       endcase // case (left_tail_light_control_next_next)
	    end
	 end // if (turn_left == 1'b1)

	 if(brake == 1'b1)begin
	    if(count == 3'b100)begin
	       right_tail_light_control_next = 3'b111;
	       left_tail_light_control_next = 3'b111;
	    end
	 end

	 if((turn_right == 1'b1) & (brake == 1'b1))begin
	    if(count == 3'b100)begin
	       left_tail_light_control_next = 3'b111;
	       case(right_tail_light_control)
		 3'b000: right_tail_light_control_next = 3'b111;
		 3'b111: right_tail_light_control_next = 3'b011;
		 3'b011: right_tail_light_control_next = 3'b001;
		 3'b001: right_tail_light_control_next = 3'b000;
		 default: right_tail_light_control_next = 3'b000;
	       endcase // case (right_tail_light_control_next)
	    end
	 end // if ((turn_right == 1'b1) & (brake == 1'b1))

	 if((turn_left == 1'b1) & (brake == 1'b1))begin
	    if(count == 3'b100)begin
	       right_tail_light_control_next = 3'b111;
	       case(left_tail_light_control)
		 3'b000: left_tail_light_control_next = 3'b111;
		 3'b111: left_tail_light_control_next = 3'b011;
		 3'b011: left_tail_light_control_next = 3'b001;
		 3'b001: left_tail_light_control_next = 3'b000;
		 default: left_tail_light_control_next = 3'b000;
	       endcase // case (left_tail_light_control_next)
	    end
	 end // if ((turn_left == 1'b1) & (brake == 1'b1))
	 count_next = count + 1;
    end 
endmodule
