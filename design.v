// Code your design here

module vending_machine_25(in,clk,rst,out,change);
  input [2:0]in; // 000-0,001-5,010-10,011-15,100-20
  input clk,rst;
  output reg [2:0]change; 
  output reg out;
  
  parameter s0=3'b000;  
  parameter s1=3'b001;  
  parameter s2=3'b010; 
  parameter s3=3'b011;
  parameter s4=3'b100;
  
  reg [2:0] c_state,n_state;
  
  always @(posedge clk)
    begin
      if(rst==1)
        begin
          c_state=0;
          n_state=0;
          change=3'b000;
        end
      else
        c_state=n_state;
      
      case(c_state)
        s0:        // state s0 -- 0rs
          if(in==0)
            begin
              n_state=s0;
              out=0;
              change=3'b000;
            end
        else if(in==3'b001)
          begin
            n_state=s1;
            out=0;
            change=3'b000;
          end
        else if(in==3'b010)
          begin
            n_state=s2;
            out=0;
            change=3'b000;
          end
        
        s1:  // state s1 --5rs
          if(in==0)
            begin
              n_state=s0;
              out=0;
              change=3'b001; //change returned 5rs
            end
        else if(in==3'b001)
          begin
            n_state=s2;
            out=0;
            change=3'b000;
          end
        else if(in==3'b010)
          begin
            n_state=s3;
            out=0;
            change=3'b000;
          end
        s2:     //state s2 -- 10rs
          if(in==0)
            begin
              n_state=s0;
              out=0;
              change=3'b010;  // chnage returned 10rs
end
        else if(in==3'b001)
          begin
            n_state=s3;
            out=0;
            change=3'b000;
          end
        else if(in==3'b010)
          begin
            n_state=s4;
            out=0;
            change=3'b000;
          end
              
              
          s3:  // state s3--15rs
             if(in==0)
            begin
              n_state=s0;
              out=0;
              change=3'b011;  // chnage returned 15rs
            end
        else if(in==3'b001)
          begin
            n_state=s4;
            out=0;
            change=3'b000;
          end
        else if(in==3'b010)
          begin
            n_state=s0;
            out=1; //ouput =1 got 25rs
            change=3'b000;
          end
             
          s4:  // state s4--20rs
               if(in==0)
            begin
              n_state=s0;
              out=0;
              change=3'b100;  // chnage returned 20rs
             end
            else if(in==3'b001)
          begin
            n_state=s0;
            out=1;   ////ouput =1 got 25rs
            change=3'b000;
          end
        else if(in==3'b010)
          begin
            n_state=s0;
            out=1; //ouput =1 got 25rs
            change=3'b010;
          end
        endcase
              
    end
 endmodule
            
