function [err, data] = getPassedCandidates()
    
    err = 0;
    try
        conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
    
        query = "SELECT Name, ID, Status, Round1, Round2, Round3, Domain, Email FROM Candidates " + ...
            "WHERE Round1<>" + '"Ongoing" ' + "AND Round2<>" + '"Ongoing" '+ "AND Round3<>" + '"Ongoing" '+ "AND Round1<>" + '"Not Completed" ' + "AND Round2<>" + '"Not Completed" '+ "AND Round3<>" + '"Not Completed" ' + ';';
        disp(query)
        data = fetch(conn,query);
    catch
        err = 1;
        data = [];
    end 
    
    close(conn)
    clear conn query

end