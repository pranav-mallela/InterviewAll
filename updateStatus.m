
function err = updateStatus (name,status)
    err = 0;
    try
        conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
        
        query = "SELECT * FROM InterviewerHR WHERE Name = " + '"' + name + '"' + ';';
        data = fetch(conn,query);
    
        dept = "HR";
    catch
        err = 1;
    end

    if(isempty(data))
        try
             query = "SELECT * FROM InterviewerTECH WHERE Name = " + '"' + name + '"' + ';';
             data = fetch(conn,query);
             dept = "TECH";
        catch
            err = 1;
        end

         if(isempty(data))
            dept = "MG";
         end 
    end

    try
        query = "UPDATE Interviewer"+dept+" SET Status = " + '"' + status + '"' +" WHERE Name = " + '"' + name + '"' +';';
        
        exec(conn,query);
    catch
        err = 1;
    end 
    
    active = "No";
    if(status == "Idle")
        active = "Yes";
    end 

    try
        query = "UPDATE FreeInterviewer" + dept + "SET Active = " + '"' + active + '"' + ';';
        exec(conn, query)
        if(status == "Idle")
            scheduler()
        end 
    catch 
        err = 1;
    end

    close(conn)
    clear conn query
end 