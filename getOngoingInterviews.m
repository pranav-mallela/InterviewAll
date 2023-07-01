
function data = getOngoingInterviews(startTime,endTime)
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
   
    query = "SELECT * FROM ScheduledInterviews WHERE StartingTime >= " + '"' + startTime + '"' + " AND EndingTime <= "+ '"' + endTime + '"' + ';';
    
    data = fetch(conn,query);
    close(conn)
    clear conn query
end 