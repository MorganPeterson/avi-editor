package Buffer_Package is
   NONE : Integer := Integer'Size - 1;

   type Pos is record
      L : Integer;
      C : Integer;
   end record;

   type Tag is record
      P1 : Pos;
      P2 : Pos;
      V  : Integer;
   end record;

   type Tag_Type is (
      VIRTCURS,
      HIGHLIGHT,
      BLOCK,
      TAG_MAX);

   type Tags_Array is array (0 .. 2) of Tag;

   type Buffer is record
      N : Integer;
      Can_Undo : Boolean;
      Dirty : Boolean;
      Tags : Tags_Array;
   end record;

   procedure Enable_Undo (B : in out Buffer);

   procedure Clear_Tag (B : in out Buffer; T : Tag_Type);
end Buffer_Package;
