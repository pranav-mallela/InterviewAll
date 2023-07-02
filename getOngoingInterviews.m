
function [err, data] = getOngoingInterviews(startTime,endTime)
     
    err = 0;

    try 
        conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
       
        query = "SELECT * FROM ScheduledInterviews WHERE StartingTime >= " + '"' + startTime + '"' + " AND EndingTime <= "+ '"' + endTime + '"' + ';';
        
        data = fetch(conn,query);
    catch
        err = 1;
        data = [];
    end 
    
    close(conn)
    clear conn query
end 