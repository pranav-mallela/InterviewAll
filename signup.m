function signup (name, department, domain, mailid)
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
    
    defaultStatus = "Idle";
    query = "INSERT INTO Interviewer" + department + " (Name, Department, Domain, Email, Status) VALUES (" +  '"'+name+'"' + ', ' + '"'+ department+'"' + ', ' + '"'+ domain+'"' + ', ' + '"'+ mailid+'"'+ ', ' + '"'+ defaultStatus+'"' + ");";
    exec(conn,query);
    close(conn)
    clear conn query
end 