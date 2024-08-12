`timescale 1ns / 1ps

module Adders_tb;
    reg [15:0] a, b;
    wire [16:0] accurate_sum, approximate_sum;
    integer i;
    integer seed; 
    integer error_count;
    integer total_tests;
    integer file;

    // Instantiate the accurate and approximate adders
    Accurate_RCA accurate_inst(.a(a), .b(b), .s(accurate_sum));
    Adder_1 approximate_inst(.a(a), .b(b), .s(approximate_sum));

    initial begin
        // Seed the random number generator
        seed = 12345; // You can change the seed to any integer value
        
        // Initialize variables
        error_count = 0;
        total_tests = 10000000; // 10 million tests

        // Open file for writing results
        $dumpfile("adder_test.vcd");
        $dumpvars(0, Adders_tb);
        file = $fopen("adder_results.txt", "w");

        // Apply test cases
        for (i = 0; i < total_tests; i = i + 1) begin
            a = $random(seed) & 16'hFFFF; // Generate a 16-bit random number
            b = $random(seed) & 16'hFFFF; // Generate another 16-bit random number
            #1; // Wait for 1 time unit

            // Check for errors and write to file
            $fwrite(file, "%0d %0d %0d %0d\n", a, b, accurate_sum, approximate_sum);
            
            if (accurate_sum !== approximate_sum) begin
                error_count = error_count + 1;
            end
        end

        // Close the file
        $fclose(file);

        // Display error rate
        $display("Error rate: %f%%", (error_count * 100.0) / total_tests);

        $finish;
    end
endmodule
