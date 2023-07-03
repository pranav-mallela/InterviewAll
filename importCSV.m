function error = importCSV(path)
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
    error="Successfully Added";
    try
        data=readtable(path);
    catch
        error="Wrong Path Specified";
    end

    try
        sqlwrite(conn,'Candidates',data)
    catch
        error="Invalid Data Supplied";
    end
    
    close(conn)
    
    clear conn
    
end