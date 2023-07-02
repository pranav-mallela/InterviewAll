function err = getFreeInterviewers(name, date) %yyyy-mm-dd
    h = actxserver('Outlook.Application');
    namespace = h.GetNamespace('MAPI');
    calendars = namespace.GetDefaultFolder(9); 
   
    items = calendars.Items;
    data = [];
    date = convertStringsToChars(date);
    filteredItems = items.Restrict(['[Start] >= ''' date ' 00:00 AM''' ' AND [End] <= ''' date ' 11:59 PM''']);

    try
        conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
        
    
        query = "SELECT * FROM InterviewerHR WHERE Name = " + '"' + name + '"' + ';';
        data = fetch(conn,query);
        dept = "HR";
    catch 
        err = 1;
    end 

   
    if(isempty(data))
        try
             query = "SELECT * FROM InterviewerTECH WHERE Name = " + '"' + name + '"' + ';';
             data = fetch(conn,query);
             dept = "TECH";
        catch 
            err = 1;

        end 
   

         if(isempty(data))
            dept = "MG";

         end 
    end

    int_startTime = 900;

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

        endTime = he;

        freeSlots = [];
        startTime = str2double(startTime);
        endTime = str2double(endTime);
        if(int_startTime < startTime)
            if(endTime <= 1800)
                temp = endTime;
                while(temp - int_startTime >= 100) 
                    
                    freeSlots = [freeSlots, [int_startTime, int_startTime + 100]]
                    int_startTime = int_startTime + 100;
                end 
            end
        end
                
        disp(size(freeSlots))
        for j = 1 : 2 : size(freeSlots)
            st  = freeSlots(j);
            en = freeSlots(j+1);

                try 
                    query = "INSERT INTO FreeInterviewer" + dept + " VALUES (" +  '"'+name+'"' + ', ' + '"'+ st+'"' + ', ' + '"'+ en+'"' + ', ' + '"'+ dept+'"' + ");";
                    
                    exec(conn, query)
                catch 
                        err = 1;
                end 
        end

        int_startTime = endTime;

    end
    
    scheduler();
    
    close(conn)
    clear conn query
    h.release; 
end