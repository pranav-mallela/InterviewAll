function err = makeAppointmentAndSendMail (CID, name, date, startTime, endTime)

    out = actxserver('outlook.Application');

    startTime = num2str(startTime);

    endTime = num2str(endTime);

    if(length(startTime) == 3)

        startTime = "0" + startTime;

    end

    if(length(endTime) == 3)

        endTime = "0" + endTime;

    end
    
    startTime = "" + startTime;
    endTime = "" + endTime;

    

    s_time = extract(startTime, 1) + extract(startTime, 2) + ":" + extract(startTime,3) + extract(startTime,4) + ":00";

    e_time = extract(endTime,1) + extract(endTime,2) + ":" + extract(endTime,3) + extract(endTime,4) + ":00";

    candidateMail = "";

    try

        appointment = out.CreateItem('olAppointmentItem');

        appointment.Subject = 'Your interview with mathworks';

        appointment.Body = "Hello, please find your interview schedule attached on " + date + " from " + s_time + " to " + e_time + ". The interview is tentatively an hour long.";

        conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
        query = "SELECT * FROM Candidates WHERE ID = " + '"' + CID + '"' + ';';
        data = fetch(conn, query);
        candidateMail = data.Email;

        temp_s_time = convertStringsToChars(s_time);
        temp_e_time = convertStringsToChars(e_time);
        temp_date = convertStringsToChars(date);

        appointment.Start = [temp_date,' ', temp_s_time];

        appointment.End = [temp_date,' ', temp_e_time];

        appointment.RequiredAttendees = name + '@mathworks.com';

        appointment.Save();

        appointment.Send

 

    catch

        err = 1;

    end

    

    

    mail = out.CreateItem('olMail');

    mail.Subject = 'Interview scheduled test';

    mail.To = name + '@mathworks.com';

    mail.Body = "Hello, please find your interview schedule attached on " + date + " from " + s_time + " to " + e_time + ". The interview is tentatively an hour long.";

    mail.BodyFormat = 'olFormatHTML';

    mail.attachments.Add(appointment);

 

    try

        mail.Send;

    catch

        err =1;

    end

 

    out.release;

end