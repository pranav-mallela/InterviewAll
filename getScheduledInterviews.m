
function data = getScheduledInterviews(iName) 
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
    query = ["SELECT ScheduledInterviews.StartingTime, ScheduledInterviews.EndingTime, Candidates.Name, Candidates.Domain, Candidates.Department, ScheduledInterviews.Round1, ScheduledInterviews.Round2, ScheduledInterviews.Round3 FROM " ...
        "Candidates JOIN ScheduledInterviews ON Candidates.ID = ScheduledInterviews.StudentID WHERE ScheduledInterviews.InterviewerName = " + '"' + iName+ '"' + ';'];
    data = fetch(conn,query);
    
    close(conn)
    
    clear conn query
end