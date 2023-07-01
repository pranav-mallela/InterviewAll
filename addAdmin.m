
function data = addAdmin (name,email)
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
    
    
    query = "INSERT INTO admin (name, email) VALUES (" +  '"'+name+'"' + ', ' + '"'+ email+'"' + ");";
    
    data = fetch(conn,query);
    close(conn)
    clear conn query
end 