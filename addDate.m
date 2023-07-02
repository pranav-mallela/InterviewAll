
function err = addDate(date)
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
    err = 0;

    try 
        query = "UPDATE Credential SET Password = " + '"' + date + '"' + " WHERE Username = " + '"' + Date + '"' + ';';
        exec(conn,query);
    catch
        err = 1;
    end
    
    
    close(conn)
    clear conn query
end