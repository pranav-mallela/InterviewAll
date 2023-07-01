
function updateStatus (name,status)
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
    
    query = "SELECT * FROM InterviewerHR WHERE Name = " + '"' + name + '"' + ';';
    data = fetch(conn,query);

    dept = "HR";

    if(isempty(data))
         query = "SELECT * FROM InterviewerTECH WHERE Name = " + '"' + name + '"' + ';';
         data = fetch(conn,query);
         dept = "TECH";

         if(isempty(data))
            dept = "MG";
         end 
    end


    query = "UPDATE Interviewer"+dept+" SET Status = " + '"' + status + '"' +" WHERE Name = " + '"' + name + '"' +';';
    
    exec(conn,query);
    close(conn)
    clear conn query
end 