with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Editor_Package; use Editor_Package;
with Utilities_Package; use Utilities_Package;

package Command_Package is
   type Cmd_Flag_Type is (
      NOFLAGS,
      MARK,
      CLEARSBLOCK,
      NEEDSLINE,
      NEEDSBLOCK,
      SETSHILITE,
      NOLOCATOR);

   type Arg_Type is (ARG_STRING);

   type Arg is record
      T  : Arg_Type;
      S1 : Unbounded_String;
   end record;

   type Cmd_Func_Type is access procedure
      (E : in out Editor; V : in out View; A : Arg);

   procedure Run_File (E : Editor; V : in out View; A : Arg);

   function Command
      (E : in out Editor;
       V : in out View;
       F : Cmd_Flag_Type;
       Func : Cmd_Func_Type;
       A : Arg) return Boolean;

   procedure Cmd_Insert_File (E : in out Editor; V : in out View; A : Arg);

   procedure Fix_Block (V : in out View);

private
   function Test_None (V : View) return Boolean;
end Command_Package;
