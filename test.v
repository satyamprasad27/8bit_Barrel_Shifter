`timescale 10ps/1ps
module test;
reg [7:0]x;
reg [2:0]amt;
wire [7:0]y;

barrel_shifter dut(y, x, amt);
initial
begin x = 8'b0;
amt = 3'b0;
end
initial begin
#5 x = 8'hfa; amt = 3'b101;
#5 x = 8'h4a; amt = 3'b110;
#5 x = 8'h11; amt = 3'b111;
#5 x = 8'hac; amt = 3'b011;
#5 $finish;
end

endmodule 