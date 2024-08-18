module tb_braille_converter_top;

    // Inputs
    reg clk;
    reg reset;
    reg next;
    
    // Outputs
    wire [7:0] reader1_out;
    wire [7:0] reader2_out;
    wire [7:0] reader3_out;
    wire [7:0] reader4_out;
    
    // Instantiate the top module
    braille_converter_top top (
        .clk(clk),
        .reset(reset),
	    .next(next),

	    .reader1_out(reader1_out),
        .reader2_out(reader2_out),
        .reader3_out(reader3_out),
        .reader4_out(reader4_out)
    );
    
    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 time units period
    end
    
    // Test Sequence
    initial begin
        // Dump waveform data for simulation
        $dumpfile("top_tb.vcd");
        $dumpvars();
        
        // Initialize Inputs
        reset = 1;
	next = 0;
        
        // Wait for global reset
        #10;
        reset = 0;  // Reset the system
        #10;
        reset = 1;  // Release the reset
        
        // Wait for the converter to finish processing
        #355;

	next = 1;
	#10;
	next = 0;
	#20;

	next = 1;
	#100;
	next = 0;
	#20;

	next = 1;
    #200;
    next = 0;
    #20;

    next = 1;
    #200;
    next = 0;
    #20;

    next = 1;
    #200;
    next = 0;
    

	#200;

    // Finish the simulation
    $finish;
    end
    
endmodule
