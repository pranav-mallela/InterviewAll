function signup (name, department, domain, mailid)
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
   
    query = "INSERT INTO Interviewer" + department + " (name, department, domain, mailid) VALUES (" +  '"'+name+'"' + ', ' + '"'+ department+'"' + ', ' + '"'+ domain+'"' + ', ' + '"'+ mailid+'"' + ");";
    
    exec(conn,query);
    close(conn)
    clear conn query
end 