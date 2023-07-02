
function err = addAdmin (name,email, password)
    err = 0;
    hashedPassword = dataHash(password);

    try 
        conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
        
        
        query = "INSERT INTO admin (name, email) VALUES (" +  '"'+name+'"' + ', ' + '"'+ email+'"' + ");";
        exec(conn,query);

        query = "INSERT INTO Credentials VALUES (" + '"' + name + '"' + ',' + '"' + hashedPassword + '")' + ';';
        exec(conn,query)

    catch 
        err = 1;
    end 
    
    close(conn)
    clear conn query
end 