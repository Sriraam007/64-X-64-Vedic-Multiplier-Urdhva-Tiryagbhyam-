module Full_Adder_8bit(A,B,cin,SUM,cout);
    input [7:0]A,B;
    input cin;
    output [7:0]SUM;
    output cout;
    wire [7:0]w;
    
    Full_Adder2 F1(A[0],B[0],cin,SUM[0],w[0]);
    Full_Adder2 F2(A[1],B[1],w[0],SUM[1],w[1]);
    Full_Adder2 F3(A[2],B[2],w[1],SUM[2],w[2]);
    Full_Adder2 F4(A[3],B[3],w[2],SUM[3],w[3]);
    Full_Adder2 F5(A[4],B[4],w[3],SUM[4],w[4]);
    Full_Adder2 F6(A[5],B[5],w[4],SUM[5],w[5]);
    Full_Adder2 F7(A[6],B[6],w[5],SUM[6],w[6]);
    Full_Adder2 F8(A[7],B[7],w[6],SUM[7],w[7]);
    assign cout=w[7];
endmodule
