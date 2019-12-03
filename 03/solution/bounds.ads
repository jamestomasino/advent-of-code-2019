package Bounds is
  type Path_Array is array (positive range <>) of String(1..7);
  procedure Get_Bounds (Path: in Path_Array; Max_R: out Integer; Max_L: out Integer; Max_U: out Integer; Max_D: out Integer);
end Bounds;
