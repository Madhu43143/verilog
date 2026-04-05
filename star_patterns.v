
//////////////////////////////////  star patterns in simulation time///////////////////////////////////////////////////////
`timescale 1 ns / 1 ps
// timescale is a compiler directive in verilog/sv  to define time unit and time precision
module tb();
integer i,j;

initial begin
  for(i=0;i<=5;i=i+1)begin // rows
    for(j=0;j<i;j=j+1) // column
      $write("*");
		$display();
  end
  
end
endmodule

