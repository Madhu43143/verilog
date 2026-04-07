//   generate a clock with 240 mhz using `timescale 1us/1ns ,,every time output high at 1us

/*
    f=240mhz = 240 * 10^6,time unit = 10^-6
    t=1/240*10^6 => t=0.004 * 10^-6 = 0.004 us => full cycle
    half clock cycle = 0.002
    """""""""""every time output high at 1us"""""""""""""""""""
          1us = 1000ns
*/
`timescale 1us/1ns
module tb();
  reg clk,out;
  initial begin
  clk=0;
  out=0;
    forever begin
    #0.1  out = 1;
    #0.001 out = 0;
    end
  end
  always #0.002 clk = ~clk;  // 0.002
endmodule


