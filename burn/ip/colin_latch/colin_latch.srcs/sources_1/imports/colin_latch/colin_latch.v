module colin_latch (         
    input en,       
    output reg q
);   

   initial begin 
       q = 0;
   end
   always @ (en) begin
      if (en)
         q <= 1;
    end
endmodule