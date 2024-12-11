module Full_Adder_2bit(A,B,Cin,SUM,Cout);
    input [1:0]A,B;
    input Cin;
    output [2:0]SUM;
    output Cout;
    wire w0,w1,w2;
    assign w2=A[0]^B[0];
    assign w0=A[0]&B[0];
    assign w1=A[1]^B[1];
    or o(SUM[0],w2,Cin);
    MUX_2X1 M1(B[1],w0,w1,SUM[2]);
    MUX_2X1 M2(w0,~w0,w1,SUM[1]);
    assign Cout=SUM[2];
endmodule
    
    
    
    
    
    
    
    
    module MUX_2X1(D0,D1,S,OUTPUT);
    input D0,D1,S;
    output reg OUTPUT;
    always @(D0 or D1 or S)
    begin
        case(S)
            1'b0 : OUTPUT = D0;
            1'b1 : OUTPUT = D1;
        endcase
    end
endmodule
    
