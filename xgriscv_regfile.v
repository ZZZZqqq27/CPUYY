//=====================================================================
//
// Designer   : Yili Gong
//
// Description:
// As part of the project of Computer Organization Experiments, Wuhan University
// In spring 2021
// The regfile module implements the core's general purpose registers file.
//
// ====================================================================

`include "xgriscv_defines.v"

module regfile(
  input                      	clk,
  input  [`RFIDX_WIDTH-1:0]  	readaddress1, readaddress2,
  output [`XLEN-1:0]          readdate1, readdata2,

  input                      	write, 
  input  [`RFIDX_WIDTH-1:0]  	writeaddress,
  input  [`XLEN-1:0]          writedata,
  
  input  [`ADDR_SIZE-1:0] 	   pc
  );

  reg [`XLEN-1:0] rf[`RFREG_NUM-1:0];//寄存器的大小已经define好了

 

  always @(negedge clk)
    if (write && writeaddress3!=0)//0寄存器要一直留着0
      begin
        rf[writeaddress] <= writedata;
        // DO NOT CHANGE THIS display LINE!!!
        // 不要修改下面这行display语句！！！
        /**********************************************************************/
        $display("pc = %h: x%d = %h", pc, writeaddress, writedata);
        /**********************************************************************/
      end

  assign readdata1 = (readaddress1 != 0) ? rf[readaddress1] : 0;
  assign readdata2 = (readaddress2 != 0) ? rf[readaddress2] : 0;
endmodule
