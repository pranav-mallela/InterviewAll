function scheduleInterview (interviewerName,startingTime,endingTime,StudentID,RoundNo)
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
    query = "INSERT INTO ScheduledInterviews VALUES (" +  '"'+interviewerName+'"' + ', ' + '"'+ StudentID+'"'+',' +  startingTime + ', ' + endingTime + ");";
    exec(conn,query);
    query = "UPDATE Candidates SET Round" + RoundNo + " =  " + '"' + "Ongoing" + '"' +  " WHERE ID = " + '"' + StudentID + '"' + ';';
    exec(conn,query);
    close(conn)
    clear conn query
end 