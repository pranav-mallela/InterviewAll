function [err, data] = getAllCandidates() 
    err = 0;
    try 
        conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
        
        query = "SELECT * FROM Candidates;";
        
        data = fetch(conn,query);
    catch
        err = 1;
        data = [];
    end 

    close(conn)
    clear conn query
end