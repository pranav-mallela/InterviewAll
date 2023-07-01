
function addReview (id, review, status)
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');

    query = "UPDATE Reviews SET Status = " + '"' + status + '"' + "Review =" + '"' + review + '"' + "WHERE StudentID = " + '"' + id + '"' + ';';
    
    execute(conn,query);
    close(conn)
    clear conn query
end 