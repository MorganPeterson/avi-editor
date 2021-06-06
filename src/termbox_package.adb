package body Termbox_Package is
   function TB_Init return Integer is
      function Init return Integer;
      pragma Import (C, Init, "tb_init");
   begin
      return Init;
   end TB_Init;

   function TB_Select_Output_Mode (Mode : Output_Mode) return Output_Mode is
      function Select_Mode (Mode : Output_Mode) return Output_Mode;
      pragma Import (C, Select_Mode, "tb_select_output_mode");
   begin
      return Select_Mode (Mode);
   end TB_Select_Output_Mode;

end Termbox_Package;
