function [err, data] = getDegree(id) 
    err = 0;
    data = [];

    try 
        conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
        
        query = "SELECT Degree FROM Education WHERE ID = " + '"' + id + '"' + ';';
        data = fetch(conn,query);

        close(conn)
        clear conn query

    catch
        err = 1;
    end 

   

end