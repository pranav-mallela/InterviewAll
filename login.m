function n = login (name,email, password)
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
    
    hashedPassword = dataHash(password);

    n = -1;
    
    query = "SELECT * FROM Admin Where Name = " + '"' + name + '"' + " AND Email = " + '"' + email + '"' + ';';
    data = fetch(conn,query);
    if(isempty(data)) 

        query = "SELECT * FROM InterviewerTECH Where Name = " + '"' + name + '"' + 'AND Email = ' + '"' + email + '"' + ';';
        data = fetch(conn,query);
        if(isempty(data))
            
            query = "SELECT * FROM InterviewerHR Where Name = " + '"' + name + '"' + 'AND Email = ' + '"' + email + '"' + ';';
            data = fetch(conn,query);

            if(isempty(data)) 
                   query = "SELECT * FROM InterviewerMG Where Name = " + '"' + name + '"' + 'AND Email = ' + '"' + email + '"' + ';';
                   data = fetch(conn,query);
                   if(isempty(data))
                       n = -1
                   else 
                       n = 0
                   end
           
            else 
                n = 0
            end 
        else
            n = 0
        end 
    else
        n = 1
    end 

    query = "SELECT * FROM Credentials WHERE Username = " + '"' + name + '"' + ';';
    data = fetch(conn, query);

    if(data.Password ~= hashedPassword) 
        n = -2;
    end
    
     
    close(conn)
    clear conn query
end 