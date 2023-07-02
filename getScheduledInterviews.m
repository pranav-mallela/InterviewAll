
function [err, data] = getScheduledInterviews(iName) 
    
    err = 0;

    try 
        conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
        query = "SELECT ScheduledInterviews.StartingTime, ScheduledInterviews.EndingTime, Candidates.Name, Candidates.ID, Candidates.Domain, Candidates.Department, Candidates.Round1, Candidates.Round2, Candidates.Round3 FROM " ...
            + "Candidates JOIN ScheduledInterviews ON Candidates.ID = ScheduledInterviews.StudentID WHERE ScheduledInterviews.InterviewerName = " + '"' + iName+ '"' + ';';
        data = fetch(conn,query);
    catch 
        err = 1;
        data = [];
    end 
    
    close(conn)
    
    clear conn query
end