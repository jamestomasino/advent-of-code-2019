package body Bounds is
  procedure Get_Bounds (Path: in Path_Array; Max_R: out Integer; Max_L: out Integer; Max_U: out Integer; Max_D: out Integer) is
    Current_X : Integer := 0;
    Current_Y : Integer := 0;
    Direction : String(1..7);
    H : Character;
    T : Integer;

    procedure Update_R (T: Integer) is
    begin
      Current_X := Current_X + T;
      if Current_X > Max_R then
        Max_R := Current_X;
      end if;
    end Update_R;

    procedure Update_L (T: Integer) is
    begin
      Current_X := Current_X - T;
      if Current_X < Max_L then
        Max_L := Current_X;
      end if;
    end Update_L;

    procedure Update_U (T: Integer) is
    begin
      Current_Y := Current_Y + T;
      if Current_Y > Max_U then
        Max_U := Current_Y;
      end if;
    end Update_U;

    procedure Update_D (T: Integer) is
    begin
      Current_Y := Current_Y - T;
      if Current_Y < Max_D then
        Max_D := Current_Y;
      end if;
    end Update_D;

  begin
    -- Loop over the path array and check each direction to see which way we're moving
    for I in Path'Range loop
      Direction := Path(I);
      H := Direction(1);
      T := Integer'Value(Direction(2..7));
      case H is
        -- Get the first character to indicate direction.
        -- Look at the remaining chars as integers and move "current" that way
        -- If we exceed the bounds of a Max, update it.
        when 'R'    => Update_R(T);
        when 'L'    => Update_L(T);
        when 'U'    => Update_U(T);
        when 'D'    => Update_D(T);
        when others => -- skip
          null;
      end case;
    end loop;
  end Get_Bounds;
end Bounds;
