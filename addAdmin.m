
function err = addAdmin (name,email)
    err = 0;

    try 
        conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
        
        
        query = "INSERT INTO admin (name, email) VALUES (" +  '"'+name+'"' + ', ' + '"'+ email+'"' + ");";
        
        exec(conn,query);
    catch 
        err = 1;
    end 
    
    close(conn)
    clear conn query
end 