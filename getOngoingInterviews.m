
function data = getOngoingInterviews(startTime,endTime)
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
    
    string t1 =  num2str(startTime);
    string t2 =  num2str(endTime);

    query = ['SELECT * FROM ScheduledInterviews ' ...
        'WHERE start_time >= ' + t1 + ' AND end_time <= '+ t2 + ';'];
    
    data = fetch(conn,query);
    close(conn)
    clear conn query
end 