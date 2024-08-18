module memory(
    input [7:0] mem_addr,        // 8-bit address to support 256 words, coming from size_calculator
    output reg [7:0] mem_dout    // Output data to size_calculator & braille_converter
);

// Memory array with 256 words, each 8 bits wide
reg [7:0] memory [0:255];

// Initialize memory, synthesizable in FPGA but not in ASIC
initial begin
    $readmemh("input.txt", memory); // Read data from a hex file into memory
end

// Memory read operation
always @(*) begin
    mem_dout = memory[mem_addr];  // Read data from memory
end

endmodule
