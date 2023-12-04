function Leapyear = judgeLeapYear(year)
    Leapyear = 0;
    % Judge leap year
    if mod(year,4) == 0
        if mod(year,100) == 0
            if mod(year, 400) ==0
                Leapyear = 1;
            else 
                Leapyear = 0;
            end
        else
            Leapyear = 1;
        end
    end
end