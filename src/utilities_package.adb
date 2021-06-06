with Ada.Text_IO; use Ada.Text_IO;
with Ada.Text_IO.Text_Streams; use Ada.Text_IO.Text_Streams;
with Editor_Package; use Editor_Package;

package body Utilities_Package is
   function Read_File (Name : Unbounded_String; V : View) return Boolean is
      Input  : File_Type;
      BFFR   : Character;
   begin
      Open (File => Input, Mode => In_File, Name => To_String (Name));
      loop
         BFFR := Character'Input (Stream (Input));
         Put (BFFR);
         exit when End_Of_File;
      end loop;
      Close (Input);
      return True;
   exception
      when End_Error =>
         if Is_Open (Input) then
            Close (Input);
         end if;
         return False;
      when Name_Error =>
         Put_Line ("No such file");
         return False;
   end Read_File;
end Utilities_Package;
