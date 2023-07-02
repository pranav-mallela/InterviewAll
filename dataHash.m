function encryptedText = dataHash(text)
    
    shift = 5;
    
    asciiValue = text{1};
    shiftedAsciiValue = asciiValue + shift;
    
    encryptedText = char(shiftedAsciiValue);
      
    

end