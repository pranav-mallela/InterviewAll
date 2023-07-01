
function updateEvaluation(name,status)
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');

    query = "UPDATE Candidates SET Status = " + '"' + status +'"' +" WHERE Name = "+'"' + name + '"' + ';';
    
    execute(conn,query);
    close(conn)
    clear conn query
end 