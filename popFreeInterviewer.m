function popFreeInterviewer(InterviewerName,StartingTime,department)
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
    query = "DELETE FROM FreeInterviewer" + department + " WHERE InterviewerName =" + '"' + InterviewerName + '"' + "AND StartingTime = "  + StartingTime + ";";
    exec(conn,query);
    close(conn)
    clear conn query
end