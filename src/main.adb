with GNAT.Command_Line; use GNAT.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Termbox_Package; use Termbox_Package;
with Editor_Package; use Editor_Package;
with Buffer_Package; use Buffer_Package;
with Command_Package; use Command_Package;

procedure Main is
   RunRC : Boolean := True;
   TopOrBot : Boolean := False;
   Reversed : Boolean := False;
begin
   loop
      case Getopt ("n t r") is
         when 'n' => RunRC := False;
         when 't' => TopOrBot := True;
         when 'r' => Reversed := True;
         when others => exit;
      end case;
   end loop;
   declare
      Init : constant Integer := TB_Init;
      Mode : constant Output_Mode := TB_Select_Output_Mode (TB_OUTPUT_256);
      File_Name : constant Unbounded_String :=
         To_Unbounded_String (Get_Argument);
      Editor_Main : Editor;
   begin
      if Init = 0 and Mode = TB_OUTPUT_256 then
         TB_Clear;
         Editor_Main := Open_Editor (File_Name, 0, 0);
         Load_File (File_Name, Editor_Main);
         if RunRC then
            Run_Startup_Files (File_Name);
         end if;

         Enable_Undo (Editor_Main.Doc_View.B);
         Editor_Main.Doc_View.B.Dirty := False;

         declare
            A : constant Arg := (T => ARG_STRING, S1 => File_Name);
         begin
            Run_File (Editor_Main, Editor_Main.Doc_View, A);
            Run (Editor_Main);
         end;
         Put (TopOrBot'Image);
         Put (Reversed'Image);
         TB_Shutdown;
      end if;
   end;
end Main;
