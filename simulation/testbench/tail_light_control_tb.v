`timescale 1ns / 1ps

module tail_light_control_tb();

   reg clk;
   reg rst_n;
   reg brake;
   reg turn_right;
   reg turn_left;
   wire	right_tail_light;
   wire	left_tail_light;
   
   //reg [7:0]  error_count;
   reg [8*39:0]	testcase;

   tail_light_control DUT(
			  .clk(clk),
			  .rst_n(rst_n),
			  .brake(brake),
			  .turn_right(turn_right),
			  .turn_left(turn_left),
			  .right_tail_light_control(right_tail_light),
			  .left_tail_light_control(left_tail_light)
			  );

   always #5 clk = ~clk;

   initial begin
      clk = 0;
      rst_n = 0;
      brake = 0;
      turn_right = 0;
      turn_left = 0;
      testcase = "Initializing";

      $monitor("Testcase: %s, right_light = %b, left_light = %b, Time %d" , testcase, right_tail_light, left_tail_light, $time);

      #23
      rst_n = 1;
      #10
      testcase = "Turn right active";
      turn_right = 1;
      #10
	//error_count = compare_outputs(3'b000, right_tail_light, "right_tail_light", error_count);
        //error_count = compare_outputs(3'b000, left_tail_light, "left_tail_light", error_count);
      #40
      #10
	//error_count = compare_outputs(3'b001, right_tail_light, "right_tail_light", error_count);
        //error_count = compare_outputs(3'b000, left_tail_light, "left_tail_light", error_count);
      #40
      #10
	//error_count = compare_outputs(3'b011, right_tail_light, "right_tail_light", error_count);
        //error_count = compare_outputs(3'b000, left_tail_light, "left_tail_light", error_count);
      #40
      #10
	//error_count = compare_outputs(3'b111, right_tail_light, "right_tail_light", error_count);
        //error_count = compare_outputs(3'b000, left_tail_light, "left_tail_light", error_count);
      #40
      turn_right = 0;
      #10

      testcase = "Turn left active";
      turn_left = 1;
      #10
	//error_count = compare_outputs(3'b000, right_tail_light, "right_tail_light", error_count);
        //error_count = compare_outputs(3'b000, left_tail_light, "left_tail_light", error_count);
      #40
      #10
	//error_count = compare_outputs(3'b000, right_tail_light, "right_tail_light", error_count);
        //error_count = compare_outputs(3'b001, left_tail_light, "left_tail_light", error_count);
      #40
      #10
	//error_count = compare_outputs(3'b000, right_tail_light, "right_tail_light", error_count);
        //error_count = compare_outputs(3'b011, left_tail_light, "left_tail_light", error_count);
      #40
      #10
	//error_count = compare_outputs(3'b000, right_tail_light, "right_tail_light", error_count);
        //error_count = compare_outputs(3'b111, left_tail_light, "left_tail_light", error_count);
      #40
      turn_left = 0;
      #10

      testcase = "Brake active";
      brake = 1;
      #10
	//error_count = compare_outputs(3'b111, right_tail_light, "right_tail_light", error_count);
        //error_count = compare_outputs(3'b111, left_tail_light, "left_tail_light", error_count);
      #40
      brake = 0;
      #50

      testcase = "Turn right and brake active";
      turn_right = 1;
      brake = 1;
      #10
	//error_count = compare_outputs(3'b000, right_tail_light, "right_tail_light", error_count);
        //error_count = compare_outputs(3'b111, left_tail_light, "left_tail_light", error_count);
      #40
      #10
	//error_count = compare_outputs(3'b001, right_tail_light, "right_tail_light", error_count);
        //error_count = compare_outputs(3'b111, left_tail_light, "left_tail_light", error_count);
      #40
      #10
	//error_count = compare_outputs(3'b011, right_tail_light, "right_tail_light", error_count);
        //error_count = compare_outputs(3'b111, left_tail_light, "left_tail_light", error_count);
      #40
      #10
	//error_count = compare_outputs(3'b111, right_tail_light, "right_tail_light", error_count);
        //error_count = compare_outputs(3'b111, left_tail_light, "left_tail_light", error_count);
      #40
      turn_right = 0;
      brake = 0;
      #10

      testcase = "Turn left and brake active";
      turn_left = 1;
      brake = 1;
      #10
	//error_count = compare_outputs(3'b111, right_tail_light, "right_tail_light", error_count);
        //error_count = compare_outputs(3'b000, left_tail_light, "left_tail_light", error_count);
      #40
      #10
	//error_count = compare_outputs(3'b111, right_tail_light, "right_tail_light", error_count);
        //error_count = compare_outputs(3'b001, left_tail_light, "left_tail_light", error_count);
      #40
      #10
	//error_count = compare_outputs(3'b111, right_tail_light, "right_tail_light", error_count);
        //error_count = compare_outputs(3'b011, left_tail_light, "left_tail_light", error_count);
      #40
      #10
	//error_count = compare_outputs(3'b111, right_tail_light, "right_tail_light", error_count);
        //error_count = compare_outputs(3'b111, left_tail_light, "left_tail_light", error_count);
      #40
      turn_left = 0;
      brake = 0;
      #10

      #30
	$finish;
   end // initial begin

   /*
   function  compare_outputs reg [7:0](
		input	    expected_value, 
                input	    actual_value,
		input [8*19:0] signal_name,
                input [7:0] error_count
               );
      if ( expected_value == actual_value ) begin
	 $display("PASS:  %s: Expected = %b, Actual = %b, Time = %t", signal_name, expected_value, actual_value, $time);
	 compare_outputs = error_count;	 
      end else begin
	 $display("FAIL** %s: Expected = %b, Actual = %b, Time = %t", signal_name, expected_value, actual_value, $time);
	 compare_outputs = error_count + 1;
      end
   endfunction // compare_outputs
   */
   

endmodule // tail_light_control_tb

   
      
      

      

  
	
      

      

      
