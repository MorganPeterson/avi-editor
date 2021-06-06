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

   procedure Set_Tag
      (B  : out Buffer;
       T  : Tag_Type;
       P1 : Pos;
       P2 : Pos;
       V  : Integer)
   is
   begin
      if T < TAG_MAX
         and P1.L /= NONE
         and P1.C /= NONE
         and P2.L /= NONE
         and P2.C /= NONE
      then
         declare
            Val : constant Integer := Tag_Type'Pos (T);
         begin
            B.Tags (Val).P1 := P1;
            B.Tags (Val).P2 := P2;
            B.Tags (Val).V  := V;
         end;
      end if;
   end Set_Tag;
end Buffer_Package;
