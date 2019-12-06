with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Bounds is
  type Path_Array is array(1..301) of Ada.Strings.Unbounded.Unbounded_String;
  procedure Get_Bounds (Path: in Path_Array; Max_R: out Integer; Max_L: out Integer; Max_U: out Integer; Max_D: out Integer);
end Bounds;
