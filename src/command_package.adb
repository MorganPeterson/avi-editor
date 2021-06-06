with Ada.Text_IO; use Ada.Text_IO;
with Buffer_Package; use Buffer_Package;
with Termbox_Package; use Termbox_Package;

package body Command_Package is
   function Command
      (E : in out Editor;
       V : in out View;
       F : Cmd_Flag_Type;
       Func : Cmd_Func_Type;
       A : Arg) return Boolean
   is
      Flags : Cmd_Flag_Type := F;
      B : Buffer := V.B;
      P : Pos := V.P;
      OL : Integer := P.L;
      Has_Line : Boolean := V.B.N /= 0;
   begin
      if (Flags = NEEDSBLOCK) and (V.BS = NONE or V.BE = NONE or not Has_Line)
      then
         E.Error := To_Unbounded_String ("No Blocks Marked");
         return False;
      end if;
      if Flags = MARK then
         Mark_Func (V.B);
      end if;

      Func (E, V, A);
      Fix_Block (E.Doc_View);
      Fix_Cursor (E);

      if Flags = CLEARSBLOCK then
         Clear_Tag (V.B, BLOCK);
         V.BS := NONE;
         V.BE := NONE;
      end if;

      if not (Flags = SETSHILITE) then
         Clear_Tag (V.B, HIGHLIGHT);
      end if;

      if V.P.L /= OL then
         V.EX := False;
      end if;

      if not (Flags = NOLOCATOR) then
         V.GB := V.P;
      end if;
      return True;
   end Command;

   procedure Run_File (E : Editor; V : in out View; A : Arg) is
      Result : constant Boolean := Read_File (A.S1);
      pragma Unreferenced (E);
      pragma Unreferenced (V);
   begin
      if Result then
         Put ("Read Success");
      else
         Put ("Read Failure");
      end if;
   end Run_File;

   procedure Cmd_Insert_File (E : in out Editor; V : in out View; A : Arg) is
      Result : Boolean := Read_File (A.S1, V);
   begin
      if not Result then
         E.Error := "Could not open file: " & A.S1;
      end if;
   end Cmd_Insert_File;

   function Test_None (V : View) return Boolean is
   begin
      if V.BS = NONE or V.BE = NONE then
         return False;
      end if;
      return True;
   end Test_None;

   procedure Fix_Block (V : in out View) is
   begin
      Clear_Tag (V.B, BLOCK);
      declare
         TN : Boolean := Test_None (V);
      begin
         if TN then
            if V.BS > V.BE then
               declare
                  L : Integer := V.BS;
               begin
                  V.BS := V.BE;
                  V.BE := L;
               end;
            end if;
            Set_Tag (V.B, BLOCK, (V.BS, 0), (V.BE, NONE), TB_REVERSE);
         end if;
      end;
   end Fix_Block;

end Command_Package;
