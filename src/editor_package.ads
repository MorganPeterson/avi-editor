with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Buffer_Package; use Buffer_Package;
with Utilities_Package; use Utilities_Package;

package Editor_Package is
   type KEYSTROKE is record
      O : ERR_TYPE;
      C : Character;
   end record;

   type Editor is record
      Name : Unbounded_String;
      Doc : Integer;
      Cmd : Integer;
      Doc_View : View;
      Focus_View : View;
      Running : Boolean;
      Error: Unbounded_String;
   end record;

   function Open_Editor
      (Name : Unbounded_String; Doc : Integer; Cmd : Integer) return Editor;

   procedure Load_File (File_Name : Unbounded_String; E : in out Editor);

   procedure Run_Startup (Name : String);

   procedure Run_Startup_Files (File_Name : Unbounded_String);

   procedure Run (E : Editor);

   procedure Status_Callback (E : Editor; V : View);

   procedure Redisplay (V : View);

   procedure Fix_Loc (E : Editor);

   function Get_Key_Stroke (E : Editor; D : Boolean) return KEYSTROKE;

   procedure Dispatch (E : Editor; F : View; K : KEYSTROKE);

end Editor_Package;
