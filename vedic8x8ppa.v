module vedic8x8ppa(ain,bin,s_sum,c_cout);
   
input [7:0]ain;
input [7:0]bin;
output [15:0]s_sum;
wire ct0,ct1,ct2,ct3;
output c_cout;
wire [7:0]a0;	
wire [7:0]a1;	
wire [7:0]a2;
wire [7:0]a3;	
wire c_cin;
wire [15:0]s_sum;
wire [7:0]temp3;
wire [7:0]temp4;
wire [7:0]a4;
wire [7:0]a5;
wire [7:0]a6;
assign c_cin=1'b0;
// using 4 4x4 multipliers
vedic4x4ppa ppa1(ain[3:0],bin[3:0],a0[7:0]);
vedic4x4ppa ppa2(ain[7:4],bin[3:0],a1[7:0]);
vedic4x4ppa ppa3(ain[3:0],bin[7:4],a2[7:0]);
vedic4x4ppa ppa4(ain[7:4],bin[7:4],a3[7:0]);


Full_Adder_8bit pa1( a1[7:0],a2[7:0],c_cin, a4[7:0],ct1);
assign temp3 ={4'b0,a0[7:4]};
Full_Adder_8bit pa2( a4[7:0], temp3,c_cin,a5[7:0], ct2);
or(ct0,ct1,ct2);
assign temp4 ={3'b0,ct0,a5[7:4]};
Full_Adder_8bit pa3( a3[7:0], temp4,c_cin,a6[7:0], ct3);

// final output assignment 
assign s_sum[3:0]=a0[3:0];
assign s_sum[7:4]=a5[3:0];
assign s_sum[15:8]=a6[7:0];
assign c_cout=ct3;

endmodule





