module Full_Adder_4bit(A,B,cin,SUM,cout);
    input [3:0]A,B;
    input cin;
    output [3:0]SUM;
    output cout;
    wire[3:0]w;
    
    Full_Adder2 F1(A[0],B[0],cin,SUM[0],w[0]);
    Full_Adder2 F2(A[1],B[1],w[0],SUM[1],w[1]);
    Full_Adder2 F3(A[2],B[2],w[1],SUM[2],w[2]);
    Full_Adder2 F4(A[3],B[3],w[2],SUM[3],w[3]);
    assign cout=w[3];
endmodule