
function addReview (id, iName, review, status)
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
    
    query = "SELECT * FROM InterviewerHR WHERE Name = " + '"' + iName + '"' + ';';
    data = fetch(conn,query);

    round = "Round3";

    if(isempty(data))
         query = "SELECT * FROM InterviewerTECH WHERE Name = " + '"' + iName + '"' + ';';
         data = fetch(conn,query);
         round = "Round1";

         if(isempty(data))
            round = "Round2";
         end 
    end

    query = "INSERT INTO Reviews (StudentID, Round,InterviewerName, Review, Status) VALUES (" +  '"'+id+'"' + ', ' + '"'+ round+'"' + ', ' + '"'+ iName+'"' + ', ' + '"'+ review+'"' + ', '+ '"'+ status+'"' + ");";
    
    exec(conn,query);
    close(conn)
    clear conn query
end 