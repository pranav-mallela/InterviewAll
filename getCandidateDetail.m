
function data = getCandidateDetail(name)
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');

    query = "SELECT Name, ID, Status, Round1, Round2, Round3, Domain, Email FROM Candidates WHERE Name = " + '"' + name + '"' + ';';
    
    data = fetch(conn,query);
    close(conn)
    clear conn query
end 