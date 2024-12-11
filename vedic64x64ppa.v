module vedic64x64ppa(ai,bi,sout,ccout);
    
input [63:0]ai;
input [63:0]bi;
output [127:0]sout;
wire cc0,cc1,cc2,cc3;
output ccout;
wire [63:0]b0;	
wire [63:0]b1;	
wire [63:0]b2;
wire [63:0]b3;	
wire ccin;
wire [127:0]sout;
wire [63:0]temp5;
wire [63:0]temp6;
wire [63:0]b4;
wire [63:0]b5;
wire [63:0]b6;
assign ccin=1'b0;

vedic32x32ppa zz1(ai[31:0],bi[31:0],b0[63:0]);
vedic32x32ppa zz2(ai[63:32],bi[31:0],b1[63:0]);
vedic32x32ppa zz3(ai[31:0],bi[63:32],b2[63:0]);
vedic32x32ppa zz4(ai[63:32],bi[63:32],b3[63:0]);

Full_Adder_64bit pa1( b1[63:0],b2[63:0],ccin, b4[63:0],cc1);
assign temp5 ={32'b0,b0[63:32]};
Full_Adder_64bit pa2( b4[63:0], temp5,ccin,b5[63:0], cc2);
or(cc0,cc1,cc2);
assign temp6 ={31'b0,cc0,b5[63:32]};
Full_Adder_64bit pa3( b3[63:0], temp6,ccin,b6[63:0], cc3);

assign sout[31:0]=b0[31:0];
assign sout[63:32]=b5[31:0];
assign sout[127:64]=b6[63:0];
assign ccout=cc3;

endmodule
