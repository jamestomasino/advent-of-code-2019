with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

procedure Intcode is
  -- Opcode: array (0..4) of Integer := (1,0,0,0,99); -- Test 1
  -- Opcode: array (0..5) of Integer := (2,4,4,5,99,0); -- Test 2
  -- Opcode: array (0..8) of Integer := (1,1,1,4,99,5,6,0,99); -- Test 3
  Opcode: array (0..148) of Integer := (1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,6,1,19,1,19,5,23,2,9,23,27,1,5,27,31,1,5,31,35,1,35,13,39,1,39,9,43,1,5,43,47,1,47,6,51,1,51,13,55,1,55,9,59,1,59,13,63,2,63,13,67,1,67,10,71,1,71,6,75,2,10,75,79,2,10,79,83,1,5,83,87,2,6,87,91,1,91,6,95,1,95,13,99,2,99,13,103,1,103,9,107,1,10,107,111,2,111,13,115,1,10,115,119,1,10,119,123,2,13,123,127,2,6,127,131,1,13,131,135,1,135,2,139,1,139,6,0,99,2,0,14,0);

  procedure Add_Op (Index: Integer) is
    One: constant Integer := Opcode(Index + 1);
    Two: constant Integer := Opcode(Index + 2);
    Three: constant Integer := Opcode(Index + 3);
  begin
    Opcode(Three) := Opcode(One) + Opcode(Two);
  end Add_Op;

  procedure Mul_Op (Index: Integer) is
    One: constant Integer := Opcode(Index + 1);
    Two: constant Integer := Opcode(Index + 2);
    Three: constant Integer := Opcode(Index + 3);
  begin
    Opcode(Three) := Opcode(One) * Opcode(Two);
  end Mul_Op;
begin
  -- Special instructions to manually replace two values on real test set
  Opcode(1) := 12;
  Opcode(2) := 2;
  Opcode_Loop:
  for Num in Opcode'Range loop
    if Num mod 4 = 0 then
      case Opcode(Num) is
        when 1    => Add_Op(Num);
        when 2    => Mul_Op(Num);
        when 99   => exit Opcode_Loop;
        when others => -- error has already been signaled to user
          null;
      end case;
    end if;
  end loop Opcode_Loop;
  Put(Opcode(0), 0);
  Put_Line(" is the final value at position 0.");
end Intcode;
