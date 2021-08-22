module barrel_shifter(y, x, amt);
input [2:0]amt;
input [7:0]x;
output [7:0]y;
wire [7:0]p, q;

// Top_Level
mux m0(p[7], x[7], x[3], amt[2]);
mux m1(p[6], x[6], x[2], amt[2]);
mux m2(p[5], x[5], x[1], amt[2]);
mux m3(p[4], x[4], x[0], amt[2]);
mux m4(p[3], x[3], x[7], amt[2]);
mux m5(p[2], x[2], x[6], amt[2]);
mux m6(p[1], x[1], x[5], amt[2]);
mux m7(p[0], x[0], x[4], amt[2]);
// Medium_Level
mux m8(q[7], p[7], p[1], amt[1]);
mux m9(q[6], p[6], p[0], amt[1]);
mux m10(q[5], p[5], p[7], amt[1]);
mux m11(q[4], p[4], p[6], amt[1]);
mux m12(q[3], p[3], p[5], amt[1]);
mux m13(q[2], p[2], p[4], amt[1]);
mux m14(q[1], p[1], p[3], amt[1]);
mux m15(q[0], p[0], p[2], amt[1]);
// Lower_Level
mux m16(y[7], q[7], q[0], amt[0]);
mux m17(y[6], q[6], q[7], amt[0]);
mux m18(y[5], q[5], q[6], amt[0]);
mux m19(y[4], q[4], q[5], amt[0]);
mux m20(y[3], q[3], q[4], amt[0]);
mux m21(y[2], q[2], q[3], amt[0]);
mux m22(y[1], q[1], q[2], amt[0]);
mux m23(y[0], q[0], q[1], amt[0]);
endmodule


//2x1_Mux_used_for_shifter
module mux(out, in0, in1, s);
input in0, in1;
input s;
output out;
assign out = s?in1:in0;
endmodule 