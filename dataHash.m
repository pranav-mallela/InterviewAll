function encryptedText = dataHash(hi)
    
    n=double(char(hi));
    encryptedText = "";
    for i = 1:strlength(hi)

        encryptedText = encryptedText+int2str(n(i))+5;

    end
    encryptedText = num2str(encryptedText);
      
end