module Full_Adder_16bit(A,B,cin,SUM,cout);
    input [15:0]A,B;
    input cin;
    output [15:0]SUM;
    output cout;
    wire [15:0]w;
    
    Full_Adder2 F1(A[0],B[0],cin,SUM[0],w[0]);
    Full_Adder2 F2(A[1],B[1],w[0],SUM[1],w[1]);
    Full_Adder2 F3(A[2],B[2],w[1],SUM[2],w[2]);
    Full_Adder2 F4(A[3],B[3],w[2],SUM[3],w[3]);
    Full_Adder2 F5(A[4],B[4],w[3],SUM[4],w[4]);
    Full_Adder2 F6(A[5],B[5],w[4],SUM[5],w[5]);
    Full_Adder2 F7(A[6],B[6],w[5],SUM[6],w[6]);
    Full_Adder2 F8(A[7],B[7],w[6],SUM[7],w[7]);
    Full_Adder2 F9(A[8],B[8],w[7],SUM[8],w[8]);
    Full_Adder2 F10(A[9],B[9],w[8],SUM[9],w[9]);
    Full_Adder2 F11(A[10],B[10],w[9],SUM[10],w[10]);
    Full_Adder2 F12(A[11],B[11],w[10],SUM[11],w[11]);
    Full_Adder2 F13(A[12],B[12],w[11],SUM[12],w[12]);
    Full_Adder2 F14(A[13],B[13],w[12],SUM[13],w[13]);
    Full_Adder2 F15(A[14],B[14],w[13],SUM[14],w[14]);
    Full_Adder2 F16(A[15],B[15],w[14],SUM[15],w[15]);
    assign cout=w[15];
endmodule
