package Termbox_Package is
   type Input_Mode is
      (TB_INPUT_CURRENT, --  termbox.h:215
      TB_INPUT_ESC,      --  termbox.h:216
      TB_INPUT_ALT,      --  termbox.h:217
      TB_INPUT_MOUSE     --  termbox.h:218
      );

   type Output_Mode is
      (TB_OUTPUT_CURRENT,   --  termbox.h:239
      TB_OUTPUT_NORMAL,     --  termbox.h:240
      TB_OUTPUT_256,        --  termbox.h:241
      TB_OUTPUT_216,        --  termbox.h:242
      TB_OUTPUT_GRAYSCALE,  --  termbox.h:243
      TB_OUTPUT_TRUECOLOR   --  termbox.h:244
      );

   TB_REVERSE : constant := 16#04000000#;

   function TB_Init return Integer; -- initialization

   procedure TB_Shutdown; -- shutdown
   pragma Import (C, TB_Shutdown, "tb_shutdown");

   procedure TB_Width; -- width of the terminal screen
   pragma Import (C, TB_Width, "tb_width");

   procedure TB_Height; -- height of the terminal screen
   pragma Import (C, TB_Height, "tb_height");

   procedure TB_Clear; -- clear buffer
   pragma Import (C, TB_Clear, "tb_clear");

   procedure TB_Present; -- sync internal buffer with terminal
   pragma Import (C, TB_Present, "tb_present");

   procedure TB_Put_Cell;
   pragma Import (C, TB_Put_Cell, "tb_put_cell");

   procedure TB_Change_Cell;
   pragma Import (C, TB_Change_Cell, "tb_change_cell");

   procedure TB_Blit; -- drawing functions
   pragma Import (C, TB_Blit, "tb_blit");

   function TB_Select_Output_Mode (Mode : Output_Mode)
      return Output_Mode;  -- termbox.h:237

   procedure TB_Peek_Event; -- peek a keyboard event
   pragma Import (C, TB_Peek_Event, "tb_peek_event");

   procedure TB_Poll_Event; -- wait for a keyboard event
   pragma Import (C, TB_Poll_Event, "tb_poll_event");
end Termbox_Package;
