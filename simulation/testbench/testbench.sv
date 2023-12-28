// Code your testbench here
// or browse Examples
module tail_light_control_tb;

  // Parameters
  reg clk;
  reg rstn;
  reg brake;
  reg turn_right;
  reg turn_left;
  wire [2:0] right_tail_light_control;
  wire [2:0] left_tail_light_control;

  // Instantiate the module under test
  tail_light_control dut (
    .clk(clk),
    .rst_n(rstn),
    .brake(brake),
    .turn_right(turn_right),
    .turn_left(turn_left),
    .right_tail_light_control(right_tail_light_control),
    .left_tail_light_control(left_tail_light_control)
  );

  // Clock generation
  always begin
    #5 clk <= ~clk;
  end

  initial begin
    // Initialize inputs
    clk = 0;
    rstn = 1;
    brake = 0;
    turn_right = 0;
    turn_left = 0;

    // Reset the DUT
    rstn = 0;
    #10 rstn = 1;

    // Test case 1: No actions, both lights off
    #10;
    if (right_tail_light_control !== 3'b000 || left_tail_light_control !== 3'b000)
      $display("Test case 1 failed");

    // Test case 2: Right turn signal
    turn_right = 1;
    #10;
    if (right_tail_light_control !== 3'b001 || left_tail_light_control !== 3'b000)
      $display("Test case 2 failed");
    turn_right = 0;

    // Test case 3: Left turn signal
    turn_left = 1;
    #10;
    if (right_tail_light_control !== 3'b000 || left_tail_light_control !== 3'b001)
      $display("Test case 3 failed");
    turn_left = 0;

    // Test case 4: Brake signal
    brake = 1;
    #10;
    if (right_tail_light_control !== 3'b111 || left_tail_light_control !== 3'b111)
      $display("Test case 4 failed");
    brake = 0;

    // Test case 5: Right turn signal and brake
    turn_right = 1;
    brake = 1;
    #10;
    if (right_tail_light_control !== 3'b111 || left_tail_light_control !== 3'b111)
      $display("Test case 5 failed");
    turn_right = 0;
    brake = 0;

    // Test case 6: Left turn signal and brake
    turn_left = 1;
    brake = 1;
    #10;
    if (right_tail_light_control !== 3'b111 || left_tail_light_control !== 3'b111)
      $display("Test case 6 failed");
    turn_left = 0;
    brake = 0;

    // Add more test cases as needed

    // End simulation
    end
    initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
  #10000 $finish;
end
  
endmodule

