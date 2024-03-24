with Ada.Text_IO; use Ada.Text_IO;

generic

package genericlist is
   Avail : Emp;
-- read about tuplets in ada

      procedure find(SortByJob: in out Integer; SortSpace : in out Emp; Avail: in out Integer);
      procedure insert(Avail: in Integer);
      procedure jobList(SortByJob: in Integer); 

   end record;
   
      
end genericlist;
