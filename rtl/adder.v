// Library: calc2
// Module: 64-bit binary adder
// Author:  Naseer Siddique

module adder (bin_ovfl, bin_sum, alu_cmd, fxu_areg_q,fxu_breg_q);
  
   output bin_ovfl;
   output [0:63] bin_sum;

   wire 		 bin_ovfl;
   wire[0:63] 	 bin_sum;
   
   input [0:3] 	 alu_cmd;
   input [0:63]  fxu_areg_q, fxu_breg_q;
   
   wire [0:63] 	 p, p_n, g, h_n, d, a, a_n, b, b_n;
   wire [0:63] 	 fxu_areg_n_q, fxu_breg_n_q;
   
   wire [0:64] 	 c, c_n;
   wire [0:31] 	 G2, P2;
   wire [0:15] 	 Gn, Pn;
   wire [0:7] 	 Gb, Pb, d8;
   wire [0:5] 	 G2b, P2b;
   wire 	 ds;
   wire 		 bin_a_z_q, bin_add_45_q;
   wire [0:7] 	 bin_by_f_e_q;
   wire 		 bin_cin_q, bin_ex_sign_q, bin_ex_sign_op_q;
   wire 		 bin_sub_45_q, bin_sub_q;
   wire 			 bin_c_0;
   wire 			 bin_c_32;
   wire		 bin_sum_0_63_z, bin_sum_32_63_z, bin_sum_33_63_z;
   wire [0:63] 	 bruce_bin_sum;
   

   integer 	 A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S;

   assign 	 bin_a_z_q = 1'b0;
   assign 	 bin_add_45_q = (alu_cmd[0:3] == 4'b0001) ? 1'b1: 1'b0;
   assign 	 bin_by_f_e_q = 8'b0;
   assign 	 bin_cin_q = 1'b0;
   assign 	 bin_ex_sign_q = 1'b0;
   assign 	 bin_ex_sign_op_q = 1'b0;
   assign 	 bin_sub_45_q = ( alu_cmd[0:3] == 4'b0010) ? 1'b1 : 1'b0;
   assign 	 bin_sub_q = (alu_cmd[0:3] == 4'b0010) ? 1'b1 : 1'b0;

   assign 	 fxu_areg_n_q[0] = ~fxu_areg_q[0];
   assign 	 fxu_breg_n_q[0] = ~fxu_breg_q[0];

   assign 	 fxu_areg_n_q[1] = ~fxu_areg_q[1];
   assign 	 fxu_breg_n_q[1] = ~fxu_breg_q[1];

   assign 	 fxu_areg_n_q[2] = ~fxu_areg_q[2];
   assign 	 fxu_breg_n_q[2] = ~fxu_breg_q[2];

   assign 	 fxu_areg_n_q[3] = ~fxu_areg_q[3];
   assign 	 fxu_breg_n_q[3] = ~fxu_breg_q[3];

   assign 	 fxu_areg_n_q[4] = ~fxu_areg_q[4];
   assign 	 fxu_breg_n_q[4] = ~fxu_breg_q[4];

   assign 	 fxu_areg_n_q[5] = ~fxu_areg_q[5];
   assign 	 fxu_breg_n_q[5] = ~fxu_breg_q[5];

   assign 	 fxu_areg_n_q[6] = ~fxu_areg_q[6];
   assign 	 fxu_breg_n_q[6] = ~fxu_breg_q[6];

   assign 	 fxu_areg_n_q[7] = ~fxu_areg_q[7];
   assign 	 fxu_breg_n_q[7] = ~fxu_breg_q[7];

   assign 	 fxu_areg_n_q[8] = ~fxu_areg_q[8];
   assign 	 fxu_breg_n_q[8] = ~fxu_breg_q[8];

   assign 	 fxu_areg_n_q[9] = ~fxu_areg_q[9];
   assign 	 fxu_breg_n_q[9] = ~fxu_breg_q[9];

   assign 	 fxu_areg_n_q[10] = ~fxu_areg_q[10];
   assign 	 fxu_breg_n_q[10] = ~fxu_breg_q[10];

   assign 	 fxu_areg_n_q[11] = ~fxu_areg_q[11];
   assign 	 fxu_breg_n_q[11] = ~fxu_breg_q[1];

   assign 	 fxu_areg_n_q[12] = ~fxu_areg_q[12];
   assign 	 fxu_breg_n_q[12] = ~fxu_breg_q[12];

   assign 	 fxu_areg_n_q[13] = ~fxu_areg_q[13];
   assign 	 fxu_breg_n_q[13] = ~fxu_breg_q[13];

   assign 	 fxu_areg_n_q[14] = ~fxu_areg_q[14];
   assign 	 fxu_breg_n_q[14] = ~fxu_breg_q[14];

   assign 	 fxu_areg_n_q[15] = ~fxu_areg_q[15];
   assign 	 fxu_breg_n_q[15] = ~fxu_breg_q[15];

   assign 	 fxu_areg_n_q[16] = ~fxu_areg_q[16];
   assign 	 fxu_breg_n_q[16] = ~fxu_breg_q[16];

   assign 	 fxu_areg_n_q[17] = ~fxu_areg_q[17];
   assign 	 fxu_breg_n_q[17] = ~fxu_breg_q[17];

   assign 	 fxu_areg_n_q[18] = ~fxu_areg_q[18];
   assign 	 fxu_breg_n_q[18] = ~fxu_breg_q[18];

   assign 	 fxu_areg_n_q[19] = ~fxu_areg_q[19];
   assign 	 fxu_breg_n_q[19] = ~fxu_breg_q[19];

   assign 	 fxu_areg_n_q[20] = ~fxu_areg_q[20];
   assign 	 fxu_breg_n_q[20] = ~fxu_breg_q[20];

   assign 	 fxu_areg_n_q[21] = ~fxu_areg_q[21];
   assign 	 fxu_breg_n_q[21] = ~fxu_breg_q[21];

   assign 	 fxu_areg_n_q[22] = ~fxu_areg_q[22];
   assign 	 fxu_breg_n_q[22] = ~fxu_breg_q[22];

   assign 	 fxu_areg_n_q[23] = ~fxu_areg_q[23];
   assign 	 fxu_breg_n_q[23] = ~fxu_breg_q[23];

   assign 	 fxu_areg_n_q[24] = ~fxu_areg_q[24];
   assign 	 fxu_breg_n_q[24] = ~fxu_breg_q[24];

   assign 	 fxu_areg_n_q[25] = ~fxu_areg_q[25];
   assign 	 fxu_breg_n_q[25] = ~fxu_breg_q[25];

   assign 	 fxu_areg_n_q[26] = ~fxu_areg_q[26];
   assign 	 fxu_breg_n_q[26] = ~fxu_breg_q[26];

   assign 	 fxu_areg_n_q[27] = ~fxu_areg_q[27];
   assign 	 fxu_breg_n_q[27] = ~fxu_breg_q[27];

   assign 	 fxu_areg_n_q[28] = ~fxu_areg_q[28];
   assign 	 fxu_breg_n_q[28] = ~fxu_breg_q[28];

   assign 	 fxu_areg_n_q[29] = ~fxu_areg_q[29];
   assign 	 fxu_breg_n_q[29] = ~fxu_breg_q[29];

   assign 	 fxu_areg_n_q[30] = ~fxu_areg_q[30];
   assign 	 fxu_breg_n_q[30] = ~fxu_breg_q[30];

   assign 	 fxu_areg_n_q[31] = ~fxu_areg_q[31];
   assign 	 fxu_breg_n_q[31] = ~fxu_breg_q[31];

   assign 	 fxu_areg_n_q[32] = ~fxu_areg_q[32];
   assign 	 fxu_breg_n_q[32] = ~fxu_breg_q[32];

   assign 	 fxu_areg_n_q[33] = ~fxu_areg_q[33];
   assign 	 fxu_breg_n_q[33] = ~fxu_breg_q[33];

   assign 	 fxu_areg_n_q[34] = ~fxu_areg_q[34];
   assign 	 fxu_breg_n_q[34] = ~fxu_breg_q[34];

   assign 	 fxu_areg_n_q[35] = ~fxu_areg_q[35];
   assign 	 fxu_breg_n_q[35] = ~fxu_breg_q[35];

   assign 	 fxu_areg_n_q[36] = ~fxu_areg_q[36];
   assign 	 fxu_breg_n_q[36] = ~fxu_breg_q[36];

   assign 	 fxu_areg_n_q[37] = ~fxu_areg_q[37];
   assign 	 fxu_breg_n_q[37] = ~fxu_breg_q[37];

   assign 	 fxu_areg_n_q[38] = ~fxu_areg_q[38];
   assign 	 fxu_breg_n_q[38] = ~fxu_breg_q[38];

   assign 	 fxu_areg_n_q[39] = ~fxu_areg_q[39];
   assign 	 fxu_breg_n_q[39] = ~fxu_breg_q[39];

   assign 	 fxu_areg_n_q[40] = ~fxu_areg_q[40];
   assign 	 fxu_breg_n_q[40] = ~fxu_breg_q[40];

   assign 	 fxu_areg_n_q[41] = ~fxu_areg_q[41];
   assign 	 fxu_breg_n_q[41] = ~fxu_breg_q[41];

   assign 	 fxu_areg_n_q[42] = ~fxu_areg_q[42];
   assign 	 fxu_breg_n_q[42] = ~fxu_breg_q[42];

   assign 	 fxu_areg_n_q[43] = ~fxu_areg_q[43];
   assign 	 fxu_breg_n_q[43] = ~fxu_breg_q[43];

   assign 	 fxu_areg_n_q[44] = ~fxu_areg_q[44];
   assign 	 fxu_breg_n_q[44] = ~fxu_breg_q[44];

   assign 	 fxu_areg_n_q[45] = ~fxu_areg_q[45];
   assign 	 fxu_breg_n_q[45] = ~fxu_breg_q[45];

   assign 	 fxu_areg_n_q[46] = ~fxu_areg_q[46];
   assign 	 fxu_breg_n_q[46] = ~fxu_breg_q[46];

   assign 	 fxu_areg_n_q[47] = ~fxu_areg_q[47];
   assign 	 fxu_breg_n_q[47] = ~fxu_breg_q[47];

   assign 	 fxu_areg_n_q[48] = ~fxu_areg_q[48];
   assign 	 fxu_breg_n_q[48] = ~fxu_breg_q[48];

   assign 	 fxu_areg_n_q[49] = ~fxu_areg_q[49];
   assign 	 fxu_breg_n_q[49] = ~fxu_breg_q[49];

   assign 	 fxu_areg_n_q[50] = ~fxu_areg_q[50];
   assign 	 fxu_breg_n_q[50] = ~fxu_breg_q[50];

   assign 	 fxu_areg_n_q[51] = ~fxu_areg_q[51];
   assign 	 fxu_breg_n_q[51] = ~fxu_breg_q[51];

   assign 	 fxu_areg_n_q[52] = ~fxu_areg_q[52];
   assign 	 fxu_breg_n_q[52] = ~fxu_breg_q[52];

   assign 	 fxu_areg_n_q[53] = ~fxu_areg_q[53];
   assign 	 fxu_breg_n_q[53] = ~fxu_breg_q[53];

   assign 	 fxu_areg_n_q[54] = ~fxu_areg_q[54];
   assign 	 fxu_breg_n_q[54] = ~fxu_breg_q[54];

   assign 	 fxu_areg_n_q[55] = ~fxu_areg_q[55];
   assign 	 fxu_breg_n_q[55] = ~fxu_breg_q[55];

   assign 	 fxu_areg_n_q[56] = ~fxu_areg_q[56];
   assign 	 fxu_breg_n_q[56] = ~fxu_breg_q[56];

   assign 	 fxu_areg_n_q[57] = ~fxu_areg_q[57];
   assign 	 fxu_breg_n_q[57] = ~fxu_breg_q[57];

   assign 	 fxu_areg_n_q[58] = ~fxu_areg_q[58];
   assign 	 fxu_breg_n_q[58] = ~fxu_breg_q[58];

   assign 	 fxu_areg_n_q[59] = ~fxu_areg_q[59];
   assign 	 fxu_breg_n_q[59] = ~fxu_breg_q[59];

   assign 	 fxu_areg_n_q[60] = ~fxu_areg_q[60];
   assign 	 fxu_breg_n_q[60] = ~fxu_breg_q[60];

   assign 	 fxu_areg_n_q[61] = ~fxu_areg_q[61];
   assign 	 fxu_breg_n_q[61] = ~fxu_breg_q[61];

   assign 	 fxu_areg_n_q[62] = ~fxu_areg_q[62];
   assign 	 fxu_breg_n_q[62] = ~fxu_breg_q[62];

   assign 	 fxu_areg_n_q[63] = ~fxu_areg_q[63];
   assign 	 fxu_breg_n_q[63] = ~fxu_breg_q[63];

   
   assign 	 a[8*0] = (bin_a_z_q || bin_by_f_e_q[0]) ? 1'b0 : fxu_areg_q[8*0];
   assign 	 a[8*0+1] = (bin_a_z_q || bin_by_f_e_q[0]) ? 1'b0 : fxu_areg_q[8*0+1];
   assign 	 a[8*0+2] = (bin_a_z_q || bin_by_f_e_q[0]) ? 1'b0 : fxu_areg_q[8*0+2];
   assign 	 a[8*0+3] = (bin_a_z_q || bin_by_f_e_q[0]) ? 1'b0 : fxu_areg_q[8*0+3];
   assign 	 a[8*0+4] = (bin_a_z_q || bin_by_f_e_q[0]) ? 1'b0 : fxu_areg_q[8*0+4];
   assign 	 a[8*0+5] = (bin_a_z_q || bin_by_f_e_q[0]) ? 1'b0 : fxu_areg_q[8*0+5];
   assign 	 a[8*0+6] = (bin_a_z_q || bin_by_f_e_q[0]) ? 1'b0 : fxu_areg_q[8*0+6];
   assign 	 a[8*0+7] = (bin_a_z_q || bin_by_f_e_q[0]) ? 1'b0 : fxu_areg_q[8*0+7];
   assign 	 a_n[8*0] = (bin_a_z_q || bin_by_f_e_q[0]) ? 1'b1 : fxu_areg_n_q[8*0];
   assign 	 a_n[8*0+1] = (bin_a_z_q || bin_by_f_e_q[0]) ? 1'b1 : fxu_areg_n_q[8*0+1];
   assign 	 a_n[8*0+2] = (bin_a_z_q || bin_by_f_e_q[0]) ? 1'b1 : fxu_areg_n_q[8*0+2];
   assign 	 a_n[8*0+3] = (bin_a_z_q || bin_by_f_e_q[0]) ? 1'b1 : fxu_areg_n_q[8*0+3];
   assign 	 a_n[8*0+4] = (bin_a_z_q || bin_by_f_e_q[0]) ? 1'b1 : fxu_areg_n_q[8*0+4];
   assign 	 a_n[8*0+5] = (bin_a_z_q || bin_by_f_e_q[0]) ? 1'b1 : fxu_areg_n_q[8*0+5];
   assign 	 a_n[8*0+6] = (bin_a_z_q || bin_by_f_e_q[0]) ? 1'b1 : fxu_areg_n_q[8*0+6];
   assign 	 a_n[8*0+7] = (bin_a_z_q || bin_by_f_e_q[0]) ? 1'b1 : fxu_areg_n_q[8*0+7];

   assign 	 a[8*1] = (bin_a_z_q || bin_by_f_e_q[1]) ? 1'b0 : fxu_areg_q[8*1];
   assign 	 a[8*1+1] = (bin_a_z_q || bin_by_f_e_q[1]) ? 1'b0 : fxu_areg_q[8*1+1];
   assign 	 a[8*1+2] = (bin_a_z_q || bin_by_f_e_q[1]) ? 1'b0 : fxu_areg_q[8*1+2];
   assign 	 a[8*1+3] = (bin_a_z_q || bin_by_f_e_q[1]) ? 1'b0 : fxu_areg_q[8*1+3];
   assign 	 a[8*1+4] = (bin_a_z_q || bin_by_f_e_q[1]) ? 1'b0 : fxu_areg_q[8*1+4];
   assign 	 a[8*1+5] = (bin_a_z_q || bin_by_f_e_q[1]) ? 1'b0 : fxu_areg_q[8*1+5];
   assign 	 a[8*1+6] = (bin_a_z_q || bin_by_f_e_q[1]) ? 1'b0 : fxu_areg_q[8*1+6];
   assign 	 a[8*1+7] = (bin_a_z_q || bin_by_f_e_q[1]) ? 1'b0 : fxu_areg_q[8*1+7];
   assign 	 a_n[8*1] = (bin_a_z_q || bin_by_f_e_q[1]) ? 1'b1 : fxu_areg_n_q[8*1];
   assign 	 a_n[8*1+1] = (bin_a_z_q || bin_by_f_e_q[1]) ? 1'b1 : fxu_areg_n_q[8*1+1];
   assign 	 a_n[8*1+2] = (bin_a_z_q || bin_by_f_e_q[1]) ? 1'b1 : fxu_areg_n_q[8*1+2];
   assign 	 a_n[8*1+3] = (bin_a_z_q || bin_by_f_e_q[1]) ? 1'b1 : fxu_areg_n_q[8*1+3];
   assign 	 a_n[8*1+4] = (bin_a_z_q || bin_by_f_e_q[1]) ? 1'b1 : fxu_areg_n_q[8*1+4];
   assign 	 a_n[8*1+5] = (bin_a_z_q || bin_by_f_e_q[1]) ? 1'b1 : fxu_areg_n_q[8*1+5];
   assign 	 a_n[8*1+6] = (bin_a_z_q || bin_by_f_e_q[1]) ? 1'b1 : fxu_areg_n_q[8*1+6];
   assign 	 a_n[8*1+7] = (bin_a_z_q || bin_by_f_e_q[1]) ? 1'b1 : fxu_areg_n_q[8*1+7];

   assign 	 a[8*2] = (bin_a_z_q || bin_by_f_e_q[2]) ? 1'b0 : fxu_areg_q[8*2];
   assign 	 a[8*2+1] = (bin_a_z_q || bin_by_f_e_q[2]) ? 1'b0 : fxu_areg_q[8*2+1];
   assign 	 a[8*2+2] = (bin_a_z_q || bin_by_f_e_q[2]) ? 1'b0 : fxu_areg_q[8*2+2];
   assign 	 a[8*2+3] = (bin_a_z_q || bin_by_f_e_q[2]) ? 1'b0 : fxu_areg_q[8*2+3];
   assign 	 a[8*2+4] = (bin_a_z_q || bin_by_f_e_q[2]) ? 1'b0 : fxu_areg_q[8*2+4];
   assign 	 a[8*2+5] = (bin_a_z_q || bin_by_f_e_q[2]) ? 1'b0 : fxu_areg_q[8*2+5];
   assign 	 a[8*2+6] = (bin_a_z_q || bin_by_f_e_q[2]) ? 1'b0 : fxu_areg_q[8*2+6];
   assign 	 a[8*2+7] = (bin_a_z_q || bin_by_f_e_q[2]) ? 1'b0 : fxu_areg_q[8*2+7];
   assign 	 a_n[8*2] = (bin_a_z_q || bin_by_f_e_q[2]) ? 1'b1 : fxu_areg_n_q[8*2];
   assign 	 a_n[8*2+1] = (bin_a_z_q || bin_by_f_e_q[2]) ? 1'b1 : fxu_areg_n_q[8*2+1];
   assign 	 a_n[8*2+2] = (bin_a_z_q || bin_by_f_e_q[2]) ? 1'b1 : fxu_areg_n_q[8*2+2];
   assign 	 a_n[8*2+3] = (bin_a_z_q || bin_by_f_e_q[2]) ? 1'b1 : fxu_areg_n_q[8*2+3];
   assign 	 a_n[8*2+4] = (bin_a_z_q || bin_by_f_e_q[2]) ? 1'b1 : fxu_areg_n_q[8*2+4];
   assign 	 a_n[8*2+5] = (bin_a_z_q || bin_by_f_e_q[2]) ? 1'b1 : fxu_areg_n_q[8*2+5];
   assign 	 a_n[8*2+6] = (bin_a_z_q || bin_by_f_e_q[2]) ? 1'b1 : fxu_areg_n_q[8*2+6];
   assign 	 a_n[8*2+7] = (bin_a_z_q || bin_by_f_e_q[2]) ? 1'b1 : fxu_areg_n_q[8*2+7];

   assign 	 a[8*3] = (bin_a_z_q || bin_by_f_e_q[3]) ? 1'b0 : fxu_areg_q[8*3];
   assign 	 a[8*3+1] = (bin_a_z_q || bin_by_f_e_q[3]) ? 1'b0 : fxu_areg_q[8*3+1];
   assign 	 a[8*3+2] = (bin_a_z_q || bin_by_f_e_q[3]) ? 1'b0 : fxu_areg_q[8*3+2];
   assign 	 a[8*3+3] = (bin_a_z_q || bin_by_f_e_q[3]) ? 1'b0 : fxu_areg_q[8*3+3];
   assign 	 a[8*3+4] = (bin_a_z_q || bin_by_f_e_q[3]) ? 1'b0 : fxu_areg_q[8*3+4];
   assign 	 a[8*3+5] = (bin_a_z_q || bin_by_f_e_q[3]) ? 1'b0 : fxu_areg_q[8*3+5];
   assign 	 a[8*3+6] = (bin_a_z_q || bin_by_f_e_q[3]) ? 1'b0 : fxu_areg_q[8*3+6];
   assign 	 a[8*3+7] = (bin_a_z_q || bin_by_f_e_q[3]) ? 1'b0 : fxu_areg_q[8*3+7];
   assign 	 a_n[8*3] = (bin_a_z_q || bin_by_f_e_q[3]) ? 1'b1 : fxu_areg_n_q[8*3];
   assign 	 a_n[8*3+1] = (bin_a_z_q || bin_by_f_e_q[3]) ? 1'b1 : fxu_areg_n_q[8*3+1];
   assign 	 a_n[8*3+2] = (bin_a_z_q || bin_by_f_e_q[3]) ? 1'b1 : fxu_areg_n_q[8*3+2];
   assign 	 a_n[8*3+3] = (bin_a_z_q || bin_by_f_e_q[3]) ? 1'b1 : fxu_areg_n_q[8*3+3];
   assign 	 a_n[8*3+4] = (bin_a_z_q || bin_by_f_e_q[3]) ? 1'b1 : fxu_areg_n_q[8*3+4];
   assign 	 a_n[8*3+5] = (bin_a_z_q || bin_by_f_e_q[3]) ? 1'b1 : fxu_areg_n_q[8*3+5];
   assign 	 a_n[8*3+6] = (bin_a_z_q || bin_by_f_e_q[3]) ? 1'b1 : fxu_areg_n_q[8*3+6];
   assign 	 a_n[8*3+7] = (bin_a_z_q || bin_by_f_e_q[3]) ? 1'b1 : fxu_areg_n_q[8*3+7];

   assign 	 a[8*4] = (bin_a_z_q || bin_by_f_e_q[4]) ? 1'b0 : fxu_areg_q[8*4];
   assign 	 a[8*4+1] = (bin_a_z_q || bin_by_f_e_q[4]) ? 1'b0 : fxu_areg_q[8*4+1];
   assign 	 a[8*4+2] = (bin_a_z_q || bin_by_f_e_q[4]) ? 1'b0 : fxu_areg_q[8*4+2];
   assign 	 a[8*4+3] = (bin_a_z_q || bin_by_f_e_q[4]) ? 1'b0 : fxu_areg_q[8*4+3];
   assign 	 a[8*4+4] = (bin_a_z_q || bin_by_f_e_q[4]) ? 1'b0 : fxu_areg_q[8*4+4];
   assign 	 a[8*4+5] = (bin_a_z_q || bin_by_f_e_q[4]) ? 1'b0 : fxu_areg_q[8*4+5];
   assign 	 a[8*4+6] = (bin_a_z_q || bin_by_f_e_q[4]) ? 1'b0 : fxu_areg_q[8*4+6];
   assign 	 a[8*4+7] = (bin_a_z_q || bin_by_f_e_q[4]) ? 1'b0 : fxu_areg_q[8*4+7];
   assign 	 a_n[8*4] = (bin_a_z_q || bin_by_f_e_q[4]) ? 1'b1 : fxu_areg_n_q[8*4];
   assign 	 a_n[8*4+1] = (bin_a_z_q || bin_by_f_e_q[4]) ? 1'b1 : fxu_areg_n_q[8*4+1];
   assign 	 a_n[8*4+2] = (bin_a_z_q || bin_by_f_e_q[4]) ? 1'b1 : fxu_areg_n_q[8*4+2];
   assign 	 a_n[8*4+3] = (bin_a_z_q || bin_by_f_e_q[4]) ? 1'b1 : fxu_areg_n_q[8*4+3];
   assign 	 a_n[8*4+4] = (bin_a_z_q || bin_by_f_e_q[4]) ? 1'b1 : fxu_areg_n_q[8*4+4];
   assign 	 a_n[8*4+5] = (bin_a_z_q || bin_by_f_e_q[4]) ? 1'b1 : fxu_areg_n_q[8*4+5];
   assign 	 a_n[8*4+6] = (bin_a_z_q || bin_by_f_e_q[4]) ? 1'b1 : fxu_areg_n_q[8*4+6];
   assign 	 a_n[8*4+7] = (bin_a_z_q || bin_by_f_e_q[4]) ? 1'b1 : fxu_areg_n_q[8*4+7];

   assign 	 a[8*5] = (bin_a_z_q || bin_by_f_e_q[5]) ? 1'b0 : fxu_areg_q[8*5];
   assign 	 a[8*5+1] = (bin_a_z_q || bin_by_f_e_q[5]) ? 1'b0 : fxu_areg_q[8*5+1];
   assign 	 a[8*5+2] = (bin_a_z_q || bin_by_f_e_q[5]) ? 1'b0 : fxu_areg_q[8*5+2];
   assign 	 a[8*5+3] = (bin_a_z_q || bin_by_f_e_q[5]) ? 1'b0 : fxu_areg_q[8*5+3];
   assign 	 a[8*5+4] = (bin_a_z_q || bin_by_f_e_q[5]) ? 1'b0 : fxu_areg_q[8*5+4];
   assign 	 a[8*5+5] = (bin_a_z_q || bin_by_f_e_q[5]) ? 1'b0 : fxu_areg_q[8*5+5];
   assign 	 a[8*5+6] = (bin_a_z_q || bin_by_f_e_q[5]) ? 1'b0 : fxu_areg_q[8*5+6];
   assign 	 a[8*5+7] = (bin_a_z_q || bin_by_f_e_q[5]) ? 1'b0 : fxu_areg_q[8*5+7];
   assign 	 a_n[8*5] = (bin_a_z_q || bin_by_f_e_q[5]) ? 1'b1 : fxu_areg_n_q[8*5];
   assign 	 a_n[8*5+1] = (bin_a_z_q || bin_by_f_e_q[5]) ? 1'b1 : fxu_areg_n_q[8*5+1];
   assign 	 a_n[8*5+2] = (bin_a_z_q || bin_by_f_e_q[5]) ? 1'b1 : fxu_areg_n_q[8*5+2];
   assign 	 a_n[8*5+3] = (bin_a_z_q || bin_by_f_e_q[5]) ? 1'b1 : fxu_areg_n_q[8*5+3];
   assign 	 a_n[8*5+4] = (bin_a_z_q || bin_by_f_e_q[5]) ? 1'b1 : fxu_areg_n_q[8*5+4];
   assign 	 a_n[8*5+5] = (bin_a_z_q || bin_by_f_e_q[5]) ? 1'b1 : fxu_areg_n_q[8*5+5];
   assign 	 a_n[8*5+6] = (bin_a_z_q || bin_by_f_e_q[5]) ? 1'b1 : fxu_areg_n_q[8*5+6];
   assign 	 a_n[8*5+7] = (bin_a_z_q || bin_by_f_e_q[5]) ? 1'b1 : fxu_areg_n_q[8*5+7];

   assign 	 a[8*6] = (bin_a_z_q || bin_by_f_e_q[6]) ? 1'b0 : fxu_areg_q[8*6];
   assign 	 a[8*6+1] = (bin_a_z_q || bin_by_f_e_q[6]) ? 1'b0 : fxu_areg_q[8*6+1];
   assign 	 a[8*6+2] = (bin_a_z_q || bin_by_f_e_q[6]) ? 1'b0 : fxu_areg_q[8*6+2];
   assign 	 a[8*6+3] = (bin_a_z_q || bin_by_f_e_q[6]) ? 1'b0 : fxu_areg_q[8*6+3];
   assign 	 a[8*6+4] = (bin_a_z_q || bin_by_f_e_q[6]) ? 1'b0 : fxu_areg_q[8*6+4];
   assign 	 a[8*6+5] = (bin_a_z_q || bin_by_f_e_q[6]) ? 1'b0 : fxu_areg_q[8*6+5];
   assign 	 a[8*6+6] = (bin_a_z_q || bin_by_f_e_q[6]) ? 1'b0 : fxu_areg_q[8*6+6];
   assign 	 a[8*6+7] = (bin_a_z_q || bin_by_f_e_q[6]) ? 1'b0 : fxu_areg_q[8*6+7];
   assign 	 a_n[8*6] = (bin_a_z_q || bin_by_f_e_q[6]) ? 1'b1 : fxu_areg_n_q[8*6];
   assign 	 a_n[8*6+1] = (bin_a_z_q || bin_by_f_e_q[6]) ? 1'b1 : fxu_areg_n_q[8*6+1];
   assign 	 a_n[8*6+2] = (bin_a_z_q || bin_by_f_e_q[6]) ? 1'b1 : fxu_areg_n_q[8*6+2];
   assign 	 a_n[8*6+3] = (bin_a_z_q || bin_by_f_e_q[6]) ? 1'b1 : fxu_areg_n_q[8*6+3];
   assign 	 a_n[8*6+4] = (bin_a_z_q || bin_by_f_e_q[6]) ? 1'b1 : fxu_areg_n_q[8*6+4];
   assign 	 a_n[8*6+5] = (bin_a_z_q || bin_by_f_e_q[6]) ? 1'b1 : fxu_areg_n_q[8*6+5];
   assign 	 a_n[8*6+6] = (bin_a_z_q || bin_by_f_e_q[6]) ? 1'b1 : fxu_areg_n_q[8*6+6];
   assign 	 a_n[8*6+7] = (bin_a_z_q || bin_by_f_e_q[6]) ? 1'b1 : fxu_areg_n_q[8*6+7];

   assign 	 a[8*7] = (bin_a_z_q || bin_by_f_e_q[7]) ? 1'b0 : fxu_areg_q[8*7];
   assign 	 a[8*7+1] = (bin_a_z_q || bin_by_f_e_q[7]) ? 1'b0 : fxu_areg_q[8*7+1];
   assign 	 a[8*7+2] = (bin_a_z_q || bin_by_f_e_q[7]) ? 1'b0 : fxu_areg_q[8*7+2];
   assign 	 a[8*7+3] = (bin_a_z_q || bin_by_f_e_q[7]) ? 1'b0 : fxu_areg_q[8*7+3];
   assign 	 a[8*7+4] = (bin_a_z_q || bin_by_f_e_q[7]) ? 1'b0 : fxu_areg_q[8*7+4];
   assign 	 a[8*7+5] = (bin_a_z_q || bin_by_f_e_q[7]) ? 1'b0 : fxu_areg_q[8*7+5];
   assign 	 a[8*7+6] = (bin_a_z_q || bin_by_f_e_q[7]) ? 1'b0 : fxu_areg_q[8*7+6];
   assign 	 a[8*7+7] = (bin_a_z_q || bin_by_f_e_q[7]) ? 1'b0 : fxu_areg_q[8*7+7];
   assign 	 a_n[8*7] = (bin_a_z_q || bin_by_f_e_q[7]) ? 1'b1 : fxu_areg_n_q[8*7];
   assign 	 a_n[8*7+1] = (bin_a_z_q || bin_by_f_e_q[7]) ? 1'b1 : fxu_areg_n_q[8*7+1];
   assign 	 a_n[8*7+2] = (bin_a_z_q || bin_by_f_e_q[7]) ? 1'b1 : fxu_areg_n_q[8*7+2];
   assign 	 a_n[8*7+3] = (bin_a_z_q || bin_by_f_e_q[7]) ? 1'b1 : fxu_areg_n_q[8*7+3];
   assign 	 a_n[8*7+4] = (bin_a_z_q || bin_by_f_e_q[7]) ? 1'b1 : fxu_areg_n_q[8*7+4];
   assign 	 a_n[8*7+5] = (bin_a_z_q || bin_by_f_e_q[7]) ? 1'b1 : fxu_areg_n_q[8*7+5];
   assign 	 a_n[8*7+6] = (bin_a_z_q || bin_by_f_e_q[7]) ? 1'b1 : fxu_areg_n_q[8*7+6];
   assign 	 a_n[8*7+7] = (bin_a_z_q || bin_by_f_e_q[7]) ? 1'b1 : fxu_areg_n_q[8*7+7];


   assign 	 b[8*0] = (bin_by_f_e_q[0]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*0] : fxu_breg_q[8*0];
   assign 	 b[8*0+1] = (bin_by_f_e_q[0]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*0+1] : fxu_breg_q[8*0+1];
   assign 	 b[8*0+2] = (bin_by_f_e_q[0]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*0+2] : fxu_breg_q[8*0+2];
   assign 	 b[8*0+3] = (bin_by_f_e_q[0]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*0+3] : fxu_breg_q[8*0+3];
   assign 	 b[8*0+4] = (bin_by_f_e_q[0]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*0+4] : fxu_breg_q[8*0+4];
   assign 	 b[8*0+5] = (bin_by_f_e_q[0]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*0+5] : fxu_breg_q[8*0+5];
   assign 	 b[8*0+6] = (bin_by_f_e_q[0]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*0+6] : fxu_breg_q[8*0+6];
   assign 	 b[8*0+7] = (bin_by_f_e_q[0]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*0+7] : fxu_breg_q[8*0+7];
   assign  	 b_n[8*0] = (bin_by_f_e_q[0]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*0] : fxu_breg_n_q[8*0];
   assign 	 b_n[8*0+1] = (bin_by_f_e_q[0]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*0+1] : fxu_breg_n_q[8*0+1];
   assign 	 b_n[8*0+2] = (bin_by_f_e_q[0]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*0+2] : fxu_breg_n_q[8*0+2];
   assign 	 b_n[8*0+3] = (bin_by_f_e_q[0]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*0+3] : fxu_breg_n_q[8*0+3];
   assign 	 b_n[8*0+4] = (bin_by_f_e_q[0]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*0+4] : fxu_breg_n_q[8*0+4];
   assign 	 b_n[8*0+5] = (bin_by_f_e_q[0]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*0+5] : fxu_breg_n_q[8*0+5];
   assign 	 b_n[8*0+6] = (bin_by_f_e_q[0]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*0+6] : fxu_breg_n_q[8*0+6];
   assign 	 b_n[8*0+7] = (bin_by_f_e_q[0]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*0+7] : fxu_breg_n_q[8*0+7];

   assign 	 b[8*1] = (bin_by_f_e_q[1]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*1] : fxu_breg_q[8*1];
   assign 	 b[8*1+1] = (bin_by_f_e_q[1]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*1+1] : fxu_breg_q[8*1+1];
   assign 	 b[8*1+2] = (bin_by_f_e_q[1]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*1+2] : fxu_breg_q[8*1+2];
   assign 	 b[8*1+3] = (bin_by_f_e_q[1]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*1+3] : fxu_breg_q[8*1+3];
   assign 	 b[8*1+4] = (bin_by_f_e_q[1]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*1+4] : fxu_breg_q[8*1+4];
   assign 	 b[8*1+5] = (bin_by_f_e_q[1]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*1+5] : fxu_breg_q[8*1+5];
   assign 	 b[8*1+6] = (bin_by_f_e_q[1]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*1+6] : fxu_breg_q[8*1+6];
   assign 	 b[8*1+7] = (bin_by_f_e_q[1]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*1+7] : fxu_breg_q[8*1+7];
   assign  	 b_n[8*1] = (bin_by_f_e_q[1]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*1] : fxu_breg_n_q[8*1];
   assign 	 b_n[8*1+1] = (bin_by_f_e_q[1]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*1+1] : fxu_breg_n_q[8*1+1];
   assign 	 b_n[8*1+2] = (bin_by_f_e_q[1]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*1+2] : fxu_breg_n_q[8*1+2];
   assign 	 b_n[8*1+3] = (bin_by_f_e_q[1]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*1+3] : fxu_breg_n_q[8*1+3];
   assign 	 b_n[8*1+4] = (bin_by_f_e_q[1]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*1+4] : fxu_breg_n_q[8*1+4];
   assign 	 b_n[8*1+5] = (bin_by_f_e_q[1]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*1+5] : fxu_breg_n_q[8*1+5];
   assign 	 b_n[8*1+6] = (bin_by_f_e_q[1]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*1+6] : fxu_breg_n_q[8*1+6];
   assign 	 b_n[8*1+7] = (bin_by_f_e_q[1]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*1+7] : fxu_breg_n_q[8*1+7];

   assign 	 b[8*2] = (bin_by_f_e_q[2]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*2] : fxu_breg_q[8*2];
   assign 	 b[8*2+1] = (bin_by_f_e_q[2]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*2+1] : fxu_breg_q[8*2+1];
   assign 	 b[8*2+2] = (bin_by_f_e_q[2]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*2+2] : fxu_breg_q[8*2+2];
   assign 	 b[8*2+3] = (bin_by_f_e_q[2]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*2+3] : fxu_breg_q[8*2+3];
   assign 	 b[8*2+4] = (bin_by_f_e_q[2]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*2+4] : fxu_breg_q[8*2+4];
   assign 	 b[8*2+5] = (bin_by_f_e_q[2]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*2+5] : fxu_breg_q[8*2+5];
   assign 	 b[8*2+6] = (bin_by_f_e_q[2]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*2+6] : fxu_breg_q[8*2+6];
   assign 	 b[8*2+7] = (bin_by_f_e_q[2]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*2+7] : fxu_breg_q[8*2+7];
   assign  	 b_n[8*2] = (bin_by_f_e_q[2]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*2] : fxu_breg_n_q[8*2];
   assign 	 b_n[8*2+1] = (bin_by_f_e_q[2]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*2+1] : fxu_breg_n_q[8*2+1];
   assign 	 b_n[8*2+2] = (bin_by_f_e_q[2]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*2+2] : fxu_breg_n_q[8*2+2];
   assign 	 b_n[8*2+3] = (bin_by_f_e_q[2]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*2+3] : fxu_breg_n_q[8*2+3];
   assign 	 b_n[8*2+4] = (bin_by_f_e_q[2]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*2+4] : fxu_breg_n_q[8*2+4];
   assign 	 b_n[8*2+5] = (bin_by_f_e_q[2]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*2+5] : fxu_breg_n_q[8*2+5];
   assign 	 b_n[8*2+6] = (bin_by_f_e_q[2]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*2+6] : fxu_breg_n_q[8*2+6];
   assign 	 b_n[8*2+7] = (bin_by_f_e_q[2]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*2+7] : fxu_breg_n_q[8*2+7];

   assign 	 b[8*3] = (bin_by_f_e_q[3]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*3] : fxu_breg_q[8*3];
   assign 	 b[8*3+1] = (bin_by_f_e_q[3]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*3+1] : fxu_breg_q[8*3+1];
   assign 	 b[8*3+2] = (bin_by_f_e_q[3]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*3+2] : fxu_breg_q[8*3+2];
   assign 	 b[8*3+3] = (bin_by_f_e_q[3]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*3+3] : fxu_breg_q[8*3+3];
   assign 	 b[8*3+4] = (bin_by_f_e_q[3]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*3+4] : fxu_breg_q[8*3+4];
   assign 	 b[8*3+5] = (bin_by_f_e_q[3]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*3+5] : fxu_breg_q[8*3+5];
   assign 	 b[8*3+6] = (bin_by_f_e_q[3]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*3+6] : fxu_breg_q[8*3+6];
   assign 	 b[8*3+7] = (bin_by_f_e_q[3]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*3+7] : fxu_breg_q[8*3+7];
   assign  	 b_n[8*3] = (bin_by_f_e_q[3]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*3] : fxu_breg_n_q[8*3];
   assign 	 b_n[8*3+1] = (bin_by_f_e_q[3]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*3+1] : fxu_breg_n_q[8*3+1];
   assign 	 b_n[8*3+2] = (bin_by_f_e_q[3]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*3+2] : fxu_breg_n_q[8*3+2];
   assign 	 b_n[8*3+3] = (bin_by_f_e_q[3]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*3+3] : fxu_breg_n_q[8*3+3];
   assign 	 b_n[8*3+4] = (bin_by_f_e_q[3]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*3+4] : fxu_breg_n_q[8*3+4];
   assign 	 b_n[8*3+5] = (bin_by_f_e_q[3]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*3+5] : fxu_breg_n_q[8*3+5];
   assign 	 b_n[8*3+6] = (bin_by_f_e_q[3]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*3+6] : fxu_breg_n_q[8*3+6];
   assign 	 b_n[8*3+7] = (bin_by_f_e_q[3]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*3+7] : fxu_breg_n_q[8*3+7];
	
   assign 	 b[8*6] = (bin_by_f_e_q[6]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*6] : fxu_breg_q[8*6];
   assign  	 b[8*6+1] = (bin_by_f_e_q[6]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*6+1] : fxu_breg_q[8*6+1];
   assign 	 b[8*6+2] = (bin_by_f_e_q[6]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*6+2] : fxu_breg_q[8*6+2];

   // this was the site of bug 1(local error found).  this is the corrected version
   assign 	 b[8*6+3] = (bin_by_f_e_q[6]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*6+3] : fxu_breg_q[8*6+3];
   
   assign 	 b[8*6+4] = (bin_by_f_e_q[6]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*6+4] : fxu_breg_q[8*6+4];
   assign 	 b[8*6+5] = (bin_by_f_e_q[6]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*6+5] : fxu_breg_q[8*6+5];
   assign 	 b[8*6+6] = (bin_by_f_e_q[6]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*6+6] : fxu_breg_q[8*6+6];
   assign 	 b[8*6+7] = (bin_by_f_e_q[6]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*6+7] : fxu_breg_q[8*6+7];
   assign 	 b_n[8*6] = (bin_by_f_e_q[6]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*6] : fxu_breg_n_q[8*6];
   assign 	 b_n[8*6+1] = (bin_by_f_e_q[6]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*6+1] : fxu_breg_n_q[8*6+1];
   assign 	 b_n[8*6+2] = (bin_by_f_e_q[6]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*6+2] : fxu_breg_n_q[8*6+2];
   assign 	 b_n[8*6+3] = (bin_by_f_e_q[6]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*6+3] : fxu_breg_n_q[8*6+3];
   assign 	 b_n[8*6+4] = (bin_by_f_e_q[6]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*6+4] : fxu_breg_n_q[8*6+4];
   assign 	 b_n[8*6+5] = (bin_by_f_e_q[6]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*6+5] : fxu_breg_n_q[8*6+5];
   assign 	 b_n[8*6+6] = (bin_by_f_e_q[6]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*6+6] : fxu_breg_n_q[8*6+6];
   assign 	 b_n[8*6+7] = (bin_by_f_e_q[6]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*6+7] : fxu_breg_n_q[8*6+7];

   assign 	 b[8*7+0] = (bin_by_f_e_q[7]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*7+0] : fxu_breg_q[8*7+0];
   assign  	 b[8*7+1] = (bin_by_f_e_q[7]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*7+1] : fxu_breg_q[8*7+1];
   assign 	 b[8*7+2] = (bin_by_f_e_q[7]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*7+2] : fxu_breg_q[8*7+2];

   // this was the site of bug 1(local error found).  this is the corrected version
   assign 	 b[8*7+3] = (bin_by_f_e_q[7]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*7+3] : fxu_breg_q[8*7+3];
   
   assign 	 b[8*7+4] = (bin_by_f_e_q[7]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*7+4] : fxu_breg_q[8*7+4];
   assign 	 b[8*7+5] = (bin_by_f_e_q[7]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*7+5] : fxu_breg_q[8*7+5];
   assign 	 b[8*7+6] = (bin_by_f_e_q[7]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*7+6] : fxu_breg_q[8*7+6];
   assign 	 b[8*7+7] = (bin_by_f_e_q[7]) ? 1'b1 : (bin_sub_q) ? fxu_breg_n_q[8*7+7] : fxu_breg_q[8*7+7];
   assign 	 b_n[8*7+0] = (bin_by_f_e_q[7]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*7+0] : fxu_breg_n_q[8*7+0];
   assign 	 b_n[8*7+1] = (bin_by_f_e_q[7]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*7+1] : fxu_breg_n_q[8*7+1];
   assign 	 b_n[8*7+2] = (bin_by_f_e_q[7]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*7+2] : fxu_breg_n_q[8*7+2];
   assign 	 b_n[8*7+3] = (bin_by_f_e_q[7]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*7+3] : fxu_breg_n_q[8*7+3];
   assign 	 b_n[8*7+4] = (bin_by_f_e_q[7]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*7+4] : fxu_breg_n_q[8*7+4];
   assign 	 b_n[8*7+5] = (bin_by_f_e_q[7]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*7+5] : fxu_breg_n_q[8*7+5];
   assign 	 b_n[8*7+6] = (bin_by_f_e_q[7]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*7+6] : fxu_breg_n_q[8*7+6];
   assign 	 b_n[8*7+7] = (bin_by_f_e_q[7]) ? 1'b0 : (bin_sub_q) ? fxu_breg_q[8*7+7] : fxu_breg_n_q[8*7+7];

   assign   	 b[8*4] = (bin_ex_sign_op_q) ? bin_ex_sign_q : (bin_by_f_e_q[4]) ? 1'b1 : (bin_sub_45_q) ? fxu_breg_n_q[8*4] : (bin_add_45_q) ? fxu_breg_q[8*4] : 1'b0;
   assign 	 b[8*4+1] = (bin_ex_sign_op_q) ? bin_ex_sign_q : (bin_by_f_e_q[4]) ? 1'b1 : (bin_sub_45_q) ? fxu_breg_n_q[8*4+1] : (bin_add_45_q) ? fxu_breg_q[8*4+1] : 1'b0;
   assign 	 b[8*4+2] = (bin_ex_sign_op_q) ? bin_ex_sign_q : (bin_by_f_e_q[4]) ? 1'b1 : (bin_sub_45_q) ? fxu_breg_n_q[8*4+2] : (bin_add_45_q) ? fxu_breg_q[8*4+2] : 1'b0;
   assign 	 b[8*4+3] = (bin_ex_sign_op_q) ? bin_ex_sign_q : (bin_by_f_e_q[4]) ? 1'b1 : (bin_sub_45_q) ? fxu_breg_n_q[8*4+3] : (bin_add_45_q) ? fxu_breg_q[8*4+3] : 1'b0;
   assign 	 b[8*4+4] = (bin_ex_sign_op_q) ? bin_ex_sign_q : (bin_by_f_e_q[4]) ? 1'b1 : (bin_sub_45_q) ? fxu_breg_n_q[8*4+4] : (bin_add_45_q) ? fxu_breg_q[8*4+4] : 1'b0;
   assign 	 b[8*4+5] = (bin_ex_sign_op_q) ? bin_ex_sign_q : (bin_by_f_e_q[4]) ? 1'b1 : (bin_sub_45_q) ? fxu_breg_n_q[8*4+5] : (bin_add_45_q) ? fxu_breg_q[8*4+5] : 1'b0;
   assign 	 b[8*4+6] = (bin_ex_sign_op_q) ? bin_ex_sign_q : (bin_by_f_e_q[4]) ? 1'b1 : (bin_sub_45_q) ? fxu_breg_n_q[8*4+6] : (bin_add_45_q) ? fxu_breg_q[8*4+6] : 1'b0;
   assign 	 b[8*4+7] = (bin_ex_sign_op_q) ? bin_ex_sign_q : (bin_by_f_e_q[4]) ? 1'b1 : (bin_sub_45_q) ? fxu_breg_n_q[8*4+7] : (bin_add_45_q) ? fxu_breg_q[8*4+7] : 1'b0;
   assign 	 b_n[8*4] = (bin_ex_sign_op_q) ? ~bin_ex_sign_q : (bin_by_f_e_q[4]) ? 1'b0 : (bin_sub_45_q) ? fxu_breg_q[8*4] : (bin_add_45_q) ? fxu_breg_n_q[8*4] : 1'b0;
   assign 	 b_n[8*4+1] = (bin_ex_sign_op_q) ? ~bin_ex_sign_q : (bin_by_f_e_q[4]) ? 1'b0 : (bin_sub_45_q) ? fxu_breg_q[8*4+1] : (bin_add_45_q) ? fxu_breg_n_q[8*4+1] : 1'b0;
   assign 	 b_n[8*4+2] = (bin_ex_sign_op_q) ? ~bin_ex_sign_q : (bin_by_f_e_q[4]) ? 1'b0 : (bin_sub_45_q) ? fxu_breg_q[8*4+2] : (bin_add_45_q) ? fxu_breg_n_q[8*4+2] : 1'b0;
   assign 	 b_n[8*4+3] = (bin_ex_sign_op_q) ? ~bin_ex_sign_q : (bin_by_f_e_q[4]) ? 1'b0 : (bin_sub_45_q) ? fxu_breg_q[8*4+3] : (bin_add_45_q) ? fxu_breg_n_q[8*4+3] : 1'b0;
   assign 	 b_n[8*4+4] = (bin_ex_sign_op_q) ? ~bin_ex_sign_q : (bin_by_f_e_q[4]) ? 1'b0 : (bin_sub_45_q) ? fxu_breg_q[8*4+4] : (bin_add_45_q) ? fxu_breg_n_q[8*4+4] : 1'b0;
   assign 	 b_n[8*4+5] = (bin_ex_sign_op_q) ? ~bin_ex_sign_q : (bin_by_f_e_q[4]) ? 1'b0 : (bin_sub_45_q) ? fxu_breg_q[8*4+5] : (bin_add_45_q) ? fxu_breg_n_q[8*4+5] : 1'b0;
   assign 	 b_n[8*4+6] = (bin_ex_sign_op_q) ? ~bin_ex_sign_q : (bin_by_f_e_q[4]) ? 1'b0 : (bin_sub_45_q) ? fxu_breg_q[8*4+6] : (bin_add_45_q) ? fxu_breg_n_q[8*4+6] : 1'b0;
   assign 	 b_n[8*4+7] = (bin_ex_sign_op_q) ? ~bin_ex_sign_q : (bin_by_f_e_q[4]) ? 1'b0 : (bin_sub_45_q) ? fxu_breg_q[8*4+7] : (bin_add_45_q) ? fxu_breg_n_q[8*4+7] : 1'b0;

   assign   	 b[8*5] = (bin_ex_sign_op_q) ? bin_ex_sign_q : (bin_by_f_e_q[5]) ? 1'b1 : (bin_sub_45_q) ? fxu_breg_n_q[8*5] : (bin_add_45_q) ? fxu_breg_q[8*5] : 1'b0;
   assign 	 b[8*5+1] = (bin_ex_sign_op_q) ? bin_ex_sign_q : (bin_by_f_e_q[5]) ? 1'b1 : (bin_sub_45_q) ? fxu_breg_n_q[8*5+1] : (bin_add_45_q) ? fxu_breg_q[8*5+1] : 1'b0;
   assign 	 b[8*5+2] = (bin_ex_sign_op_q) ? bin_ex_sign_q : (bin_by_f_e_q[5]) ? 1'b1 : (bin_sub_45_q) ? fxu_breg_n_q[8*5+2] : (bin_add_45_q) ? fxu_breg_q[8*5+2] : 1'b0;
   assign 	 b[8*5+3] = (bin_ex_sign_op_q) ? bin_ex_sign_q : (bin_by_f_e_q[5]) ? 1'b1 : (bin_sub_45_q) ? fxu_breg_n_q[8*5+3] : (bin_add_45_q) ? fxu_breg_q[8*5+3] : 1'b0;
   assign 	 b[8*5+4] = (bin_ex_sign_op_q) ? bin_ex_sign_q : (bin_by_f_e_q[5]) ? 1'b1 : (bin_sub_45_q) ? fxu_breg_n_q[8*5+4] : (bin_add_45_q) ? fxu_breg_q[8*5+4] : 1'b0;
   assign 	 b[8*5+5] = (bin_ex_sign_op_q) ? bin_ex_sign_q : (bin_by_f_e_q[5]) ? 1'b1 : (bin_sub_45_q) ? fxu_breg_n_q[8*5+5] : (bin_add_45_q) ? fxu_breg_q[8*5+5] : 1'b0;
   assign 	 b[8*5+6] = (bin_ex_sign_op_q) ? bin_ex_sign_q : (bin_by_f_e_q[5]) ? 1'b1 : (bin_sub_45_q) ? fxu_breg_n_q[8*5+6] : (bin_add_45_q) ? fxu_breg_q[8*5+6] : 1'b0;
   assign 	 b[8*5+7] = (bin_ex_sign_op_q) ? bin_ex_sign_q : (bin_by_f_e_q[5]) ? 1'b1 : (bin_sub_45_q) ? fxu_breg_n_q[8*5+7] : (bin_add_45_q) ? fxu_breg_q[8*5+7] : 1'b0;
   assign 	 b_n[8*5] = (bin_ex_sign_op_q) ? ~bin_ex_sign_q : (bin_by_f_e_q[5]) ? 1'b0 : (bin_sub_45_q) ? fxu_breg_q[8*5] : (bin_add_45_q) ? fxu_breg_n_q[8*5] : 1'b0;
   assign 	 b_n[8*5+1] = (bin_ex_sign_op_q) ? ~bin_ex_sign_q : (bin_by_f_e_q[5]) ? 1'b0 : (bin_sub_45_q) ? fxu_breg_q[8*5+1] : (bin_add_45_q) ? fxu_breg_n_q[8*5+1] : 1'b0;
   assign 	 b_n[8*5+2] = (bin_ex_sign_op_q) ? ~bin_ex_sign_q : (bin_by_f_e_q[5]) ? 1'b0 : (bin_sub_45_q) ? fxu_breg_q[8*5+2] : (bin_add_45_q) ? fxu_breg_n_q[8*5+2] : 1'b0;
   assign 	 b_n[8*5+3] = (bin_ex_sign_op_q) ? ~bin_ex_sign_q : (bin_by_f_e_q[5]) ? 1'b0 : (bin_sub_45_q) ? fxu_breg_q[8*5+3] : (bin_add_45_q) ? fxu_breg_n_q[8*5+3] : 1'b0;
   assign 	 b_n[8*5+4] = (bin_ex_sign_op_q) ? ~bin_ex_sign_q : (bin_by_f_e_q[5]) ? 1'b0 : (bin_sub_45_q) ? fxu_breg_q[8*5+4] : (bin_add_45_q) ? fxu_breg_n_q[8*5+4] : 1'b0;
   assign 	 b_n[8*5+5] = (bin_ex_sign_op_q) ? ~bin_ex_sign_q : (bin_by_f_e_q[5]) ? 1'b0 : (bin_sub_45_q) ? fxu_breg_q[8*5+5] : (bin_add_45_q) ? fxu_breg_n_q[8*5+5] : 1'b0;
   assign 	 b_n[8*5+6] = (bin_ex_sign_op_q) ? ~bin_ex_sign_q : (bin_by_f_e_q[5]) ? 1'b0 : (bin_sub_45_q) ? fxu_breg_q[8*5+6] : (bin_add_45_q) ? fxu_breg_n_q[8*5+6] : 1'b0;
   assign 	 b_n[8*5+7] = (bin_ex_sign_op_q) ? ~bin_ex_sign_q : (bin_by_f_e_q[5]) ? 1'b0 : (bin_sub_45_q) ? fxu_breg_q[8*5+7] : (bin_add_45_q) ? fxu_breg_n_q[8*5+7] : 1'b0;

   assign 	 c[64] = bin_cin_q;
   assign 	 c_n[64] = (~bin_cin_q);

   assign	 bruce_bin_sum[0] = (b_n[0] & a_n[0] & c[0+1]) | (b_n[0] & a[0] & c_n[0+1]) | (b[0] & a_n[0] & c_n[0+1]) | (b[0] & a[0] & c[0+1]);
   assign 	 p[0] = a[0] | b[0];
   assign	 p_n[0] = ~p[0];
   assign 	 g[0] = a[0] & b[0];
   assign	 h_n[0] = g[0] | p_n[0];

    assign	 bruce_bin_sum[1] = (b_n[1] & a_n[1] & c[1+1]) | (b_n[1] & a[1] & c_n[1+1]) | (b[1] & a_n[1] & c_n[1+1]) | (b[1] & a[1] & c[1+1]);
   assign 	 p[1] = a[1] | b[1];
   assign	 p_n[1] = ~p[1];
   assign 	 g[1] = a[1] & b[1];
   assign	 h_n[1] = g[1] | p_n[1];

    assign	 bruce_bin_sum[2] = (b_n[2] & a_n[2] & c[2+1]) | (b_n[2] & a[2] & c_n[2+1]) | (b[2] & a_n[2] & c_n[2+1]) | (b[2] & a[2] & c[2+1]);
   assign 	 p[2] = a[2] | b[2];
   assign	 p_n[2] = ~p[2];
   assign 	 g[2] = a[2] & b[2];
   assign	 h_n[2] = g[2] | p_n[2];

    assign	 bruce_bin_sum[3] = (b_n[3] & a_n[3] & c[3+1]) | (b_n[3] & a[3] & c_n[3+1]) | (b[3] & a_n[3] & c_n[3+1]) | (b[3] & a[3] & c[3+1]);
   assign 	 p[3] = a[3] | b[3];
   assign	 p_n[3] = ~p[3];
   assign 	 g[3] = a[3] & b[3];
   assign	 h_n[3] = g[3] | p_n[3];

    assign	 bruce_bin_sum[4] = (b_n[4] & a_n[4] & c[4+1]) | (b_n[4] & a[4] & c_n[4+1]) | (b[4] & a_n[4] & c_n[4+1]) | (b[4] & a[4] & c[4+1]);
   assign 	 p[4] = a[4] | b[4];
   assign	 p_n[4] = ~p[4];
   assign 	 g[4] = a[4] & b[4];
   assign	 h_n[4] = g[4] | p_n[4];

   assign	 bruce_bin_sum[5] = (b_n[5] & a_n[5] & c[5+1]) | (b_n[5] & a[5] & c_n[5+1]) | (b[5] & a_n[5] & c_n[5+1]) | (b[5] & a[5] & c[5+1]);
   assign 	 p[5] = a[5] | b[5];
   assign	 p_n[5] = ~p[5];
   assign 	 g[5] = a[5] & b[5];
   assign	 h_n[5] = g[5] | p_n[5];

   assign	 bruce_bin_sum[6] = (b_n[6] & a_n[6] & c[6+1]) | (b_n[6] & a[6] & c_n[6+1]) | (b[6] & a_n[6] & c_n[6+1]) | (b[6] & a[6] & c[6+1]);
   assign 	 p[6] = a[6] | b[6];
   assign	 p_n[6] = ~p[6];
   assign 	 g[6] = a[6] & b[6];
   assign	 h_n[6] = g[6] | p_n[6];

   assign	 bruce_bin_sum[7] = (b_n[7] & a_n[7] & c[7+1]) | (b_n[7] & a[7] & c_n[7+1]) | (b[7] & a_n[7] & c_n[7+1]) | (b[7] & a[7] & c[7+1]);
   assign 	 p[7] = a[7] | b[7];
   assign	 p_n[7] = ~p[7];
   assign 	 g[7] = a[7] & b[7];
   assign	 h_n[7] = g[7] | p_n[7];

   assign	 bruce_bin_sum[8] = (b_n[8] & a_n[8] & c[8+1]) | (b_n[8] & a[8] & c_n[8+1]) | (b[8] & a_n[8] & c_n[8+1]) | (b[8] & a[8] & c[8+1]);
   assign 	 p[8] = a[8] | b[8];
   assign	 p_n[8] = ~p[8];
   assign 	 g[8] = a[8] & b[8];
   assign	 h_n[8] = g[8] | p_n[8];

   assign	 bruce_bin_sum[9] = (b_n[9] & a_n[9] & c[9+1]) | (b_n[9] & a[9] & c_n[9+1]) | (b[9] & a_n[9] & c_n[9+1]) | (b[9] & a[9] & c[9+1]);
   assign 	 p[9] = a[9] | b[9];
   assign	 p_n[9] = ~p[9];
   assign 	 g[9] = a[9] & b[9];
   assign	 h_n[9] = g[9] | p_n[9];

   assign	 bruce_bin_sum[10] = (b_n[10] & a_n[10] & c[10+1]) | (b_n[10] & a[10] & c_n[10+1]) | (b[10] & a_n[10] & c_n[10+1]) | (b[10] & a[10] & c[10+1]);
   assign 	 p[10] = a[10] | b[10];
   assign	 p_n[10] = ~p[10];
   assign 	 g[10] = a[10] & b[10];
   assign	 h_n[10] = g[10] | p_n[10];

   assign	 bruce_bin_sum[11] = (b_n[11] & a_n[11] & c[11+1]) | (b_n[11] & a[11] & c_n[11+1]) | (b[11] & a_n[11] & c_n[11+1]) | (b[11] & a[11] & c[11+1]);
   assign 	 p[11] = a[11] | b[11];
   assign	 p_n[11] = ~p[11];
   assign 	 g[11] = a[11] & b[11];
   assign	 h_n[11] = g[11] | p_n[11];

   assign	 bruce_bin_sum[12] = (b_n[12] & a_n[12] & c[12+1]) | (b_n[12] & a[12] & c_n[12+1]) | (b[12] & a_n[12] & c_n[12+1]) | (b[12] & a[12] & c[12+1]);
   assign 	 p[12] = a[12] | b[12];
   assign	 p_n[12] = ~p[12];
   assign 	 g[12] = a[12] & b[12];
   assign	 h_n[12] = g[12] | p_n[12];

   assign	 bruce_bin_sum[13] = (b_n[13] & a_n[13] & c[13+1]) | (b_n[13] & a[13] & c_n[13+1]) | (b[13] & a_n[13] & c_n[13+1]) | (b[13] & a[13] & c[13+1]);
   assign 	 p[13] = a[13] | b[13];
   assign	 p_n[13] = ~p[13];
   assign 	 g[13] = a[13] & b[13];
   assign	 h_n[13] = g[13] | p_n[13];

   assign	 bruce_bin_sum[14] = (b_n[14] & a_n[14] & c[14+1]) | (b_n[14] & a[14] & c_n[14+1]) | (b[14] & a_n[14] & c_n[14+1]) | (b[14] & a[14] & c[14+1]);
   assign 	 p[14] = a[14] | b[14];
   assign	 p_n[14] = ~p[14];
   assign 	 g[14] = a[14] & b[14];
   assign	 h_n[14] = g[14] | p_n[14];

   assign	 bruce_bin_sum[15] = (b_n[15] & a_n[15] & c[15+1]) | (b_n[15] & a[15] & c_n[15+1]) | (b[15] & a_n[15] & c_n[15+1]) | (b[15] & a[15] & c[15+1]);
   assign 	 p[15] = a[15] | b[15];
   assign	 p_n[15] = ~p[15];
   assign 	 g[15] = a[15] & b[15];
   assign	 h_n[15] = g[15] | p_n[15];

   assign	 bruce_bin_sum[16] = (b_n[16] & a_n[16] & c[16+1]) | (b_n[16] & a[16] & c_n[16+1]) | (b[16] & a_n[16] & c_n[16+1]) | (b[16] & a[16] & c[16+1]);
   assign 	 p[16] = a[16] | b[16];
   assign	 p_n[16] = ~p[16];
   assign 	 g[16] = a[16] & b[16];
   assign	 h_n[16] = g[16] | p_n[16];

   assign	 bruce_bin_sum[17] = (b_n[17] & a_n[17] & c[17+1]) | (b_n[17] & a[17] & c_n[17+1]) | (b[17] & a_n[17] & c_n[17+1]) | (b[17] & a[17] & c[17+1]);
   assign 	 p[17] = a[17] | b[17];
   assign	 p_n[17] = ~p[17];
   assign 	 g[17] = a[17] & b[17];
   assign	 h_n[17] = g[17] | p_n[17];

   assign	 bruce_bin_sum[18] = (b_n[18] & a_n[18] & c[18+1]) | (b_n[18] & a[18] & c_n[18+1]) | (b[18] & a_n[18] & c_n[18+1]) | (b[18] & a[18] & c[18+1]);
   assign 	 p[18] = a[18] | b[18];
   assign	 p_n[18] = ~p[18];
   assign 	 g[18] = a[18] & b[18];
   assign	 h_n[18] = g[18] | p_n[18];

   assign	 bruce_bin_sum[19] = (b_n[19] & a_n[19] & c[19+1]) | (b_n[19] & a[19] & c_n[19+1]) | (b[19] & a_n[19] & c_n[19+1]) | (b[19] & a[19] & c[19+1]);
   assign 	 p[19] = a[19] | b[19];
   assign	 p_n[19] = ~p[19];
   assign 	 g[19] = a[19] & b[19];
   assign	 h_n[19] = g[19] | p_n[19];

   assign	 bruce_bin_sum[20] = (b_n[20] & a_n[20] & c[20+1]) | (b_n[20] & a[20] & c_n[20+1]) | (b[20] & a_n[20] & c_n[20+1]) | (b[20] & a[20] & c[20+1]);
   assign 	 p[20] = a[20] | b[20];
   assign	 p_n[20] = ~p[20];
   assign 	 g[20] = a[20] & b[20];
   assign	 h_n[20] = g[20] | p_n[20];

   assign	 bruce_bin_sum[21] = (b_n[21] & a_n[21] & c[21+1]) | (b_n[21] & a[21] & c_n[21+1]) | (b[21] & a_n[21] & c_n[21+1]) | (b[21] & a[21] & c[21+1]);
   assign 	 p[21] = a[21] | b[21];
   assign	 p_n[21] = ~p[21];
   assign 	 g[21] = a[21] & b[21];
   assign	 h_n[21] = g[21] | p_n[21];

   assign	 bruce_bin_sum[22] = (b_n[22] & a_n[22] & c[22+1]) | (b_n[22] & a[22] & c_n[22+1]) | (b[22] & a_n[22] & c_n[22+1]) | (b[22] & a[22] & c[22+1]);
   assign 	 p[22] = a[22] | b[22];
   assign	 p_n[22] = ~p[22];
   assign 	 g[22] = a[22] & b[22];
   assign	 h_n[22] = g[22] | p_n[22];

   assign	 bruce_bin_sum[23] = (b_n[23] & a_n[23] & c[23+1]) | (b_n[23] & a[23] & c_n[23+1]) | (b[23] & a_n[23] & c_n[23+1]) | (b[23] & a[23] & c[23+1]);
   assign 	 p[23] = a[23] | b[23];
   assign	 p_n[23] = ~p[23];
   assign 	 g[23] = a[23] & b[23];
   assign	 h_n[23] = g[23] | p_n[23];

   assign	 bruce_bin_sum[24] = (b_n[24] & a_n[24] & c[24+1]) | (b_n[24] & a[24] & c_n[24+1]) | (b[24] & a_n[24] & c_n[24+1]) | (b[24] & a[24] & c[24+1]);
   assign 	 p[24] = a[24] | b[24];
   assign	 p_n[24] = ~p[24];
   assign 	 g[24] = a[24] & b[24];
   assign	 h_n[24] = g[24] | p_n[24];

   assign	 bruce_bin_sum[25] = (b_n[25] & a_n[25] & c[25+1]) | (b_n[25] & a[25] & c_n[25+1]) | (b[25] & a_n[25] & c_n[25+1]) | (b[25] & a[25] & c[25+1]);
   assign 	 p[25] = a[25] | b[25];
   assign	 p_n[25] = ~p[25];
   assign 	 g[25] = a[25] & b[25];
   assign	 h_n[25] = g[25] | p_n[25];

   assign	 bruce_bin_sum[26] = (b_n[26] & a_n[26] & c[26+1]) | (b_n[26] & a[26] & c_n[26+1]) | (b[26] & a_n[26] & c_n[26+1]) | (b[26] & a[26] & c[26+1]);
   assign 	 p[26] = a[26] | b[26];
   assign	 p_n[26] = ~p[26];
   assign 	 g[26] = a[26] & b[26];
   assign	 h_n[26] = g[26] | p_n[26];

   assign	 bruce_bin_sum[27] = (b_n[27] & a_n[27] & c[27+1]) | (b_n[27] & a[27] & c_n[27+1]) | (b[27] & a_n[27] & c_n[27+1]) | (b[27] & a[27] & c[27+1]);
   assign 	 p[27] = a[27] | b[27];
   assign	 p_n[27] = ~p[27];
   assign 	 g[27] = a[27] & b[27];
   assign	 h_n[27] = g[27] | p_n[27];

   assign	 bruce_bin_sum[28] = (b_n[28] & a_n[28] & c[28+1]) | (b_n[28] & a[28] & c_n[28+1]) | (b[28] & a_n[28] & c_n[28+1]) | (b[28] & a[28] & c[28+1]);
   assign 	 p[28] = a[28] | b[28];
   assign	 p_n[28] = ~p[28];
   assign 	 g[28] = a[28] & b[28];
   assign	 h_n[28] = g[28] | p_n[28];

   assign	 bruce_bin_sum[29] = (b_n[29] & a_n[29] & c[29+1]) | (b_n[29] & a[29] & c_n[29+1]) | (b[29] & a_n[29] & c_n[29+1]) | (b[29] & a[29] & c[29+1]);
   assign 	 p[29] = a[29] | b[29];
   assign	 p_n[29] = ~p[29];
   assign 	 g[29] = a[29] & b[29];
   assign	 h_n[29] = g[29] | p_n[29];

   assign	 bruce_bin_sum[30] = (b_n[30] & a_n[30] & c[30+1]) | (b_n[30] & a[30] & c_n[30+1]) | (b[30] & a_n[30] & c_n[30+1]) | (b[30] & a[30] & c[30+1]);
   assign 	 p[30] = a[30] | b[30];
   assign	 p_n[30] = ~p[30];
   assign 	 g[30] = a[30] & b[30];
   assign	 h_n[30] = g[30] | p_n[30];

   assign	 bruce_bin_sum[31] = (b_n[31] & a_n[31] & c[31+1]) | (b_n[31] & a[31] & c_n[31+1]) | (b[31] & a_n[31] & c_n[31+1]) | (b[31] & a[31] & c[31+1]);
   assign 	 p[31] = a[31] | b[31];
   assign	 p_n[31] = ~p[31];
   assign 	 g[31] = a[31] & b[31];
   assign	 h_n[31] = g[31] | p_n[31];

   assign	 bruce_bin_sum[32] = (b_n[32] & a_n[32] & c[32+1]) | (b_n[32] & a[32] & c_n[32+1]) | (b[32] & a_n[32] & c_n[32+1]) | (b[32] & a[32] & c[32+1]);
   assign 	 p[32] = a[32] | b[32];
   assign	 p_n[32] = ~p[32];
   assign 	 g[32] = a[32] & b[32];
   assign	 h_n[32] = g[32] | p_n[32];

   assign	 bruce_bin_sum[33] = (b_n[33] & a_n[33] & c[33+1]) | (b_n[33] & a[33] & c_n[33+1]) | (b[33] & a_n[33] & c_n[33+1]) | (b[33] & a[33] & c[33+1]);
   assign 	 p[33] = a[33] | b[33];
   assign	 p_n[33] = ~p[33];
   assign 	 g[33] = a[33] & b[33];
   assign	 h_n[33] = g[33] | p_n[33];

   assign	 bruce_bin_sum[34] = (b_n[34] & a_n[34] & c[34+1]) | (b_n[34] & a[34] & c_n[34+1]) | (b[34] & a_n[34] & c_n[34+1]) | (b[34] & a[34] & c[34+1]);
   assign 	 p[34] = a[34] | b[34];
   assign	 p_n[34] = ~p[34];
   assign 	 g[34] = a[34] & b[34];
   assign	 h_n[34] = g[34] | p_n[34];

   assign	 bruce_bin_sum[35] = (b_n[35] & a_n[35] & c[35+1]) | (b_n[35] & a[35] & c_n[35+1]) | (b[35] & a_n[35] & c_n[35+1]) | (b[35] & a[35] & c[35+1]);
   assign 	 p[35] = a[35] | b[35];
   assign	 p_n[35] = ~p[35];
   assign 	 g[35] = a[35] & b[35];
   assign	 h_n[35] = g[35] | p_n[35];

   assign	 bruce_bin_sum[36] = (b_n[36] & a_n[36] & c[36+1]) | (b_n[36] & a[36] & c_n[36+1]) | (b[36] & a_n[36] & c_n[36+1]) | (b[36] & a[36] & c[36+1]);
   assign 	 p[36] = a[36] | b[36];
   assign	 p_n[36] = ~p[36];
   assign 	 g[36] = a[36] & b[36];
   assign	 h_n[36] = g[36] | p_n[36];

   assign	 bruce_bin_sum[37] = (b_n[37] & a_n[37] & c[37+1]) | (b_n[37] & a[37] & c_n[37+1]) | (b[37] & a_n[37] & c_n[37+1]) | (b[37] & a[37] & c[37+1]);
   assign 	 p[37] = a[37] | b[37];
   assign	 p_n[37] = ~p[37];
   assign 	 g[37] = a[37] & b[37];
   assign	 h_n[37] = g[37] | p_n[37];

   assign	 bruce_bin_sum[38] = (b_n[38] & a_n[38] & c[38+1]) | (b_n[38] & a[38] & c_n[38+1]) | (b[38] & a_n[38] & c_n[38+1]) | (b[38] & a[38] & c[38+1]);
   assign 	 p[38] = a[38] | b[38];
   assign	 p_n[38] = ~p[38];
   assign 	 g[38] = a[38] & b[38];
   assign	 h_n[38] = g[38] | p_n[38];

   assign	 bruce_bin_sum[39] = (b_n[39] & a_n[39] & c[39+1]) | (b_n[39] & a[39] & c_n[39+1]) | (b[39] & a_n[39] & c_n[39+1]) | (b[39] & a[39] & c[39+1]);
   assign 	 p[39] = a[39] | b[39];
   assign	 p_n[39] = ~p[39];
   assign 	 g[39] = a[39] & b[39];
   assign	 h_n[39] = g[39] | p_n[39];
   
   assign	 bruce_bin_sum[40] = (b_n[40] & a_n[40] & c[40+1]) | (b_n[40] & a[40] & c_n[40+1]) | (b[40] & a_n[40] & c_n[40+1]) | (b[40] & a[40] & c[40+1]);
   assign 	 p[40] = a[40] | b[40];
   assign	 p_n[40] = ~p[40];
   assign 	 g[40] = a[40] & b[40];
   assign	 h_n[40] = g[40] | p_n[40];

   assign	 bruce_bin_sum[41] = (b_n[41] & a_n[41] & c[41+1]) | (b_n[41] & a[41] & c_n[41+1]) | (b[41] & a_n[41] & c_n[41+1]) | (b[41] & a[41] & c[41+1]);
   assign 	 p[41] = a[41] | b[41];
   assign	 p_n[41] = ~p[41];
   assign 	 g[41] = a[41] & b[41];
   assign	 h_n[41] = g[41] | p_n[41];

   assign	 bruce_bin_sum[42] = (b_n[42] & a_n[42] & c[42+1]) | (b_n[42] & a[42] & c_n[42+1]) | (b[42] & a_n[42] & c_n[42+1]) | (b[42] & a[42] & c[42+1]);
   assign 	 p[42] = a[42] | b[42];
   assign	 p_n[42] = ~p[42];
   assign 	 g[42] = a[42] & b[42];
   assign	 h_n[42] = g[42] | p_n[42];

   assign	 bruce_bin_sum[43] = (b_n[43] & a_n[43] & c[43+1]) | (b_n[43] & a[43] & c_n[43+1]) | (b[43] & a_n[43] & c_n[43+1]) | (b[43] & a[43] & c[43+1]);
   assign 	 p[43] = a[43] | b[43];
   assign	 p_n[43] = ~p[43];
   assign 	 g[43] = a[43] & b[43];
   assign	 h_n[43] = g[43] | p_n[43];

   assign	 bruce_bin_sum[44] = (b_n[44] & a_n[44] & c[44+1]) | (b_n[44] & a[44] & c_n[44+1]) | (b[44] & a_n[44] & c_n[44+1]) | (b[44] & a[44] & c[44+1]);
   assign 	 p[44] = a[44] | b[44];
   assign	 p_n[44] = ~p[44];
   assign 	 g[44] = a[44] & b[44];
   assign	 h_n[44] = g[44] | p_n[44];

   assign	 bruce_bin_sum[45] = (b_n[45] & a_n[45] & c[45+1]) | (b_n[45] & a[45] & c_n[45+1]) | (b[45] & a_n[45] & c_n[45+1]) | (b[45] & a[45] & c[45+1]);
   assign 	 p[45] = a[45] | b[45];
   assign	 p_n[45] = ~p[45];
   assign 	 g[45] = a[45] & b[45];
   assign	 h_n[45] = g[45] | p_n[45];

   assign	 bruce_bin_sum[46] = (b_n[46] & a_n[46] & c[46+1]) | (b_n[46] & a[46] & c_n[46+1]) | (b[46] & a_n[46] & c_n[46+1]) | (b[46] & a[46] & c[46+1]);
   assign 	 p[46] = a[46] | b[46];
   assign	 p_n[46] = ~p[46];
   assign 	 g[46] = a[46] & b[46];
   assign	 h_n[46] = g[46] | p_n[46];

   assign	 bruce_bin_sum[47] = (b_n[47] & a_n[47] & c[47+1]) | (b_n[47] & a[47] & c_n[47+1]) | (b[47] & a_n[47] & c_n[47+1]) | (b[47] & a[47] & c[47+1]);
   assign 	 p[47] = a[47] | b[47];
   assign	 p_n[47] = ~p[47];
   assign 	 g[47] = a[47] & b[47];
   assign	 h_n[47] = g[47] | p_n[47];

   assign	 bruce_bin_sum[48] = (b_n[48] & a_n[48] & c[48+1]) | (b_n[48] & a[48] & c_n[48+1]) | (b[48] & a_n[48] & c_n[48+1]) | (b[48] & a[48] & c[48+1]);
   assign 	 p[48] = a[48] | b[48];
   assign	 p_n[48] = ~p[48];
   assign 	 g[48] = a[48] & b[48];
   assign	 h_n[48] = g[48] | p_n[48];

   assign	 bruce_bin_sum[49] = (b_n[49] & a_n[49] & c[49+1]) | (b_n[49] & a[49] & c_n[49+1]) | (b[49] & a_n[49] & c_n[49+1]) | (b[49] & a[49] & c[49+1]);
   assign 	 p[49] = a[49] | b[49];
   assign	 p_n[49] = ~p[49];
   assign 	 g[49] = a[49] & b[49];
   assign	 h_n[49] = g[49] | p_n[49];

   assign	 bruce_bin_sum[50] = (b_n[50] & a_n[50] & c[50+1]) | (b_n[50] & a[50] & c_n[50+1]) | (b[50] & a_n[50] & c_n[50+1]) | (b[50] & a[50] & c[50+1]);
   assign 	 p[50] = a[50] | b[50];
   assign	 p_n[50] = ~p[50];
   assign 	 g[50] = a[50] & b[50];
   assign	 h_n[50] = g[50] | p_n[50];

   assign	 bruce_bin_sum[51] = (b_n[51] & a_n[51] & c[51+1]) | (b_n[51] & a[51] & c_n[51+1]) | (b[51] & a_n[51] & c_n[51+1]) | (b[51] & a[51] & c[51+1]);
   assign 	 p[51] = a[51] | b[51];
   assign	 p_n[51] = ~p[51];
   assign 	 g[51] = a[51] & b[51];
   assign	 h_n[51] = g[51] | p_n[51];

   assign	 bruce_bin_sum[52] = (b_n[52] & a_n[52] & c[52+1]) | (b_n[52] & a[52] & c_n[52+1]) | (b[52] & a_n[52] & c_n[52+1]) | (b[52] & a[52] & c[52+1]);
   assign 	 p[52] = a[52] | b[52];
   assign	 p_n[52] = ~p[52];
   assign 	 g[52] = a[52] & b[52];
   assign	 h_n[52] = g[52] | p_n[52];

   assign	 bruce_bin_sum[53] = (b_n[53] & a_n[53] & c[53+1]) | (b_n[53] & a[53] & c_n[53+1]) | (b[53] & a_n[53] & c_n[53+1]) | (b[53] & a[53] & c[53+1]);
   assign 	 p[53] = a[53] | b[53];
   assign	 p_n[53] = ~p[53];
   assign 	 g[53] = a[53] & b[53];
   assign	 h_n[53] = g[53] | p_n[53];

   assign	 bruce_bin_sum[54] = (b_n[54] & a_n[54] & c[54+1]) | (b_n[54] & a[54] & c_n[54+1]) | (b[54] & a_n[54] & c_n[54+1]) | (b[54] & a[54] & c[54+1]);
   assign 	 p[54] = a[54] | b[54];
   assign	 p_n[54] = ~p[54];
   assign 	 g[54] = a[54] & b[54];
   assign	 h_n[54] = g[54] | p_n[54];

   assign	 bruce_bin_sum[55] = (b_n[55] & a_n[55] & c[55+1]) | (b_n[55] & a[55] & c_n[55+1]) | (b[55] & a_n[55] & c_n[55+1]) | (b[55] & a[55] & c[55+1]);
   assign 	 p[55] = a[55] | b[55];
   assign	 p_n[55] = ~p[55];
   assign 	 g[55] = a[55] & b[55];
   assign	 h_n[55] = g[55] | p_n[55];

   assign	 bruce_bin_sum[56] = (b_n[56] & a_n[56] & c[56+1]) | (b_n[56] & a[56] & c_n[56+1]) | (b[56] & a_n[56] & c_n[56+1]) | (b[56] & a[56] & c[56+1]);
   assign 	 p[56] = a[56] | b[56];
   assign	 p_n[56] = ~p[56];
   assign 	 g[56] = a[56] & b[56];
   assign	 h_n[56] = g[56] | p_n[56];

   assign	 bruce_bin_sum[57] = (b_n[57] & a_n[57] & c[57+1]) | (b_n[57] & a[57] & c_n[57+1]) | (b[57] & a_n[57] & c_n[57+1]) | (b[57] & a[57] & c[57+1]);
   assign 	 p[57] = a[57] | b[57];
   assign	 p_n[57] = ~p[57];
   assign 	 g[57] = a[57] & b[57];
   assign	 h_n[57] = g[57] | p_n[57];

   assign	 bruce_bin_sum[58] = (b_n[58] & a_n[58] & c[58+1]) | (b_n[58] & a[58] & c_n[58+1]) | (b[58] & a_n[58] & c_n[58+1]) | (b[58] & a[58] & c[58+1]);
   assign 	 p[58] = a[58] | b[58];
   assign	 p_n[58] = ~p[58];
   assign 	 g[58] = a[58] & b[58];
   assign	 h_n[58] = g[58] | p_n[58];

   assign	 bruce_bin_sum[59] = (b_n[59] & a_n[59] & c[59+1]) | (b_n[59] & a[59] & c_n[59+1]) | (b[59] & a_n[59] & c_n[59+1]) | (b[59] & a[59] & c[59+1]);
   assign 	 p[59] = a[59] | b[59];
   assign	 p_n[59] = ~p[59];
   assign 	 g[59] = a[59] & b[59];
   assign	 h_n[59] = g[59] | p_n[59];

   assign	 bruce_bin_sum[60] = (b_n[60] & a_n[60] & c[60+1]) | (b_n[60] & a[60] & c_n[60+1]) | (b[60] & a_n[60] & c_n[60+1]) | (b[60] & a[60] & c[60+1]);
   assign 	 p[60] = a[60] | b[60];
   assign	 p_n[60] = ~p[60];
   assign 	 g[60] = a[60] & b[60];
   assign	 h_n[60] = g[60] | p_n[60];

   assign	 bruce_bin_sum[61] = (b_n[61] & a_n[61] & c[61+1]) | (b_n[61] & a[61] & c_n[61+1]) | (b[61] & a_n[61] & c_n[61+1]) | (b[61] & a[61] & c[61+1]);
   assign 	 p[61] = a[61] | b[61];
   assign	 p_n[61] = ~p[61];
   assign 	 g[61] = a[61] & b[61];
   assign	 h_n[61] = g[61] | p_n[61];

   assign	 bruce_bin_sum[62] = (b_n[62] & a_n[62] & c[62+1]) | (b_n[62] & a[62] & c_n[62+1]) | (b[62] & a_n[62] & c_n[62+1]) | (b[62] & a[62] & c[62+1]);
   assign 	 p[62] = a[62] | b[62];
   assign	 p_n[62] = ~p[62];
   assign 	 g[62] = a[62] & b[62];
   assign	 h_n[62] = g[62] | p_n[62];

   assign	 bruce_bin_sum[63] = (b_n[63] & a_n[63] & c[63+1]) | (b_n[63] & a[63] & c_n[63+1]) | (b[63] & a_n[63] & c_n[63+1]) | (b[63] & a[63] & c[63+1]);
   assign 	 p[63] = a[63] | b[63];
   assign	 p_n[63] = ~p[63];
   assign 	 g[63] = a[63] & b[63];
   assign	 h_n[63] = g[63] | p_n[63];

   assign 	 bin_sum[0:63] = (alu_cmd[0:3] == 4'b0010) ? bruce_bin_sum[0:63] + 2'b01 : bruce_bin_sum[0:63];

   assign 	 d[0] = h_n[0] ^ p[0+1];
   assign 	 d[1] = h_n[1] ^ p[1+1];
   assign 	 d[2] = h_n[2] ^ p[2+1];
   assign 	 d[3] = h_n[3] ^ p[3+1];
   assign 	 d[4] = h_n[4] ^ p[4+1];
   assign 	 d[5] = h_n[5] ^ p[5+1];
   assign 	 d[6] = h_n[6] ^ p[6+1];
   assign 	 d[7] = h_n[7] ^ p[7+1];
   assign 	 d[8] = h_n[8] ^ p[8+1];
   assign 	 d[9] = h_n[9] ^ p[9+1];
   assign 	 d[10] = h_n[10] ^ p[10+1];
   assign 	 d[11] = h_n[11] ^ p[11+1];
   assign 	 d[12] = h_n[12] ^ p[12+1];
   assign 	 d[13] = h_n[13] ^ p[13+1];
   assign 	 d[14] = h_n[14] ^ p[14+1];
   assign 	 d[15] = h_n[15] ^ p[15+1];
   assign 	 d[16] = h_n[16] ^ p[16+1];
   assign 	 d[17] = h_n[17] ^ p[17+1];
   assign 	 d[18] = h_n[18] ^ p[18+1];
   assign 	 d[19] = h_n[19] ^ p[19+1];
   assign 	 d[20] = h_n[20] ^ p[20+1];
   assign 	 d[21] = h_n[21] ^ p[21+1];
   assign 	 d[22] = h_n[22] ^ p[22+1];
   assign 	 d[23] = h_n[23] ^ p[23+1];
   assign 	 d[24] = h_n[24] ^ p[24+1];
   assign 	 d[25] = h_n[25] ^ p[25+1];
   assign 	 d[26] = h_n[26] ^ p[26+1];
   assign 	 d[27] = h_n[27] ^ p[27+1];
   assign 	 d[28] = h_n[28] ^ p[28+1];
   assign 	 d[29] = h_n[29] ^ p[29+1];
   assign 	 d[30] = h_n[30] ^ p[30+1];
   assign 	 d[31] = h_n[31] ^ p[31+1];
   assign 	 d[32] = h_n[32] ^ p[32+1];
   assign 	 d[33] = h_n[33] ^ p[33+1];
   assign 	 d[34] = h_n[34] ^ p[34+1];
   assign 	 d[35] = h_n[35] ^ p[35+1];
   assign 	 d[36] = h_n[36] ^ p[36+1];
   assign 	 d[37] = h_n[37] ^ p[37+1];
   assign 	 d[38] = h_n[38] ^ p[38+1];
   assign 	 d[39] = h_n[39] ^ p[39+1];
   assign 	 d[40] = h_n[40] ^ p[40+1];
   assign 	 d[41] = h_n[41] ^ p[41+1];
   assign 	 d[42] = h_n[42] ^ p[42+1];
   assign 	 d[43] = h_n[43] ^ p[43+1];
   assign 	 d[44] = h_n[44] ^ p[44+1];
   assign 	 d[45] = h_n[45] ^ p[45+1];
   assign 	 d[46] = h_n[46] ^ p[46+1];
   assign 	 d[47] = h_n[47] ^ p[47+1];
   assign 	 d[48] = h_n[48] ^ p[48+1];
   assign 	 d[49] = h_n[49] ^ p[49+1];
   assign 	 d[50] = h_n[50] ^ p[50+1];
   assign 	 d[51] = h_n[51] ^ p[51+1];
   assign 	 d[52] = h_n[52] ^ p[52+1];
   assign 	 d[53] = h_n[53] ^ p[53+1];
   assign 	 d[54] = h_n[54] ^ p[54+1];
   assign 	 d[55] = h_n[55] ^ p[55+1];
   assign 	 d[56] = h_n[56] ^ p[56+1];
   assign 	 d[57] = h_n[57] ^ p[57+1];
   assign 	 d[58] = h_n[58] ^ p[58+1];
   assign 	 d[59] = h_n[59] ^ p[59+1];
   assign 	 d[60] = h_n[60] ^ p[60+1];
   assign 	 d[61] = h_n[61] ^ p[61+1];
   assign 	 d[62] = h_n[62] ^ p[62+1];

   assign 	 d[63] = h_n[63] ^ bin_sub_q;
      
   assign 	 d8[0] = d[8*0] & d[8*0+1] & d[8*0+2] & d[8*0+3] & d[8*0+4] & d[8*0+5] & d[8*0+6] & d[8*0+7];
   assign 	 d8[1] = d[8*1] & d[8*1+1] & d[8*1+2] & d[8*1+3] & d[8*1+4] & d[8*1+5] & d[8*1+6] & d[8*1+7];
   assign 	 d8[2] = d[8*2] & d[8*2+1] & d[8*2+2] & d[8*2+3] & d[8*2+4] & d[8*2+5] & d[8*2+6] & d[8*2+7];
   assign 	 d8[3] = d[8*3] & d[8*3+1] & d[8*3+2] & d[8*3+3] & d[8*3+4] & d[8*3+5] & d[8*3+6] & d[8*3+7];
   assign 	 d8[4] = d[8*4] & d[8*4+1] & d[8*4+2] & d[8*4+3] & d[8*4+4] & d[8*4+5] & d[8*4+6] & d[8*4+7];
   assign 	 d8[5] = d[8*5] & d[8*5+1] & d[8*5+2] & d[8*5+3] & d[8*5+4] & d[8*5+5] & d[8*5+6] & d[8*5+7];
   assign 	 d8[6] = d[8*6] & d[8*6+1] & d[8*6+2] & d[8*6+3] & d[8*6+4] & d[8*6+5] & d[8*6+6] & d[8*6+7];
   assign 	 d8[7] = d[8*7] & d[8*7+1] & d[8*7+2] & d[8*7+3] & d[8*7+4] & d[8*7+5] & d[8*7+6] & d[8*7+7];

   assign 	 ds = d[33] & d[34] & d[35] & d[36] & d[37] & d[38] & d[39];
	
   assign 	 bin_sum_0_63_z = d8[0] & d8[1] & d8[2] & d8[3] & d8[4] & d8[5] & d8[6] & d8[7];

   assign 	 bin_sum_32_63_z = d8[4] & d8[5] & d8[6] & d8[7];

   assign 	 bin_sum_33_63_z = ds & d8[5] & d8[6] & d8[7];

   assign 	 G2[0] = g[2*0] | (p[2*0] & g[2*0+1]);
   assign 	 P2[0] = p[2*0] & p[2*0+1];
   assign 	 G2[1] = g[2*1] | (p[2*1] & g[2*1+1]);
   assign 	 P2[1] = p[2*1] & p[2*1+1];
   assign 	 G2[2] = g[2*2] | (p[2*2] & g[2*2+1]);
   assign 	 P2[2] = p[2*2] & p[2*2+1];
   assign 	 G2[3] = g[2*3] | (p[2*3] & g[2*3+1]);
   assign 	 P2[3] = p[2*3] & p[2*3+1];
   assign 	 G2[4] = g[2*4] | (p[2*4] & g[2*4+1]);
   assign 	 P2[4] = p[2*4] & p[2*4+1];
   assign 	 G2[5] = g[2*5] | (p[2*5] & g[2*5+1]);
   assign 	 P2[5] = p[2*5] & p[2*5+1];
   assign 	 G2[6] = g[2*6] | (p[2*6] & g[2*6+1]);
   assign 	 P2[6] = p[2*6] & p[2*6+1];
   assign 	 G2[7] = g[2*7] | (p[2*7] & g[2*7+1]);
   assign 	 P2[7] = p[2*7] & p[2*7+1];
   assign 	 G2[8] = g[2*8] | (p[2*8] & g[2*8+1]);
   assign 	 P2[8] = p[2*8] & p[2*8+1];
   assign 	 G2[9] = g[2*9] | (p[2*9] & g[2*9+1]);
   assign 	 P2[9] = p[2*9] & p[2*9+1];
   assign 	 G2[10] = g[2*10] | (p[2*10] & g[2*10+1]);
   assign 	 P2[10] = p[2*10] & p[2*10+1];
   assign 	 G2[11] = g[2*11] | (p[2*11] & g[2*11+1]);
   assign 	 P2[11] = p[2*11] & p[2*11+1];
   assign 	 G2[12] = g[2*12] | (p[2*12] & g[2*12+1]);
   assign 	 P2[12] = p[2*12] & p[2*12+1];
   assign 	 G2[13] = g[2*13] | (p[2*13] & g[2*13+1]);
   assign 	 P2[13] = p[2*13] & p[2*13+1];
   assign 	 G2[14] = g[2*14] | (p[2*14] & g[2*14+1]);
   assign 	 P2[14] = p[2*14] & p[2*14+1];
   assign 	 G2[15] = g[2*15] | (p[2*15] & g[2*15+1]);
   assign 	 P2[15] = p[2*15] & p[2*15+1];
   assign 	 G2[16] = g[2*16] | (p[2*16] & g[2*16+1]);
   assign 	 P2[16] = p[2*16] & p[2*16+1];
   assign 	 G2[17] = g[2*17] | (p[2*17] & g[2*17+1]);
   assign 	 P2[17] = p[2*17] & p[2*17+1];
   assign 	 G2[18] = g[2*18] | (p[2*18] & g[2*18+1]);
   assign 	 P2[18] = p[2*18] & p[2*18+1];
   assign 	 G2[19] = g[2*19] | (p[2*19] & g[2*19+1]);
   assign 	 P2[19] = p[2*19] & p[2*19+1];
   assign 	 G2[20] = g[2*20] | (p[2*20] & g[2*20+1]);
   assign 	 P2[20] = p[2*20] & p[2*20+1];
   assign 	 G2[21] = g[2*21] | (p[2*21] & g[2*21+1]);
   assign 	 P2[21] = p[2*21] & p[2*21+1];
   assign 	 G2[22] = g[2*22] | (p[2*22] & g[2*22+1]);
   assign 	 P2[22] = p[2*22] & p[2*22+1];
   assign 	 G2[23] = g[2*23] | (p[2*23] & g[2*23+1]);
   assign 	 P2[23] = p[2*23] & p[2*23+1];
   assign 	 G2[24] = g[2*24] | (p[2*24] & g[2*24+1]);
   assign 	 P2[24] = p[2*24] & p[2*24+1];
   assign 	 G2[25] = g[2*25] | (p[2*25] & g[2*25+1]);
   assign 	 P2[25] = p[2*25] & p[2*25+1];
   assign 	 G2[26] = g[2*26] | (p[2*26] & g[2*26+1]);
   assign 	 P2[26] = p[2*26] & p[2*26+1];
   assign 	 G2[27] = g[2*27] | (p[2*27] & g[2*27+1]);
   assign 	 P2[27] = p[2*27] & p[2*27+1];
   assign 	 G2[28] = g[2*28] | (p[2*28] & g[2*28+1]);
   assign 	 P2[28] = p[2*28] & p[2*28+1];
   assign 	 G2[29] = g[2*29] | (p[2*29] & g[2*29+1]);
   assign 	 P2[29] = p[2*29] & p[2*29+1];
   assign 	 G2[30] = g[2*30] | (p[2*30] & g[2*30+1]);
   assign 	 P2[30] = p[2*30] & p[2*30+1];
   assign 	 G2[31] = g[2*31] | (p[2*31] & g[2*31+1]);
   assign 	 P2[31] = p[2*31] & p[2*31+1];
   
   assign 	 Gn[0] = G2[2*0] | (P2[2*0] & G2[2*0+1]);
   assign 	 Pn[0] = P2[2*0] & P2[2*0+1];
   
   assign 	 Gn[1] = G2[2*1] | (P2[2*1] & G2[2*1+1]);
   assign 	 Pn[1] = P2[2*1] & P2[2*1+1];
   
   assign 	 Gn[2] = G2[2*2] | (P2[2*2] & G2[2*2+1]);
   assign 	 Pn[2] = P2[2*2] & P2[2*2+1];
   
   assign 	 Gn[3] = G2[2*3] | (P2[2*3] & G2[2*3+1]);
   assign 	 Pn[3] = P2[2*3] & P2[2*3+1];
   
   assign 	 Gn[4] = G2[2*4] | (P2[2*4] & G2[2*4+1]);
   assign 	 Pn[4] = P2[2*4] & P2[2*4+1];
   
   assign 	 Gn[5] = G2[2*5] | (P2[2*5] & G2[2*5+1]);
   assign 	 Pn[5] = P2[2*5] & P2[2*5+1];
   
   assign 	 Gn[6] = G2[2*6] | (P2[2*6] & G2[2*6+1]);
   assign 	 Pn[6] = P2[2*6] & P2[2*6+1];
   
   assign 	 Gn[7] = G2[2*7] | (P2[2*7] & G2[2*7+1]);
   assign 	 Pn[7] = P2[2*7] & P2[2*7+1];
   
   assign 	 Gn[8] = G2[2*8] | (P2[2*8] & G2[2*8+1]);
   assign 	 Pn[8] = P2[2*8] & P2[2*8+1];
   
   assign 	 Gn[9] = G2[2*9] | (P2[2*9] & G2[2*9+1]);
   assign 	 Pn[9] = P2[2*9] & P2[2*9+1];
   
   assign 	 Gn[10] = G2[2*10] | (P2[2*10] & G2[2*10+1]);
   assign 	 Pn[10] = P2[2*10] & P2[2*10+1];
   
   assign 	 Gn[11] = G2[2*11] | (P2[2*11] & G2[2*11+1]);
   assign 	 Pn[11] = P2[2*11] & P2[2*11+1];

   assign 	 Gn[12] = G2[2*12] | (P2[2*12] & G2[2*12+1]);
   assign 	 Pn[12] = P2[2*12] & P2[2*12+1];

   assign 	 Gn[13] = G2[2*13] | (P2[2*13] & G2[2*13+1]);
   assign 	 Pn[13] = P2[2*13] & P2[2*13+1];

   assign 	 Gn[14] = G2[2*14] | (P2[2*14] & G2[2*14+1]);
   assign 	 Pn[14] = P2[2*14] & P2[2*14+1];

   assign 	 Gn[15] = G2[2*15] | (P2[2*15] & G2[2*15+1]);
   assign 	 Pn[15] = P2[2*15] & P2[2*15+1];

   assign 	 Gb[0] = Gn[2*0] | (Pn[2*0] & Gn[2*0+1]);
   assign 	 Pb[0] = Pn[2*0] & Pn[2*0+1];

   assign 	 Gb[1] = Gn[2*1] | (Pn[2*1] & Gn[2*1+1]);
   assign 	 Pb[1] = Pn[2*1] & Pn[2*1+1];

   assign 	 Gb[2] = Gn[2*2] | (Pn[2*2] & Gn[2*2+1]);
   assign 	 Pb[2] = Pn[2*2] & Pn[2*2+1];

   assign 	 Gb[3] = Gn[2*3] | (Pn[2*3] & Gn[2*3+1]);
   assign 	 Pb[3] = Pn[2*3] & Pn[2*3+1];

   assign 	 Gb[4] = Gn[2*4] | (Pn[2*4] & Gn[2*4+1]);
   assign 	 Pb[4] = Pn[2*4] & Pn[2*4+1];

   assign 	 Gb[5] = Gn[2*5] | (Pn[2*5] & Gn[2*5+1]);
   assign 	 Pb[5] = Pn[2*5] & Pn[2*5+1];

   assign 	 Gb[6] = Gn[2*6] | (Pn[2*6] & Gn[2*6+1]);
   assign 	 Pb[6] = Pn[2*6] & Pn[2*6+1];
   
   assign 	 Gb[7] = Gn[2*7] | (Pn[2*7] & Gn[2*7+1]);
   assign 	 Pb[7] = Pn[2*7] & Pn[2*7+1];
   
   assign G2b[2] = Gb[2+1] | (Pb[2+1] & Gb[2+2]);
   assign P2b[2] = Pb[2+1] & Pb[2+2];

   assign G2b[3] = Gb[3+1] | (Pb[3+1] & Gb[3+2]);
   assign P2b[3] = Pb[3+1] & Pb[3+2];
   
   assign G2b[4] = Gb[4+1] | (Pb[4+1] & Gb[4+2]);
   assign P2b[4] = Pb[4+1] & Pb[4+2];

   assign G2b[5] = Gb[5+1] | (Pb[5+1] & Gb[5+2]);
   assign P2b[5] = Pb[5+1] & Pb[5+2];


   assign G2b[0] = Gb[1] | (Pb[1] & Gb[2]);
   assign P2b[0] = Pb[1] & Pb[2]; 	
   assign G2b[1] = Gb[2] | (Pb[2] & Gb[3]);
   assign P2b[1] = Pb[2] & Pb[3];

   assign c[56] = Gb[7] | (Pb[7] & c[64]);
   assign c[48] = G2b[5] | (P2b[5] & c[64]);
   assign c[40] = G2b[4] | (P2b[4] & c[56]);
   assign c[32] = G2b[3] | (P2b[3] & c[48]);
   assign bin_c_32 = Gb[4] | (Pb[4] & c[40]);
   assign c[24] = G2b[2] | (P2b[2] & c[40]);
   assign c[16] = G2b[1] | (P2b[1] & c[24]);
   assign c[8] = G2b[0] | (P2b[0] & c[24]);
   assign c[0] = Gb[0] | (Pb[0] & c[8]);

   assign c[8*0+4] = Gn[2*0+1] | (Pn[2*0+1] & c[8*0+8]);
   assign c[8*1+4] = Gn[2*1+1] | (Pn[2*1+1] & c[8*1+8]);
   assign c[8*2+4] = Gn[2*2+1] | (Pn[2*2+1] & c[8*2+8]);
   assign c[8*3+4] = Gn[2*3+1] | (Pn[2*3+1] & c[8*3+8]);
   assign c[8*4+4] = Gn[2*4+1] | (Pn[2*4+1] & c[8*4+8]);
   assign c[8*5+4] = Gn[2*5+1] | (Pn[2*5+1] & c[8*5+8]);
   assign c[8*6+4] = Gn[2*6+1] | (Pn[2*6+1] & c[8*6+8]);
   assign c[8*7+4] = Gn[2*7+1] | (Pn[2*7+1] & c[8*7+8]);

   assign c[4*0+2] = G2[2*0+1] | (P2[2*0+1] & c[4*0+4]);
   assign c[4*1+2] = G2[2*1+1] | (P2[2*1+1] & c[4*1+4]);
   assign c[4*2+2] = G2[2*2+1] | (P2[2*2+1] & c[4*2+4]);
   assign c[4*3+2] = G2[2*3+1] | (P2[2*3+1] & c[4*3+4]);
   assign c[4*4+2] = G2[2*4+1] | (P2[2*4+1] & c[4*4+4]);
   assign c[4*5+2] = G2[2*5+1] | (P2[2*5+1] & c[4*5+4]);
   assign c[4*6+2] = G2[2*6+1] | (P2[2*6+1] & c[4*6+4]);
   assign c[4*7+2] = G2[2*7+1] | (P2[2*7+1] & c[4*7+4]);
   assign c[4*8+2] = G2[2*8+1] | (P2[2*8+1] & c[4*8+4]);
   assign c[4*9+2] = G2[2*9+1] | (P2[2*9+1] & c[4*9+4]);
   assign c[4*10+2] = G2[2*10+1] | (P2[2*10+1] & c[4*10+4]);
   assign c[4*11+2] = G2[2*11+1] | (P2[2*11+1] & c[4*11+4]);
   assign c[4*12+2] = G2[2*12+1] | (P2[2*12+1] & c[4*12+4]);
   assign c[4*13+2] = G2[2*13+1] | (P2[2*13+1] & c[4*13+4]);
   assign c[4*14+2] = G2[2*14+1] | (P2[2*14+1] & c[4*14+4]);
   assign c[4*15+2] = G2[2*15+1] | (P2[2*15+1] & c[4*15+4]);

   assign c[2*0+1] = g[2*0+1] | (p[2*0+1] & c[2*0+2]);
   assign c[2*1+1] = g[2*1+1] | (p[2*1+1] & c[2*1+2]);
   assign c[2*2+1] = g[2*2+1] | (p[2*2+1] & c[2*2+2]);
   assign c[2*3+1] = g[2*3+1] | (p[2*3+1] & c[2*3+2]);
   assign c[2*4+1] = g[2*4+1] | (p[2*4+1] & c[2*4+2]);
   assign c[2*5+1] = g[2*5+1] | (p[2*5+1] & c[2*5+2]);
   assign c[2*6+1] = g[2*6+1] | (p[2*6+1] & c[2*6+2]);
   assign c[2*7+1] = g[2*7+1] | (p[2*7+1] & c[2*7+2]);
   assign c[2*8+1] = g[2*8+1] | (p[2*8+1] & c[2*8+2]);
   assign c[2*9+1] = g[2*9+1] | (p[2*9+1] & c[2*9+2]);
   assign c[2*10+1] = g[2*10+1] | (p[2*10+1] & c[2*10+2]);
   assign c[2*11+1] = g[2*11+1] | (p[2*11+1] & c[2*11+2]);
   assign c[2*12+1] = g[2*12+1] | (p[2*12+1] & c[2*12+2]);
   assign c[2*13+1] = g[2*13+1] | (p[2*13+1] & c[2*13+2]);
   assign c[2*14+1] = g[2*14+1] | (p[2*14+1] & c[2*14+2]);
   assign c[2*15+1] = g[2*15+1] | (p[2*15+1] & c[2*15+2]);
   assign c[2*16+1] = g[2*16+1] | (p[2*16+1] & c[2*16+2]);
   assign c[2*17+1] = g[2*17+1] | (p[2*17+1] & c[2*17+2]);
   assign c[2*18+1] = g[2*18+1] | (p[2*18+1] & c[2*18+2]);
   assign c[2*19+1] = g[2*19+1] | (p[2*19+1] & c[2*19+2]);
   assign c[2*20+1] = g[2*20+1] | (p[2*20+1] & c[2*20+2]);
   assign c[2*21+1] = g[2*21+1] | (p[2*21+1] & c[2*21+2]);
   assign c[2*22+1] = g[2*22+1] | (p[2*22+1] & c[2*22+2]);
   assign c[2*23+1] = g[2*23+1] | (p[2*23+1] & c[2*23+2]);
   assign c[2*24+1] = g[2*24+1] | (p[2*24+1] & c[2*24+2]);
   assign c[2*25+1] = g[2*25+1] | (p[2*25+1] & c[2*25+2]);
   assign c[2*26+1] = g[2*26+1] | (p[2*26+1] & c[2*26+2]);
   assign c[2*27+1] = g[2*27+1] | (p[2*27+1] & c[2*27+2]);
   assign c[2*28+1] = g[2*28+1] | (p[2*28+1] & c[2*28+2]);
   assign c[2*29+1] = g[2*29+1] | (p[2*29+1] & c[2*29+2]);
   assign c[2*30+1] = g[2*30+1] | (p[2*30+1] & c[2*30+2]);
   assign c[2*31+1] = g[2*31+1] | (p[2*31+1] & c[2*31+2]);
   
   assign c_n[0] = ~c[0];
   assign c_n[1] = ~c[1];
   assign c_n[2] = ~c[2];
   assign c_n[3] = ~c[3];
   assign c_n[4] = ~c[4];
   assign c_n[5] = ~c[5];
   assign c_n[6] = ~c[6];
   assign c_n[7] = ~c[7];
   assign c_n[8] = ~c[8];
   assign c_n[9] = ~c[9];
   assign c_n[10] = ~c[10];
   assign c_n[11] = ~c[11];
   assign c_n[12] = ~c[12];
   assign c_n[13] = ~c[13];
   assign c_n[14] = ~c[14];
   assign c_n[15] = ~c[15];
   assign c_n[16] = ~c[16];
   assign c_n[17] = ~c[17];
   assign c_n[18] = ~c[18];
   assign c_n[19] = ~c[19];
   assign c_n[20] = ~c[20];
   assign c_n[21] = ~c[21];
   assign c_n[22] = ~c[22];
   assign c_n[23] = ~c[23];
   assign c_n[24] = ~c[24];
   assign c_n[25] = ~c[25];
   assign c_n[26] = ~c[26];
   assign c_n[27] = ~c[27];
   assign c_n[28] = ~c[28];
   assign c_n[29] = ~c[29];
   assign c_n[30] = ~c[30];
   assign c_n[31] = ~c[31];
   assign c_n[32] = ~c[32];
   assign c_n[33] = ~c[33];
   assign c_n[34] = ~c[34];
   assign c_n[35] = ~c[35];
   assign c_n[36] = ~c[36];
   assign c_n[37] = ~c[37];
   assign c_n[38] = ~c[38];
   assign c_n[39] = ~c[39];
   assign c_n[40] = ~c[40];
   assign c_n[41] = ~c[41];
   assign c_n[42] = ~c[42];
   assign c_n[43] = ~c[43];
   assign c_n[44] = ~c[44];
   assign c_n[45] = ~c[45];
   assign c_n[46] = ~c[46];
   assign c_n[47] = ~c[47];
   assign c_n[48] = ~c[48];
   assign c_n[49] = ~c[49];
   assign c_n[50] = ~c[50];
   assign c_n[51] = ~c[51];
   assign c_n[52] = ~c[52];
   assign c_n[53] = ~c[53];
   assign c_n[54] = ~c[54];
   assign c_n[55] = ~c[55];
   assign c_n[56] = ~c[56];
   assign c_n[57] = ~c[57];
   assign c_n[58] = ~c[58];
   assign c_n[59] = ~c[59];
   assign c_n[60] = ~c[60];
   assign c_n[61] = ~c[61];
   assign c_n[62] = ~c[62];
   assign c_n[63] = ~c[63];
   
   assign bin_c_0 = c[0];
   assign bin_ovfl = (c[32] & c_n[33]) | (c_n[32] & c[33]);

endmodule // adder

