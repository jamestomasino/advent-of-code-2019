with Intcode;              use Intcode;
with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

Procedure Main is
  Result: Integer := 0;
begin
  Put(Intcode.Intcode, 0);
  Put_Line(" is the solution for part 1");
  for Noun in Intcode.Range_99 loop
    for Verb in Intcode.Range_99 loop
      if Intcode.Intcode(Noun, Verb) = 19690720 then
        Result := Integer(Noun) * 100 + Integer(Verb);
        Put(Result, 0);
        Put_Line(" is the solution for part 2");
        exit;
      end if;
    end loop;
  end loop;
end Main;
