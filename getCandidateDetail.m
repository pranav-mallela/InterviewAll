
function data = getCandidateDetail(name)
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');

    query = "SELECT * FROM Candidates WHERE Name = " + '"' + name + '"' + ';';
    
    data = fetch(conn,query);
    close(conn)
    clear conn query
end 