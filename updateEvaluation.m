function updateEvaluation(name,uniqueid, round, status)
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
   
    query = "UPDATE Candidates SET " + round + " = " + '"' + status + '"' + " WHERE Name = " + '"' + name + '"' + " AND ID = " + '"' + uniqueid + '"' + ';';
    
    exec(conn,query);
    close(conn)
    clear conn query
end 