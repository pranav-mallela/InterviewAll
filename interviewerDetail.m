
function data = interviewerDetail (name, dept)
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
    
    
    query = "SELECT * FROM Interviewer"+dept+' WHERE Name = ' + '"'+name+'"' + ';';
    
    data = fetch(conn,query);
    close(conn)
    clear conn query
end 