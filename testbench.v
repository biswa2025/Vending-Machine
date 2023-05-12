// Code your testbench here
// or browse Examples

module vending_machine_25_tb();
  wire out;
  wire [2:0] change;
  
  reg clk,rst;
  reg [2:0]in;
   
  vending_machine_25 dut(in,clk,rst,out,change);
  
  initial begin
    $monitor($time,"clk=%b,rst=%b,in=%b,out=%b,change=%b",clk,rst,in,out,change);
    $dumpfile("vending_machine_25.vcd");
    $dumpvars(0,vending_machine_25_tb);
    
    rst=1;
    clk=0;
    
    #6 rst=0;
    in=2;
    #11 in=2;
    #16 in=2;
    
    
    #30 $finish;
  end
  always #5 clk=~clk;
endmodule
