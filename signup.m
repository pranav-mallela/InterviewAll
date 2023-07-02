function err = signup (name, department, domain, mailid, password)
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
    err = 0;
    hashedPassword = DataHash(password);

    defaultStatus = "Idle";
    try
        query = "INSERT INTO Interviewer" + department + " (Name, Department, Domain, Email, Status) VALUES (" +  '"'+name+'"' + ', ' + '"'+ department+'"' + ', ' + '"'+ domain+'"' + ', ' + '"'+ mailid+'"'+ ', ' + '"'+ defaultStatus+'"' + ");";
        exec(conn,query);
    
        query = "INSERT INTO Credentials VALUES (" + '"' + name + '"' + ',' + '"' + hashedPassword + '"' + ';';
        exec(conn,query)
    catch
        err = 1;
    end

    close(conn)
    clear conn query
end 