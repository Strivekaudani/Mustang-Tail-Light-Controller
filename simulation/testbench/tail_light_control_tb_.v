`timescale 1ns / 1ps

module tail_light_control_tb();

   reg clk;
   reg rst_n;
   reg brake;
   reg turn_right;
   reg turn_left;
   wire	right_tail_light;
   wire	left_tail_light;

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

      $monitor("Testcase: %s, right_light = %b, left_light = %b, Time %d" , testcase, right_tail_light, left_tail_light, $time);

      testcase = "Turn right active";
      #23
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      rst_n = 1;
      #10
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      turn_right = 1;
      #10
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #40
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #10
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #40
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #10
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #40
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #10
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #40
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      turn_right = 0;
      #10
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);


      testcase = "Turn left active";
      turn_left = 1;
      #10
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #40
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #10
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #40
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #10
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #40
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #10
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #40
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      turn_left = 0;
      #10
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);


      testcase = "brake active";
      brake = 1;
      #50
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      brake = 0;
      #50

      testcase = "turn right and brake active";
      #10
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      turn_right = 1;
      brake = 1;
      #10
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #40
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #10
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #40
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #10
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #40
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #10
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #40
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      turn_right = 0;
      brake = 0;
      #10
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);


      testcase = "turn left and brake active";
      turn_left = 1;
      brake = 1;
      #10
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #40
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #10
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #40
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #10
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #40
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #10
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      #40
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);
      turn_left = 0;
      brake = 0;
      #10
	//$display( " right_light = %b, left_light = %b, Time %d" , right_tail_light, left_tail_light, $time);

 

      #30
	$finish;
   end // initial begin
   

endmodule // tail_light_control_tb

   
      
      

      

  
	
      

      

      
