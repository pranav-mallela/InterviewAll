
function updateStatus (name,status, dept)
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
    
    
    query = "UPDATE Interviewer"+dept+" SET Status = " + '"' + status + '"' +" WHERE Name = " + '"' + name + '"' +';';
    
    execute(conn,query);
    close(conn)
    clear conn query
end 