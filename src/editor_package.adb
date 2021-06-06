with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Text_IO; use Ada.Text_IO;

package body Editor_Package is
   function Open_Editor
      (Name : Unbounded_String; Doc : Integer; Cmd : Integer) return Editor is
      B1 : constant Buffer := (False, False);
      B2 : constant Buffer := (False, False);
      D_View : constant View := (B => B1, Status_Callback => False);
      F_View : constant View := (B => B2, Status_Callback => False);
      E : constant Editor :=
         (Name => Name,
          Doc => Doc,
          Cmd => Cmd,
          Doc_View => D_View,
          Focus_View => F_View,
          Running => False
          );
   begin
      return E;
   end Open_Editor;

   procedure Load_File (File_Name : Unbounded_String; E : in out Editor) is
      A : Arg := (T => ARG_STRING, S1 => File_Name);
   begin
      Cmd_Insert_File (E, E.Doc_View, A);
   end Load_File;

   procedure Run_Startup (Name : String) is
   begin
      Put (Name);
   end Run_Startup;

   procedure Run_Startup_Files (File_Name : Unbounded_String) is
      FN : constant String := To_String (File_Name);
      Char : constant Natural :=
         Index (Source => FN, Pattern => ".", From => 1);
      Path : constant String := "tinerc."
         & FN (Char .. FN'Last);
   begin
      Run_Startup ("tinerc");
      Run_Startup (Path);
   end Run_Startup_Files;

   procedure Run (E : Editor) is
   begin
      if E.Focus_View.Status_Callback then
         Status_Callback (E, E.Focus_View);
      end if;
      Redisplay (E.Focus_View);

      Running : loop
         exit Running when not E.Running;
         Fix_Loc (E);
         declare
            K : constant KEYSTROKE := Get_Key_Stroke (E, True);
         begin
            loop
               if K.O'Valid then
                  exit;
               end if;
               Dispatch (E, E.Focus_View, K);
               if E.Focus_View.Status_Callback then
                  Status_Callback (E, E.Focus_View);
               end if;
               Redisplay (E.Focus_View);
               exit;
            end loop;
         end;
      end loop Running;
   end Run;

end Editor_Package;
