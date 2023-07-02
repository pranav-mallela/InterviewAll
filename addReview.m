function err = addReview (id, iName, review, status)
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
    err = 0;

    try 
        query = "SELECT * FROM InterviewerHR WHERE Name = " + '"' + iName + '"' + ';';
        data = fetch(conn,query);
        round = "HR";
    catch 
        err = 1;
    end 

    if(isempty(data))
        try 
             query = "SELECT * FROM InterviewerTECH WHERE Name = " + '"' + iName + '"' + ';';
             data = fetch(conn,query);
             round = "TECH";
        catch 
             err = 1;
        end 

         if(isempty(data))
            round = "MG";
         end 
    end
    
    try 
        query = "INSERT INTO Reviews (StudentID, Round,InterviewerName, Review, Status) VALUES (" +  '"'+id+'"' + ', ' + '"'+ round+'"' + ', ' + '"'+ iName+'"' + ', ' + '"'+ review+'"' + ', '+ '"'+ status+'"' + ");";
        exec(conn,query);
    catch 
        err = 1;
    end 

    query = "SELECT * FROM Candidates WHERE ID = " + '"' + id + '"' + ';';
    data = fetch(conn, query);

    candidateRound = "Round1";

    if(data.Round1 == "Not Completed")
        candidateRound = "Round1";
    elseif(data.Round2 == "Not Completed")
        candidateRound = "Round2";
    else 
        candidateRound = "Round3";
    end 
    
    try
        query = "UPDATE Candidates SET " + '"' + candidateRound + '"' + ' = ' +  '"' + round + '"' + " WHERE ID = " + '"' + id + '"' + ';';
        exec(conn, query)
    catch 
        err = 1;
    end 
    
    try 
        query = "DELETE FROM ScheduledInterviews WHERE Interviewer = " + '"' + iName + '"' + " AND StudentID = " + '"' + id + '"' + ';';
        exec(conn,query)
    catch 
       err = 1;
    end 

    close(conn)
    clear conn query
end 