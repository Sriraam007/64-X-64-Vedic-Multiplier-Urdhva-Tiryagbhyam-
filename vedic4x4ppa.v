module vedic4x4ppa(a,b,sum,c_out);
    
input [3:0]a;
input [3:0]b;
output [7:0]sum;
wire c0,c1,c2,c3;
output c_out;
wire [3:0]q0;	
wire [3:0]q1;	
wire [3:0]q2;
wire [3:0]q3;
wire cc;	
wire [7:0]sum;
wire [3:0]temp1;
wire [3:0]temp2;
wire [3:0]q4;
wire [3:0]q5;
wire [3:0]q6;
//wire [3:0]q7;
assign cc=1'b0;
// using 4 2x2 multipliers
vedic_2x2 z1(a[1:0],b[1:0],q0[3:0]);//every ans is 1001
vedic_2x2 z2(a[3:2],b[1:0],q1[3:0]);
vedic_2x2 z3(a[1:0],b[3:2],q2[3:0]);
vedic_2x2 z4(a[3:2],b[3:2],q3[3:0]);

Full_Adder_4bit pp1( q1[3:0],q2[3:0],cc, q4[3:0],c1); //1001+1001=0010 + carry1
assign temp1 ={2'b0,q0[3:2]};//0010
Full_Adder_4bit pp2( q4[3:0], temp1,cc,q5[3:0], c2);//0100
or(c0,c1,c2);//c0=1
assign temp2 ={1'b0,c0,q5[3:2]};//0101
Full_Adder_4bit pp3( q3[3:0], temp2,cc,q6[3:0], c3);//1001+0101=1110

// fnal output assignment 
assign sum[1:0]=q0[1:0];//01
assign sum[3:2]=q5[1:0];//00
assign sum[7:4]=q6[3:0];//1110
assign c_out=c3;
endmodule








