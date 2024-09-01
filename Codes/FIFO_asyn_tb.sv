`timescale 1ns/100ps
module tb;
  parameter data_bits = 8;
  parameter address_bits = 4; 
  logic [data_bits-1:0] wdata;
  logic winc, wclk, wrst_n, rinc, rclk, rrst_n;
  logic [data_bits-1:0] rdata;
  logic wfull, rempty;

  top DUT1(.*);

  initial begin
    wclk = 1'b1;  // Initialize wclk to 1
    rclk = 1'b1;  // Initialize rclk to 1
  end

  // Introduce a delay before wclk starts toggling
  initial begin
    #50;          // Delay before clock starts toggling (adjust this delay as needed)
    forever #5 wclk = ~wclk; // Toggle wclk every 5ns after the delay
  end

  // Introduce a delay before rclk starts toggling
  initial begin
    #50;          // Delay before clock starts toggling (adjust this delay as needed)
    forever #3 rclk = ~rclk; // Toggle rclk every 3ns after the delay
  end

  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    {wrst_n, rrst_n} = 2'b00;
    #5 {wrst_n, rrst_n} <= 2'b11;
    repeat(2) @(negedge wclk); {winc, wdata} <= 9'b111111111;
    @(negedge wclk) winc<=0;
    @(negedge wclk) {winc, wdata} <= 9'b100111111;
    @(negedge wclk) winc<=0;
    @(negedge rclk) rinc<=1;
    @(negedge rclk) rinc<=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111111;
    @(negedge wclk) winc<=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111111;
    @(negedge wclk) winc<=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111111;
    @(negedge wclk) winc<=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111111;
    @(negedge wclk) winc<=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111111;
    @(negedge wclk) winc<=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111111;
    @(negedge wclk) winc<=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111111;
    @(negedge wclk) winc<=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111111;
    @(negedge wclk) winc<=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111111;
    @(negedge wclk) winc<=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111111;
    @(negedge wclk) winc<=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111111;
    @(negedge wclk) winc<=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111111;
    @(negedge wclk) winc<=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111111;
    @(negedge wclk) winc<=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111111;
    @(negedge wclk) winc<=0;
    @(negedge rclk) rinc<=1;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) rinc<=1;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) rinc<=1;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) rinc<=1;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) rinc<=1;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) rinc<=1;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) rinc<=1;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) rinc<=1;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) rinc<=1;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) rinc<=1;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) rinc<=1;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) rinc<=1;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) rinc<=1;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) rinc<=1;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) rinc<=1;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) rinc<=1;
    @(negedge rclk) rinc<=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111111;
    @(negedge wclk) winc<=0;
    @(negedge wclk) {winc, wdata} <= 9'b111100111;
    @(negedge wclk) winc<=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111100;
    #20
    $finish();
   /* @(negedge wclk) {winc, wdata} <= 9'b111111111;
    @(negedge wclk) winc=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111110;
    @(negedge wclk) winc=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111100;
    @(negedge wclk) winc=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111000;
    @(negedge wclk) winc=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111111;
    @(negedge wclk) winc=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111110;
    @(negedge wclk) winc=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111111;
    @(negedge wclk) winc=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111110;
    @(negedge wclk) winc=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111111;
    @(negedge wclk) winc=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111110;
    @(negedge wclk) winc=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111111;
    @(negedge wclk) winc=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111110;
    @(negedge wclk) winc=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111111;
    @(negedge wclk) winc=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111110;
    @(negedge wclk) winc=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111110;
    @(negedge wclk) winc=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111111;
    @(negedge wclk) winc=0;
    @(negedge wclk) {winc, wdata} <= 9'b111111110;
    
    #50;
    @(negedge rclk) {rinc,winc}<=2'b10;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) {rinc,winc}<=2'b10;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) {rinc,winc}<=2'b10;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) {rinc,winc}<=2'b10;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) {rinc,winc}<=2'b10;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) {rinc,winc}<=2'b10;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) {rinc,winc}<=2'b10;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) {rinc,winc}<=2'b10;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) {rinc,winc}<=2'b10;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) {rinc,winc}<=2'b10;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) {rinc,winc}<=2'b10;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) {rinc,winc}<=2'b10;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) {rinc,winc}<=2'b10;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) {rinc,winc}<=2'b10;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) {rinc,winc}<=2'b10;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) {rinc,winc}<=2'b10;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) {rinc,winc}<=2'b10;
    @(negedge rclk) rinc<=0;
    @(negedge rclk) {rinc,winc}<=2'b10;
    @(negedge rclk) rinc<=0;
    
    #200
    $finish; */
    
  end

endmodule
