with Ada.Text_IO; use Ada.Text_IO;

procedure LinkSort is
   type JobType is (
      Programmer, Manager, Accountant, Analysist,
      Sales, Manufacturing, Inventory, SoftwareEngineer
   );

   package JobTypeIO is new Ada.Text_IO.Enumeration_IO(JobType);
   use JobTypeIO;

   type EmpName is (
      David, Kevin, Sam, Mary, Bob, Marty, Sable, Betty,
      Tom, Teddy, Jerry, Ben, Sara, Donald, Damon, Darlene,
      Dustin, Desire
   );

   package EmpNameIO is new Ada.Text_IO.Enumeration_IO(EmpName);
   use EmpNameIO;

   type LegalResponse is (yup, affirmative, nope, negative);
   subtype PositiveResponse is LegalResponse range yup..affirmative;

   package LegalIO is new Ada.Text_IO.Enumeration_IO(LegalResponse);
   use LegalIO;

   package IntIO is new Ada.Text_IO.Integer_IO(Integer);
   use IntIO;

   type Emp is record
      Name: EmpName;
      Job: JobType;
      Age: Integer;
      Next: Integer;
      Prev: Integer;
   end record;

   SortByJob: Array(JobType) of Integer := (others => 0);
   SortSpace: Array(1..200) of Emp;
   Avail: Integer := 1; -- Dynamic storage allocator.
   Pt: Integer;
   Again: LegalResponse := affirmative;
   Current, Previous: Integer :=0;
begin
   while Again in PositiveResponse loop
      put("Enter name: ");
      get(SortSpace(Avail).Name); -- Get emp info.

      put("Enter Job type: ");
      get(SortSpace(Avail).Job);

      put("Enter Age: ");
      get(SortSpace(Avail).Age);


      -- Insert in appropriate list (by job).

--- generic cutoff
      -- Prepare for next dynamically allocated node.
      Avail := Avail + 1;

      put("Enter another name (yup or nope): ");
      get(Again);

   end loop;

   for I in JobType loop -- Traverse.
      new_line;
      put("Job Type = ");
      put(I);
      new_line;

      Pt := SortByJob(I); -- Point to first node in job list.

      while Pt /= 0 loop
         put(SortSpace(Pt).Name);
         put(" ");
         put(SortSpace(Pt).Age);
         put(" ");
         put(SortSpace(Pt).Job);
         put(" link = ");
         put(SortSpace(Pt).Next, 4);
         new_line;

         Pt := SortSpace(Pt).Next; -- Move down list.
      end loop;
   end loop;
end LinkSort;
