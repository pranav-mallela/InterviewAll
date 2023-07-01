function n = login (name,email)
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
    
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
     
    close(conn)
    clear conn query
end 