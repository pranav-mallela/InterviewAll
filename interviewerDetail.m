
function [err, data] = interviewerDetail (name, dept)
     
    err = 0;

    try 
        conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
        
        
        query = "SELECT * FROM Interviewer"+dept+" WHERE Name = " + '"'+name+'"' + ';';
        
        data = fetch(conn,query);
    catch 
        err = 1;
    end 
    close(conn)
    clear conn query
end 