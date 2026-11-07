// Parameterized Dual-Port Synchronous RAM
module dual_port_ram #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 6
)(
    // Port A (Write / Read)
    input  wire                  clk_a,
    input  wire                  we_a,
    input  wire [ADDR_WIDTH-1:0] addr_a,
    input  wire [DATA_WIDTH-1:0] din_a,
    output reg  [DATA_WIDTH-1:0] dout_a,

    // Port B (Read only / Secondary Port)
    input  wire                  clk_b,
    input  wire                  we_b,
    input  wire [ADDR_WIDTH-1:0] addr_b,
    input  wire [DATA_WIDTH-1:0] din_b,
    output reg  [DATA_WIDTH-1:0] dout_b
);

    localparam RAM_DEPTH = 1 << ADDR_WIDTH;
    reg [DATA_WIDTH-1:0] ram [0:RAM_DEPTH-1];

    // Port A Operation
    always @(posedge clk_a) begin
        if (we_a)
            ram[addr_a] <= din_a;
        dout_a <= ram[addr_a];
    end

    // Port B Operation
    always @(posedge clk_b) begin
        if (we_b)
            ram[addr_b] <= din_b;
        dout_b <= ram[addr_b];
    end

endmodule
