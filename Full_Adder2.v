module Full_Adder2(A,B,C,SUM,CARRY);
    input A,B,C;
    output SUM,CARRY;
    wire w1,w2;
    assign w1=A^B;
    assign w2=~C;
    MUX_2X1 M1(B,C,w1,CARRY);
    MUX_2X1 M2(C,w2,w1,SUM);
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
    
    
