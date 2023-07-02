function data = getAllCandidates() 
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
    
    query = "SELECT * FROM Candidates;";
    
    data = fetch(conn,query);
    close(conn)
    clear conn query
end