module colin_latch(
    input on, 
    output res);
    
    reg val = 1'b0;
    assign res = val;
    always @(*) begin
        if (on) val = 1'b1;
    end

endmodule