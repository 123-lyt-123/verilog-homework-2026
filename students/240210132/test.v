module decoder3_8(
    input [2:0] din,
    output reg [7:0] dout
);
always @(*) begin
    case(din)
        3'd0: dout = 8'b00000001;
        3'd1: dout = 8'b00000010;
        3'd2: dout = 8'b00000100;
        3'd3: dout = 8'b00001000;
        3'd4: dout = 8'b00010000;
        3'd5: dout = 8'b00100000;
        3'd6: dout = 8'b01000000;
        3'd7: dout = 8'b10000000;
    endcase
end
endmodule