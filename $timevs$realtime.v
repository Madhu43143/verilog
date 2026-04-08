`timescale 1ns/1ps
//$time converts time unit to time precision 
// ex: 5ns if you use $time=5*1000=5000ps
//if you use $realtime=5.0000ns

/*
`timescale 1ns/1ps

So:

time unit = 1ns
time precision = 1ps

Now at 5ns:

Internally:
simulation time = 5ns
$realtime
$realtime = 5.000000

Because it prints in time unit (ns)

$time with %t
$display("%0t", $time);

prints:

5000

Why?

Because simulator is displaying in precision ticks (1ps):

5ns = 5000ps

*/
module tb;
  reg clk;
  reg rst;
  reg d;
  wire q;

  dut u_dut (
    .clk (clk),
    .rst (rst),
    .d   (d),
    .q   (q)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    rst = 1;
    d   = 0;

    $display("TB  : $time=%t  $realtime=%0f -> start", $time, $realtime); 

    #12;
    rst = 0;
    d   = 1;
    $display("TB  : $time=%t  $realtime=%0f -> rst=0 d=1", $time, $realtime); // $time = 12000

    #10;
    d = 0;
    $display("TB  : $time=%t  $realtime=%0f -> d=0", $time, $realtime);

    #20;
    $finish;
  end

  always @(posedge clk) begin
    $display("TB  : $time=%t  $realtime=%0f -> posedge clk q=%0b", $time, $realtime, q);
  end

endmodule


`timescale 1us/1ns

module dut (
  input  clk,
  input  rst,
  input  d,
  output reg q
);

  always @(posedge clk) begin
    $display("DUT : $time=%0t  $realtime=%0f -> posedge clk", $time, $realtime);

    if (rst)
      q <= 1'b0;
    else
      q <= d;
  end

endmodule 

