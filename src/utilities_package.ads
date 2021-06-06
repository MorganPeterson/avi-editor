with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Buffer_Package; use Buffer_Package;

package Utilities_Package is
   type ERR_TYPE is (
      ENDOFFILE,
      NOBLOCKMARKED,
      INVALIDEFUNCTIONNUMBER,
      BEGINNINGOFLINE,
      ENDOFLINE,
      TOPOFFILE,
      OUTOFMEMORY,
      EMPTYCOMMAND,
      COULDNOTOPENFILE,
      COULDNOTOPENTEMPORARYFILE,
      COULDNOTFORK,
      NOPREVIOUSPOSITION,
      INVALIDBOOKMARK,
      BOOKMARKNOTSET,
      CURSORINSIDEBLOCK,
      INVALIDLINE,
      INVALIDMAPPINGSPECIFICATION,
      INVALIDPAGEHEIGHT,
      NOBLOCKDEFINED,
      INVALIDDELAYVALUE,
      LEFTMARGINWOULDEXCEEDRIGHTMARGIN,
      RIGHTMARINWOULDEXCEEDLEFTMARGIN,
      INVALIDMARGIN,
      SEARCHFAILED,
      INVALIDTABWIDTH,
      NOTHINGTOUNDO,
      UNKNOWNCOMMAND);

   type View is record
      B : Buffer;
      P : Pos;
      GB : POS;
      BS : Integer;
      BE : Integer;
      EX : Boolean;
      Status_Callback : Boolean;
   end record;

   function Read_File
      (Name : Unbounded_String; V : View) return Boolean;
end Utilities_Package;
