package body genericlist is

   SortByJob: Array(JobType) of Integer := (others => 0);
   SortSpace: Array(1..200) of Emp;
   Avail: Integer := 1; -- Dynamic storage allocator.
   Pt: Integer;
   Again: LegalResponse := affirmative;
   Current, Previous: Integer :=0;
   procedure find() is

      
   end find;
   
   procedure insert(Avail: in out Emp )is 
        while Current /= 0 and then SortSpace(Current).Name = SortSpace(Avail).Name and then SortSpace(Current).Age < SortSpace(Avail).Age loop
         Previous := Current;
         Current := SortSpace(Current).Next;
      end loop;  
      Current := SortByJob(SortSpace(Avail).Job);
              --after index found
        if Previous = 0 then
            SortSpace(Avail).Next := SortByJob(SortSpace(Avail).Job);
        if SortByJob(SortSpace(Avail).Job) /= 0 then
               SortSpace(SortByJob(SortSpace(Avail).Job)).Prev := Avail;
        end if;
            SortByJob(SortSpace(Avail).Job) := Avail;
        else
            SortSpace(Avail).Next := SortSpace(Previous).Next;
            SortSpace(Avail).Prev := Previous;
            SortSpace(Previous).Next := Avail;

        if SortSpace(Avail).Next /= 0 then
            SortSpace(SortSpace(Avail).Next).Prev := Avail;
            end if;
         end if;
   end loop;
         
    end insert;
         
    procedure jobList()is
            
         
    end jobList;

end genericlist;
