function signup (name, department, domain, mailid, password)
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
    
    hashedPassword = DataHash(password);

    defaultStatus = "Idle";
    query = "INSERT INTO Interviewer" + department + " (Name, Department, Domain, Email, Status) VALUES (" +  '"'+name+'"' + ', ' + '"'+ department+'"' + ', ' + '"'+ domain+'"' + ', ' + '"'+ mailid+'"'+ ', ' + '"'+ defaultStatus+'"' + ");";
    exec(conn,query);

    query = "INSERT INTO Credentials VALUES (" + '"' + name + '"' + ',' + '"' + hashedPassword + '"' + ';';
    exec(conn,query)
    
    close(conn)
    clear conn query
end 