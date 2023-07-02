function err = sendolmail(to,subject,body,attachments)

    err  = 0;
    h = actxserver('outlook.Application');
    mail = h.CreateItem('olMail');
    mail.Subject = subject;
    mail.To = to;
    mail.BodyFormat = 'olFormatHTML';
    mail.HTMLBody = body;
    
    if nargin == 4
        for i = 1:length(attachments)
            mail.attachments.Add(attachments{i});
        end
    end
    
    try
        mail.Send;
    catch 
        err = 1;
    end 
    
    h.release;

end