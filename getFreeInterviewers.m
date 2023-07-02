function getFreeInterviewers(name, date) %yyyy-mm-dd
    h = actxserver('Outlook.Application');
    namespace = h.GetNamespace('MAPI');
    calendars = namespace.GetDefaultFolder(9); 
   
    items = calendars.Items;
    
    filteredItems = items.Restrict(['[Start] >= ''' date ' 00:00 AM''' ' AND [End] <= ''' date ' 11:59 PM''']);
    
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
    

    query = "SELECT * FROM InterviewerHR WHERE Name = " + '"' + name + '"' + ';';
    data = fetch(conn,query);

    dept = "HR";

    if(isempty(data))
         query = "SELECT * FROM InterviewerTECH WHERE Name = " + '"' + name + '"' + ';';
         data = fetch(conn,query);
         dept = "TECH";
   

         if(isempty(data))
            dept = "MG";

         end 
    end


    for i = 1 : filteredItems.Count
        meeting = filteredItems.Item(i);
        time = (meeting.Start);
        temp = split(time, " ");
        temp = split(temp(2), ":");
        he = "";
        he = he + temp(1);
        he = he + temp(2);
        
        startTime = he;
           
        time = (meeting.End);
        temp = split(time, " ");
        temp = split(temp(2), ":");
        he = "";
        he = he + temp(1);
        he = he + temp(2);
        disp(he)

        endTime = he;
           
        query = "INSERT INTO FreeInterviewer" + dept + " VALUES (" +  '"'+name+'"' + ', ' + '"'+ startTime+'"' + ', ' + '"'+ endTime+'"' + ', ' + '"'+ dept+'"' + ");";
        
        exec(conn, query)
    end
    
    close(conn)
    clear conn query
    h.release; 
end