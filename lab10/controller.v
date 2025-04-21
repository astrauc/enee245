 always @(start) begin 
   if (start) begin 
      ld_add_p = 0;
      ld_shift_a = 0;
      ld_shift_b = 0;
      en_a = 1;
      en_b = 1;
      en_p = 1;
   end else begin 
      if (zero) begin 
         en_a = 0;
         en_b = 0;
         en_p = 0;
      end else begin 
         ld_shift_a = 1;
         ld_shift_b = 1;
         if (lsb_b) begin 
            ld_add_p = 1;
         end else begin 
            ld_add_p = 0;
         end 
      end
   end 
 end