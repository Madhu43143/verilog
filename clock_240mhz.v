//   generate a clock with 240 mhz using `timescale 1us/1ns ,,every time output high at 1us

/*
    f=240mhz = 240 * 10^6,time unit = 10^-6
    t=1/240*10^6 => t=0.004 * 10^-6 = 0.004 us => full cycle
    half clock cycle = 0.002
    """""""""""every time output high at 1us"""""""""""""""""""
          1us = 1000ns,so every 1000ns output should high
        
          
*/ 
`timescale 1us/1ns
module tb();
  reg clk,out;
  initial begin
  clk=0;
  out=0;
    forever begin
    #1  out = 1; // 1us out=1;
    #0.001 out = 0;// output high only at 0.001 us
    end
  end
  always #0.002 clk = ~clk;  // 0.002  one complete clock cycle = 0.004 => one complete cycle = 0.004us * 10-6 --> 4ns *10^-9 ==> one clock cycle = 4ns 
                             // 5*4 = 20ns => 5clock cycles complete  = 20ns 
                             //1us = 1000ns,so we see upto 1000ns ==> 250*4 = 1000ns
                            // output will be detected at 250clock cycles
endmodule


