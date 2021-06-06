package body Buffer_Package is
   procedure Enable_Undo (B : in out Buffer) is
   begin
      B.Can_Undo := True;
   end Enable_Undo;

   procedure Clear_Tag (B : in out Buffer; T : Tag_Type) is
   begin
      if T < TAG_MAX then
         declare
            Val : constant Integer := Tag_Type'Pos (T);
         begin
            B.Tags (Val).P1 := (NONE, NONE);
            B.Tags (Val).P2 := (NONE, NONE);
         end;
      end if;
   end Clear_Tag;

end Buffer_Package;
