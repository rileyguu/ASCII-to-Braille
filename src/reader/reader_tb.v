module reader_tb;

    // Parameters and Signals
    reg clk;
    reg reset;
    reg [7:0] braille_out;
    reg [7:0] braille_size;
    reg braille_valid;
    reg next;
    
    wire [7:0] reader1_out;
    wire [7:0] reader2_out;
    wire [7:0] reader3_out;
    wire [7:0] reader4_out;

    // Instantiate the reader module
    reader uut (
        .clk(clk),
        .reset(reset),
        .braille_out(braille_out),
        .braille_size(braille_size),
        .braille_valid(braille_valid),
        .next(next),
        .reader1_out(reader1_out),
        .reader2_out(reader2_out),
        .reader3_out(reader3_out),
        .reader4_out(reader4_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Testbench logic
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        braille_out = 0;
        braille_size = 0;
        braille_valid = 0;
        next = 0;

        // Initialize VCD file generation
        $dumpfile("reader_tb.vcd");
        $dumpvars();

        // Apply reset
        #10;
        reset = 0;
        #10;
        reset = 1;

        // Load 16 Braille characters into the reader module
        braille_size = 16;
        braille_valid = 1;

        // Manually load 4 sets of 4 characters
        // First set of 4 characters
        braille_out = 8'h30; // '0'
        #10;
        braille_out = 8'h31; // '1'
        #10;
        braille_out = 8'h32; // '2'
        #10;
        braille_out = 8'h33; // '3'
        #10;

        // Second set of 4 characters
        braille_out = 8'h34; // '4'
        #10;
        braille_out = 8'h35; // '5'
        #10;
        braille_out = 8'h36; // '6'
        #10;
        braille_out = 8'h37; // '7'
        #10;

        // Third set of 4 characters
        braille_out = 8'h38; // '8'
        #10;
        braille_out = 8'h39; // '9'
        #10;
        braille_out = 8'h3A; // ':'
        #10;
        braille_out = 8'h3B; // ';'
        #10;

        // Fourth set of 4 characters
        braille_out = 8'h3C; // '<'
        #10;
        braille_out = 8'h3D; // '='
        #10;
        braille_out = 8'h3E; // '>'
        #10;
        braille_out = 8'h3F; // '?'
        #10;

        braille_valid = 0;

        // Wait for loading to complete
        #20;

        // Read out the characters in sets of 4
        next = 1;
        #10;
        next = 0;
        #30;  // Wait a bit to observe output

        next = 1;
        #10;
        next = 0;
        #30;

        next = 1;
        #10;
        next = 0;
        #30;

        next = 1;
        #10;
        next = 0;
        #30;

        next = 1;
        #10;
        next = 0;
        #30;

        // Observe final state
        #100;
        
        // End simulation
        $finish;
    end

endmodule
