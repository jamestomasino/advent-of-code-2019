package body Bounds is
  procedure Get_Bounds (Path: in Path_Array; Max_R: out Integer; Max_L: out Integer; Max_U: out Integer; Max_D: out Integer) is
    Current_X : Integer := 0;
    Current_Y : Integer := 0;
  begin
    -- These are placeholders so the 'out' doesn't get annoyed with me
    Max_R := 1;
    Max_L := 1;
    Max_U := 1;
    Max_D := 1;

    -- Loop over the path array and check each direction to see which way we're moving
    for I in Path'Range loop
      case Path(I)'First is
        -- Get the first character to indicate direction.
        -- Look at the remaining chars as integers and move "current" that way
        -- If we exceed the bounds of a Max, update it.
        when 'R'    => exit; -- none of these work because it "found a character type"
        when 'L'    => exit; -- none of these work because it "found a character type"
        when 'U'    => exit; -- none of these work because it "found a character type"
        when 'D'    => exit; -- none of these work because it "found a character type"
        when others => -- handle these later
          null;
      end case;
    end loop;
  end Get_Bounds;
end Bounds;
