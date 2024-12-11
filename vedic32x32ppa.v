module vedic32x32ppa(ai,bi,sout,ccout);
    
input [31:0]ai;
input [31:0]bi;
output [63:0]sout;
wire cc0,cc1,cc2,cc3;
output ccout;
wire [31:0]b0;	
wire [31:0]b1;	
wire [31:0]b2;
wire [31:0]b3;	
wire ccin;
wire [63:0]sout;
wire [31:0]temp5;
wire [31:0]temp6;
wire [31:0]b4;
wire [31:0]b5;
wire [31:0]b6;
assign ccin=1'b0;

vedic16x16ppa zz1(ai[15:0],bi[15:0],b0[31:0]);
vedic16x16ppa zz2(ai[31:16],bi[15:0],b1[31:0]);
vedic16x16ppa zz3(ai[15:0],bi[31:16],b2[31:0]);
vedic16x16ppa zz4(ai[31:16],bi[31:16],b3[31:0]);

Full_Adder_32bit pa1( b1[31:0],b2[31:0],ccin, b4[31:0],cc1);
assign temp5 ={16'b0,b0[31:16]};
Full_Adder_32bit pa2( b4[31:0], temp5,ccin,b5[31:0], cc2);
or(cc0,cc1,cc2);
assign temp6 ={15'b0,cc0,b5[31:16]};
Full_Adder_32bit pa3( b3[31:0], temp6,ccin,b6[31:0], cc3);

assign sout[15:0]=b0[15:0];
assign sout[31:16]=b5[15:0];
assign sout[63:32]=b6[31:0];
assign ccout=cc3;

endmodule
