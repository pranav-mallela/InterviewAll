function err = updateEvaluation(name,uniqueid, round, status)
    err = 0;

    try 
        conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
        
        query = "UPDATE Candidates SET " + round + " = " + '"' + status + '"' + " WHERE Name = " + '"' + name + '"' + " AND ID = " + '"' + uniqueid + '"' + ';';
        
        exec(conn,query);
    catch 
        err = 1;
    end 
    
    close(conn)
    clear conn query
end 