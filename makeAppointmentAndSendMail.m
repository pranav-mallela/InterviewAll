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

    s_time = startTime(1) + startTime(2) + ":" + startTime(3) + startTime(4) + ":00";

    e_time = endTime(1) + endTime(2) + ":" + endTime(3) + endTime(4) + ":00";

    candidateMail = "";

    try

        appointment = out.CreateItem('olAppointmentItem');

        appointment.Subject = 'Your interview with mathworks';

        appointment.Body = "Hello, please find you interview shedule attached on " + date + " from " + s_time + " to " + e_time + ". The interview is tentatively an hour long.";

        conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
        query = "SELECT * FROM Candidates WHERE ID = " + '"' + CID + '"' + ';';
        data = fetch(conn, query);
        candidateMail = data.Email;

        appointment.Start = date + s_time;

        appointment.End = date + e_time;

        appointment.RequiredAttendees = name + '@mathworks.com';

        appointment.Save();

        appointment.Send

 

    catch

        err = 1;

    end

    

    

    mail = out.CreateItem('olMail');

    mail.Subject = 'Interview schduled test';

    mail.To = name + '@mathworks.com';

    mail.Body = "Hello, please find you interview shedule attached on " + date + " from " + s_time + " to " + e_time + ". The interview is tentatively an hour long.";

    mail.BodyFormat = 'olFormatHTML';

    mail.attachments.Add(appointment);

 

    try

        mail.Send;

    catch

        err =1;

    end

 

    out.release;

end