package Bounds is
  type String_Access is not null access constant String;
  type Path_Array is array (positive range <>) of String_Access;
  procedure Get_Bounds (Path: in Path_Array; Max_R: out Integer; Max_L: out Integer; Max_U: out Integer; Max_D: out Integer);
end Bounds;
