

function scheduler()
    conn = sqlite('\\mathworks\devel\sandbox\gagarwal\database\InterviewScheduler.db');
    query = 'SELECT Password FROM Credentials WHERE Username=="Date";';
    date = fetch(conn,query);
    query = 'SELECT * FROM Candidates WHERE Round1=="Not Completed";';
    a = fetch(conn,query);
    query = 'SELECT * FROM Candidates WHERE Round1<>"Not Completed" and Round2=="Not Completed";';
    b = fetch(conn,query);
    query = 'SELECT * FROM Candidates WHERE Round1<>"Not Completed" and Round2<>"Not Completed" and Round3=="Not Completed";';
    c = fetch(conn,query);
    Candidates=[a;b;c];
    date=date.Password;
    %class(date)
    
    % FLAG: also check if the starting time is greater than starting time of
    % interviewer.
    % Scheduling Priority - TECH -> HR -> MG

    time=datetime("now","Format","HHmm");
    time=string(time);
    time=str2num(time);

    today=datetime("now","Format","yyyy-MM-dd");
    today=string(today);

    % Queries to remove slots with ST >= current time
    if(today==date)
        query = "DELETE FROM FreeInterviewerTECH WHERE StartingTime <=" + '"' + time + '"' + ";";
        exec(conn,query);
        query = "DELETE FROM FreeInterviewerHR WHERE StartingTime <=" + '"' + time + '"' + ";";
        exec(conn,query);
        query = "DELETE FROM FreeInterviewerMG WHERE StartingTime <=" + '"' + time + '"' + ";";
        exec(conn,query);
    end
    % Extract Free and active Interview slots
    query = 'SELECT * FROM FreeInterviewerTECH WHERE Active == "Yes" ORDER by StartingTime;';

    iTech = fetch(conn,query);

    query = 'SELECT * FROM FreeInterviewerHR  WHERE Active == "Yes" ORDER by StartingTime;';

    iHR = fetch(conn,query);

    query = 'SELECT * FROM FreeInterviewerMG WHERE Active == "Yes" ORDER by StartingTime;';

    iMG = fetch(conn,query);

    [rows, ~]=size(Candidates);
    interviewer=1;
    for i=1:rows
        if(Candidates.Status(i) =="No Go" || Candidates.Round1(i) == "Ongoing" || Candidates.Round2(i) == "Ongoing" || Candidates.Round3(i) == "Ongoing")
            continue;
        end
        if(~isempty(iTech))
            if(Candidates.Round1(i) ~= "TECH" && Candidates.Round2(i) ~= "TECH" && Candidates.Round3(i) ~= "TECH")
                for interviewer = 1:size(iTech)
                    interviewerName = iTech.InterviewerName(interviewer);
                    [~,interviewerDetails] = interviewerDetail(interviewerName, "TECH");
                    if Candidates.Domain(i) == interviewerDetails.Domain(1)
                        roundNo = findRound(Candidates(i,:));
                        scheduleInterview(interviewerName,iTech.StartingTime(interviewer),iTech.EndingTime(interviewer),Candidates.ID(i),roundNo);
                        [~] = makeAppointmentAndSendMail(Candidates.ID(i),interviewerName,date,iTech.StartingTime(interviewer),iTech.EndingTime(interviewer));
                        popFreeInterviewer(interviewerName,iTech.StartingTime(interviewer),iTech.Department(interviewer));
                        iTech(interviewer,:)=[];
                        break;
                    end
                end
            end
           
           
        interviewer=1;
        elseif(~isempty(iHR))
            if(Candidates.Round1(i) ~= "HR" && Candidates.Round2(i) ~= "HR" && Candidates.Round3(i) ~= "HR")
                interviewerName = iHR.InterviewerName(1);
                roundNo = findRound(Candidates(i,:));
                scheduleInterview(interviewerName,iHR.StartingTime(interviewer),iHR.EndingTime(interviewer),Candidates.ID(i),roundNo);
                makeAppointmentAndSendMail(Candidates.ID(i),interviewerName,date,iHR.StartingTime(interviewer),iHR.EndingTime(interviewer));
                popFreeInterviewer(interviewerName,iHR.StartingTime(interviewer),iHR.Department(interviewer));
                iHR(interviewer,:)=[];
            end
        elseif(~isempty(iMG))
            if(Candidates.Round1(i) ~= "MG" && Candidates.Round2(i) ~= "MG" && Candidates.Round3(i) ~= "MG")
                interviewerName = iMG.InterviewerName(1);
                roundNo = findRound(Candidates(i,:));
                scheduleInterview(interviewerName,iMG.StartingTime(interviewer),iMG.EndingTime(interviewer),Candidates.ID(i),roundNo);
                makeAppointmentAndSendMail(Candidates.ID(i),interviewerName,date,iMG.StartingTime(interviewer),iMG.EndingTime(interviewer));
                popFreeInterviewer(interviewerName,iMG.StartingTime(interviewer),iMG.Department(interviewer));
                iMG(interviewer,:)=[];
            end
        else
            break;
        end
    end
  
    close(conn)
    clear conn query
end



function RoundNo = findRound(Candidate)
    if(Candidate.Round1 =="Not Completed")
        RoundNo = 1;
    elseif Candidate.Round2  == "Not Completed"
        RoundNo = 2;
    elseif Candidate.Round3  == "Not Completed"
        RoundNo = 3;
    end
end


